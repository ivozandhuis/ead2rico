# EAD2RICO

Transforms 
* Encoded Archival Description (EAD) 2002 XML format 
into 
* Records in Contexts Ontology 0.2 RDF/XML 
with the 
* XML Stylesheet Language Transformation (XSLT) 1.0.

## Usage
Use the stylesheet ead2rico.xslt, which imports all relevant sub-stylesheets.

The stylesheet should be usable with any XSLT 1.0 engine, but is tested with the Python port of SAXON-C Home Edition in ```run_examples.py```. To use this script pip-install: pathlib, saxonche and rdflib.

## Prerequisites
* The EAD-XML file must refer to the namespace of EAD.
* /ead:ead/ead:archdesc/ead:did/ead:unitid exists, with:
    * identifier of the archive as content
    * @repositorycode for the repository

## Documentation
The file mapping.md gives an overview of all EAD-elements and in which imported sub-stylesheet the element is transformed.

## Status
Not all elements are implemented yet, especially the difficult but important mixed-content elements (inline, names) need attention.

## Background
I did a first implementation for the Amsterdam City Archives, and am developping this now for the Finding Aids of the International Institute of Social History (Amsterdam).



