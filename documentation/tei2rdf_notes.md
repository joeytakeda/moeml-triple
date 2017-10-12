# TEI to RDF conversion notes

From what I can tell from the JTEI articles and Rahtz's presentation notes, the TEI-RDF conversion is difficult and, usually, project specific.

The TEI has TEI->RDF stylesheets (in the GitHub repo and in oXygen's framework), but, from what I can understand about them, is that they take `<equiv/>` elements from the data and maps it to an ontology. This is similar to Cioti et al's conversion.

Of particular importance in Citio et al's article is their discussion of equivalences between TEI and RDF (https://jtei.revues.org/1365#tocto2n2). Their goals differ from ours, though, since they want to link their tagging of `<geogName>` as "textual instances" of an authority record. 

I think the best way to do this is to first create representations of the RDF data in TEI. At present, our gazetteer is a `<list>` with `<item>`s. I think these should actually be a `<listRelation>` with `<relation>` elements (see https://github.com/TEIC/TEI/issues/311 and https://github.com/TEIC/TEI/issues/1552). 

The pipeline looks like this:

TEI document --> TEI document with RDF-like representation --> RDF/Tutle/JSON (that's the easier part, I think).

I think that's fairly simply when it comes to the gazetteer. But what should we do about each individual document?

One suggestion that comes to mind is to the triple processing in our standalone creation. When we make standalone XML, we put all links to content in the document so that the document is coherent (more or less) if separated from the rest of the document collection. One of the benefits of creating the standalone XML is that it makes the transformation from TEI to HTML a bit more straightforward. We're not having to do a whole bunch of data aggregation etc at that step. So, should we be aggregating our variant placeNames them?

The way that we get the variant places names into our database is through our gazetteer. When we're converting the TEI to HTML, the XSLT sees if the document is a location. If it is, then we look for variant spellings in the gazetteer documents and then make a list in the header of the HTML document from that. 

One proposed workflow:

1. Determine the gazetteer to listRelation transformation (and make a suggestion to MDH that perhaps this is the way we should be encoding our gazetteer anyways. But this shouldn't happen for a while)
1. Determine what forms of aggregation need to happen to turn our documents into RDF. Each document needs to have its variant spellings, geo-coordinates, respStmts...should we also link it to geoNames authority records, if they exist? (This might be a good exercise in *using* RDF data for our purposes)
1. What is more useful: to have a gazetteer that has EVERYTHING in it (each place, and each place's coordiantes, rsps, etc) with each page's RDF representation just being a snippet from the gazetter? Or should each page's RDF representation offer more than what you could get from aggregating?



## Bibliography

https://jtei.revues.org/1480

https://jtei.revues.org/1191

https://jtei.revues.org/1365

http://tei.oucs.ox.ac.uk/Talks/2011-10-teimm/talk.xml