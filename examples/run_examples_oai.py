#!/usr/bin/python3

from pathlib import Path
from saxonche import PySaxonProcessor
import rdflib

xsltproc = PySaxonProcessor(license=False).new_xslt30_processor()
executable = xsltproc.compile_stylesheet(stylesheet_file="../xsl/remove-oai-envelope.xsl")

src_path = Path("input")
for src_file in src_path.glob("**/*-in-oai-envelope.xml"):
    out_file = Path('output').joinpath(*src_file.parts[1:])
    out_file = out_file.with_suffix('.rdf')
    executable.transform_to_file(source_file=str(src_file), output_file=str(out_file))

    print("written: " + str(out_file))

    g = rdflib.Graph()
    g.parse(str(out_file))
    out_file = out_file.with_suffix('.ttl')
    g.serialize(destination=str(out_file))

    print("written: " + str(out_file))
