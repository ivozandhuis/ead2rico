#!/bin/bash

# installation:
# sudo npm install -g saxon-js
# sudo npm install -g xslt3

xslt3 -xsl:../xsl/ead2rico.xsl -s:input/NL-AmISG_ARCH00111.xml -o:output/NL-AmISG_ARCH00111.rdf -t
xslt3 -xsl:../xsl/process-ead-in-oai-envelope.xsl -s:input/NL-AmISG_ARCH03404-in-oai-envelope.xml -o:output/NL-AmISG_ARCH03404-in-oai-envelope.rdf -t