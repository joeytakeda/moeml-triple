# Ontologies Workshop

## The Challenge

* Collections (arts, cultural & natural history)
* Archives and literature: treaties, letters, poems
* Administration/preservation/conservation records
* Science and scholarship: investigation, interpretation
* Presentations: Exhibits, teaching, and publication

## The Requirements

* Understand history from relationships
   * between people, events and things
   * How to express these relationships?
* How to make a documentation standard?
   * Each aspect needs its own approach
   * Data overlap: common elements
   * Single schema: massive
* What is best for your purposes? RDF and TripleStores and relational databases

## Eight Basic Requirements for Data Integration

* Events
* Person
* Place
* Time/Date
* Physical Objects
* Conceptual Objects (the abstract concept of something)
   * Intellectual Property Rights (and likely then responsibility for the thing)
* Names or appelations
* Types

## Event Oriented Analysis

* Even though events seem more abstract than other entities, it is not necessarily so
* Relational between actors abstracts places actors time-span, feeding to and fro events

## CRM

* In collaboration with ICOM (Iternational Council of Museums)
* Event oriented (86 classes and 137 properties)
* Explains hundreds of data forms
* Started with ISO TC46 in 2000/09
* International standard ISO 21127:2014
* Ongoing maintenance program
* In use and based on actual documentation practice
* Varying degrees of detail
* Enables story telling / provenance of cultural objects
* Generalized :: msDesc
* Supports all information categories suggested by ObjectID (entangled with juridical standards)
* Is extendable!
* Design new systems
* Analysing existing systems
* in RDF-Technology, graph databases
* Semantic glue in linked data and linkable data

## Family

* CRM, CRMinf (argumentation model), CRMsci (scientific observation model), CRMArcheo (Archaeological excavation model), CRMdig (digital provenance model :: how we should keep track of digital objects), [CRMGeo](http://www.cidoc-crm.org/crmgeo/) (spatiotemporal)
   * CRMGeo and CRMdig and CRMArcheo might be the right combination of subsets to work ith for the project
   

## Examples

* history as a series of meetings
* E = class
* P = properties
* Think of E53 Place and the description in the CRMGEO spec
* We can use CRM for both matters of provenance as well as the "current events" of the object in the museum/archive

So, our URIs should keyed to an older version, perhaps? A date or an edition number?



