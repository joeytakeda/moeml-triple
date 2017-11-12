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

## The Principle of Entropy Fallacy

* Increased amount of data = increase of amount of information
* Increased interlinking = increased information

## Data Integration

* Information is generated through eclusion using meaningful distictions
* Linked data can function as a medium for generating meaningful statements about data

## Ontology

* conceptual model: a formally defined model resulting from an analysis of a specific domain
* the design of a conceptual model is in itself a scholarly activity
* Combining existing ontologies uncritically makes connections that could be fallacious
* Formalized knowledge
* Clearly defined
   * Concepts
   * Relationships
* Processed by machines *and* people

### Conceptualization

* Arena 
* Purpose
* Intention
   * Identity
   * Substance
   * Unity
   * Existence
* Potential

## Classes

* Category of items that have common traits; defined by a scope note, describing the intention
* Individual items are "instances" not concepts
* "Open" set
   * Open World
   * Extension
* Scientific realism

## CRM-method Properties

* Relationship between two classes
   * Defined by scope note
   * Intention
* Domain and Range
   * Arbitrary choice
   * Bi-directional
* Properties of properties
   * Allows typing

## Types of relationships

* Identification of items by names
* Observation and classification
* Part-decomposition
   * Objects, periods and places
* Participation of persistent items in temporal entities
   * creates a nation of history
* Location
   * periods in space-time
   * physical objects in space
* Influence of
   * objects on activities
   * activites on objects
* Reference of information objects
   * to anything

Would each "place" be a concept (similar to the idea of a "work") that exists under various names at various times? 

## Multiple Instantiation

* Items needs more classes
   * Animal, Vegetable, Mineral
       * Wooden handled iron knife with bone inlay
* Museum gains object
   * E8 Acquisition
   * E9 Move
   * E10 Transfer of Custody
   
## What is a place

* A place is an extent in space, determined diachronically with regard to a larger, persistent constellation of matter, often continents by coordinates, geophysical features, aretfacts ... not identical to:
* A CRM Place is not a landscape, not a set -- it is an abstraction from temporal changes
* A means to reason about the "where" in multiple reference systems
