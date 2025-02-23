#!/usr/bin/python3

from pathlib import Path
from saxonche import PySaxonProcessor
import rdflib

xsltproc = PySaxonProcessor(license=False).new_xslt30_processor()
executable_rico    = xsltproc.compile_stylesheet(stylesheet_file="../rico/xsl/ead2rico.xsl")
executableOAI_rico = xsltproc.compile_stylesheet(stylesheet_file="../rico/xsl/process-ead-in-oai-envelope.xsl")
executable_sdo     = xsltproc.compile_stylesheet(stylesheet_file="../sdo/xsl/ead2sdo.xsl")
executableOAI_sdo  = xsltproc.compile_stylesheet(stylesheet_file="../sdo/xsl/process-ead-in-oai-envelope.xsl")


print("Test transforming EAD into RiC-O")
src_path = Path("input")
for src_file in src_path.glob("**/*.xml"):
    out_file = Path('output-rico').joinpath(*src_file.parts[1:])
    out_file = out_file.with_suffix('.rdf')
    if "-in-oai-envelope" in str(src_file):
        executableOAI_rico.transform_to_file(source_file=str(src_file), output_file=str(out_file))
    else:
        executable_rico.transform_to_file(source_file=str(src_file), output_file=str(out_file))
    print("written: " + str(out_file))

    g = rdflib.Graph()
    g.parse(str(out_file))
    out_file = out_file.with_suffix('.ttl')
    g.serialize(destination=str(out_file))

    print("written: " + str(out_file))


print("Test transforming EAD into Schema.org")
src_path = Path("input")
for src_file in src_path.glob("**/*.xml"):
    out_file = Path('output-sdo').joinpath(*src_file.parts[1:])
    out_file = out_file.with_suffix('.rdf')
    if "-in-oai-envelope" in str(src_file):
        executableOAI_sdo.transform_to_file(source_file=str(src_file), output_file=str(out_file))
    else:
        executable_sdo.transform_to_file(source_file=str(src_file), output_file=str(out_file))
    print("written: " + str(out_file))

    g = rdflib.Graph()
    g.parse(str(out_file))
    out_file = out_file.with_suffix('.ttl')
    g.serialize(destination=str(out_file))

    print("written: " + str(out_file))

