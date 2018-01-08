# TEI to RDF Plan

We have yet to decide whether or not we want to take the intermediate step of going from TEI to RDF. I think its a worthwhile exercise to be as transparent as possible about what we're attempting to do. If we are to do that intermediate step, I would suggest using the `<relation/>` element since that is what seems to be most favoured by Council. We should, however, double check with them/the Ontologies SIG to see what's going on with that.

What this might look like:

```
<relation ref="http://www.geonames.org/ontology/documentation.html#alternateName"
 mutual="http://mapoflondon.uvic.ca/ABBE2.htm http://mapoflondon.uvic.ca/spelling_variants.htm#spelling_variants_ABBE2_1"/> 
```

I think we'd want a number of these `<relation>` elements. So each place has a `<listRelation>` with child `<relation>`s. We will then have an XSLT that acts on the `<listRelation>` to get an RDF representation.

Otherwise, we might not want to do that at all. It might be simplest and fastest just to go straight from our TEI and magically turn it into RDF. A few times on the listServ the point has been made that it might give us no benefit to try and reinvent RDF straight into TEI. At this rate, just turn it into RDF, particularly since we're not trying to extract relationships from the texts that we don't already know about. In other words, the project, as much as it cares about its literary texts, has already down the data extraction work.

## Ontologies

Whether or not we take the intermediate step of TEI-->TEI-->RDF or just TEI-->RDF, the output should be the same. If we use Geonames as our ontology, then the necessary identifiers (? vocabularies??):


* `<gn:feature>`
* `<rdfs:isDefinedBy>`
* `<gn:name>`
* `<gn:alternateName>`
* `<gn:featureClass>`
* `<gn:featureCode>`
* `<gn:countryCode>`
* `<gn:parentFeature>`
* `<gn:parentCountry>`
* `<gn:locationMap>`

This isn't a perfect mapping here and we'll need to add/change some of these, but I think those are the main components. CountryCode will be redundant, but so be it. We'll also need so good historical dates/times...CIDOC-CRM has good dating methods, if geonames doesn't. We'll also need to determine how best to show the multiple geometries we have for the places. This ontology (http://www.opengis.net/ont/geosparql#) is used often, so that might be right. We might also want to see what Pelagios uses, since MH is working on the MoEML GeoJSON with them.


We'll also need to figure out metadata, which will likely be DC, I think. We already use it for generating metadata in our HTML, so it should be fairly easy.

Here's an example of what the RDF for ABCH1 might look like:

```
 <gn:Feature rdf:about="http://mapoflondon.uvic.ca/ABCH1.htm">
        <rdfs:isDefinedBy rdf:resource="http://mapoflondon.uvic.ca/xml/rdf/ABCH1.rdf"/>
        <gn:name>Abchurch Lane</gn:name>
        <gn:alternateName>Abchurch</gn:alternateName>
        <gn:alternateName>Abchurch Lane</gn:alternateName>
        <gn:alternateName>Abchurch lane</gn:alternateName>
        <gn:alternateName>Abchurch-lane</gn:alternateName>
        <gn:alternateName>Abchurche lane</gn:alternateName>
        <gn:alternateName>Apechurch</gn:alternateName>
        <gn:alternateName>Upchurch</gn:alternateName>
        <gn:alternateName>Vpchurch</gn:alternateName>
        <gn:featureClass rdf:resource="http://mapoflondon.uvic.ca/mdtEncyclopediaLocation.htm"/>
        <gn:featureCode rdf:resource="http://mapoflondon6.uvic.ca/mdtEncyclopediaLocationStreet.htm"/>
        <gn:countryCode>UK</gn:countryCode>
        <!--Taken from Geonames: http://sws.geonames.org/6956819/about.rdf-->        
        <gn:parentFeature rdf:resource="http://sws.geonames.org/2643744/"/>
        <gn:parentCountry rdf:resource="http://sws.geonames.org/2635167/"/>
        <gn:parentADM1 rdf:resource="http://sws.geonames.org/6269131/"/>
        <gn:parentADM2 rdf:resource="http://sws.geonames.org/2648110/"/>
        <gn:parentADM3 rdf:resource="http://sws.geonames.org/2643744/"/>
        <gn:parentCountry rdf:resource="http://sws.geonames.org/2635167"/>        
        <gn:map rdf:resource="http://mapoflondon.uvic.ca/agas.htm?locIds=ABCH1"/>                
    </gn:Feature>
```

## Questions

There are a number of questions about some of the elements we should be using:
* should we use `<gn:alternateName>` or `<gn:historicalName>` (historicalName)?
* should we use the gn taxonomy of features or our own?
* what ontology do we use for metadata?
* how should we embed geo information?
* Is GeoNames the correct ontology for us?
* How do we encode date specificity for alternateNames, for example?
* How do we link outwards to geonames if we have that information?
* Should we spend some time going through each of the locations (or a subset of them) to add links to them (to Wikipedia, dbpedia, geonames)?
* Should we include what places are mentioned in what documents? Do we want to be as granular as our table is?


