#! /usr/bin/env python3

from pathlib import Path
import lxml.etree as etree
import rdflib

xslt = etree.parse("../xsl/ead2rico.xsl")
executable = etree.XSLT(xslt)

xsltOAI = etree.parse("../xsl/process-ead-in-oai-envelope.xsl")
executableOAI = etree.XSLT(xsltOAI)

src_path = Path("input")
for src_file in src_path.glob("**/*.xml"):
    out_file = Path('output').joinpath(*src_file.parts[1:])
    out_file = out_file.with_suffix('.rdf')
    dom = etree.parse(src_file)
    if "-in-oai-envelope" in str(src_file):
        newdom = executableOAI(dom)
    else:
        newdom = executable(dom)

    rdfxml = etree.tostring(newdom, pretty_print=True)
    f = open(out_file,"wb")
    f.write(rdfxml)
    f.close()    
    print("written: " + str(out_file))

    g = rdflib.Graph()
    g.parse(str(out_file))
    out_file = out_file.with_suffix('.ttl')
    g.serialize(destination=str(out_file))

    print("written: " + str(out_file))