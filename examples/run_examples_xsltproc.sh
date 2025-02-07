#!/bin/bash

xsltproc ../rico/xsl/process-ead-in-oai-envelope.xsl input/NL-AmISG_ARCH03404-in-oai-envelope.xml > output/NL-AmISG_ARCH03404-in-oai-envelope.rdf 
xsltproc ../rico/xsl/ead2rico.xsl input/NL-AmISG_ARCH00111.xml > output/NL-AmISG_ARCH00111.rdf