#!/bin/bash

xsltproc ../xsl/process-ead-in-oai-envelope.xsl input/NL-AmISG_ARCH03404-in-oai-envelope.xml > output/NL-AmISG_ARCH03404-in-oai-envelope.rdf 
xsltproc ../xsl/ead2rico.xsl input/NL-AmISG_ARCH00111.xml > output/NL-AmISG_ARCH00111.rdf