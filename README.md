# EAD2RICO

Transforms 
* Encoded Archival Description (EAD) 2002 XML format 
into 
* Records in Contexts Ontology 0.2 RDF/XML 
with the 
* XML Stylesheet Language Transformation (XSLT) 1.0.

## Usage
* Use the stylesheet ead2rico.xsl, which imports all relevant sub-stylesheets.
* Use the stylesheet process-ead-in-oai-envelope.xsl if you extract your data with OAI-PMH, and want to process the raw OAI-response.

The stylesheets are intended to work with any XSLT 1.0 engine. 
1. Saxon
    1. Python with [saxonche](https://pypi.org/project/saxonche/): tested (run_examples_saxonche.py) and working
    2. JavaScript with [saxon-js](https://www.npmjs.com/package/xslt3): tested (run_examples_xslt3.sh) and working
2. libxml2
    1. Python with [lxml](https://lxml.de/): tested (run_examples_lxml.py) and working
    2. [xsltproc](http://xmlsoft.org/xslt/xsltproc.html): tested (run_examples_xsltproc.sh) and working

## Prerequisites
* The EAD-XML file must refer to the namespace of EAD.
* /ead:ead/ead:archdesc/ead:did/ead:unitid exists, with:
    * identifier of the archive as content
    * @repositorycode for the repository

## Documentation
The file mapping.md gives an overview of all EAD-elements and in which imported sub-stylesheet the element is transformed.

## Status
Not all elements are implemented yet, especially the difficult but important mixed-content elements (inline, names) need attention.

Order of RecordResources needs to be added.

## Acknowledgement
Part of this work was commissioned and paid for by:
* Amsterdam City Archives 
* International Institute of Social History (Amsterdam)

Ideas and corrections are made in interaction with:
* Triply (Amsterdam)
* Rijksmuseum (Amsterdam)
