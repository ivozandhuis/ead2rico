# EAD2RICO

Transforms 
* Encoded Archival Description (EAD) 2002 XML format 
into 
* Records in Contexts Ontology 1.1 RDF/XML (1.1 is not yet released!)
with the 
* XML Stylesheet Language Transformation (XSLT) 1.0.

## Usage
* Use the stylesheet ead2rico.xsl, which imports all relevant sub-stylesheets.
* Use the stylesheet process-ead-in-oai-envelope.xsl if you extract your data with OAI-PMH, and want to process the raw OAI-response.

The stylesheets are intended to work with any XSLT 1.0 engine. 
1. Saxon
    1. Python with [saxonche](https://pypi.org/project/saxonche/): tested with run_examples_saxonche.py
    2. JavaScript with [saxon-js](https://www.npmjs.com/package/xslt3): tested with run_examples_xslt3.sh 
2. libxml2
    1. Python with [lxml](https://lxml.de/): tested with run_examples_lxml.py
    2. [xsltproc](http://xmlsoft.org/xslt/xsltproc.html): tested with run_examples_xsltproc.sh

## Prerequisites
* The EAD-XML file must refer to the namespace of EAD.
* /ead:ead/ead:archdesc/ead:did/ead:unitid exists, with:
    * identifier of the archive as content
    * @repositorycode for the repository

## Documentation
The file mapping.md gives an overview of all EAD-elements and in which imported sub-stylesheet the element is transformed.

## Some remarks
I tried to keep the RiC-O mapping simple. This means 
- I do not use Proxy-s
- I do not distinguish various Type-s (IdentifierType, RecordSetType, etc.)
- I do not distinguish various Name-s (AgentName, etc.)

## RiC-O classes and properties used

### Basic archival structure
- RecordSet
    - [relates to URI]
        - hasOrHadType
        - isOrWasIncludedIn
        - followsOrFollowed
        - hasOrHadInstantiation
    - [relates to BNODE]
        - hasOrHadIdentifier
        - hasOrHadTitle
        - hasExtent
        - hasAccumulationDate
        - hasOrHadMostMembersWithAccumulationDate
        - hasOrHadAllMembersWithAccumulationDate
        - hasOrHadSomeMembersWithLanguage
        - hasOrganicProvenance
        - hasOrHadLocation
        - hasOrHadHolder
        - hasOrHadSubject
    - [relates to Literal]
        - generalDescription
        - scopeAndContent
        - history
        - conditionsOfAccess
        - conditionsOfUse
        - recordResourceStructure
  
- Record
    - [relates to URI]
        - hasOrHadType [= Finding Aid]
        - describesOrDescribed
    - [relates to BNODE]
        - hasCreator
        - hasOrHadTitle
        - hasPublisher
        - hasPublicationDate
        - hasOrHadLanguage

- Instantiation
    - [relates to URI]
        - storedAt
    - [relates to Literal]
        - generalDescription

### Context
- Thing
- Agent
- Place
- CorporateBody
- Family
- Type

All might have the same property:
- hasOrHadName

### "Appellations"
- Identifier
- Name
- Title
- Extent
- Date
- Language

All might have the same properties:
- textualValue
- normalizedValue

## Acknowledgement
Part of this work was commissioned and paid for by:
* Amsterdam City Archives 
* International Institute of Social History (Amsterdam)

Ideas and corrections are made in interaction with:
* Triply (Amsterdam)
* Rijksmuseum (Amsterdam)
