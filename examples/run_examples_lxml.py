#! /usr/bin/env python3

import lxml.etree as etree

xslt = etree.parse("../xsl/ead2rico.xsl")
transform = etree.XSLT(xslt)

dom = etree.parse("input/NL-AmISG_ARCH00111.xml")

newdom = transform(dom)
rdfxml = etree.tostring(newdom, pretty_print=True)

f = open("output/NL-AmISG_ARCH00111.rdf","wb")
f.write(rdfxml)
f.close()
