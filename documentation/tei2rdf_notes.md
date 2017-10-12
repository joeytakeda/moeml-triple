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


**Note for JT**: Don't use the gazetteer file because it's more a display file than anything (and it has too much data, I think). Use the spelling variants file.

The TEI RDF stylesheets haven't been worked on since 2014, but it looks as though there was some use of `<equiv/>` for mapping TEI elements to CRM metadata. This might be a very well documented way of doing this, but I doubt it's extensible.

The TEI RDF stylesheets also don't have any way of handling `<listRelation/>`, which would likely be something helpful to create. 

Sample `<listRelation>`:

```
<listRelation>
<relation ref="http://www.geonames.org/ontology/documentation.html#alternateName"
 mutual="http://mapoflondon.uvic.ca/ABBE2.htm http://mapoflondon.uvic.ca/spelling_variants.htm#spelling_variants_ABBE2_1"/>            </listRelation>
```

This should be fairly simple to produce into an RDF triple. A strategy for *Endings* might be to create anything we want into triples into `<listRelation>` and then have a fairly portable (if possible) way of creating `<listRelation>` into RDF.

This thread throws a bit of a monkey wrench in the `<listRelation>` plan: https://github.com/TEIC/TEI/issues/504. To summarize: `<relation>` should only be used for people-like relationships (married, children, etc). One should use `<arc>` and other graph/node like elements. More research to do here. This is a long conversation that follows up on #504: https://listserv.brown.edu/archives/cgi-bin/wa?A2=TEI-L;8c28af83.1604. To summarize: it's a question of what exactly we're trying to do, to whom will this be useful (or extensible), and where does this sort of work go? Are we just trying to create RDF or prototype a form of TEI-->RDF translation that is generic (I don't think so, at least). Or are we wanting to show that it can be done? 

TEI guidelines for Graphs and Trees (`<arc>`, `<node>`, etc), specifically the section on Family Trees: http://www.tei-c.org/release/doc/tei-p5-doc/en/html/GD.html#GDFT 

If we are to encode using Graphs and Trees, here's a very sketchy sample encoding, using the same example from `<listRelation>`. I *think* this would be how you could encode this using the graph system.

```
<graph>
               <node xml:id="ABBE2_graph1_origin" corresp="http://mapoflondon.uvic.ca/ABBE2.htm">
                  <label>Abchurch Lane</label>
               </node>
               <node xml:id="ABBE2_graph1_1" corresp="http://mapoflondon.uvic.ca/spelling_variants.htm#spelling_variants_ABBE2_1">
                  <label>Abchvch Lane</label>
               </node>
               <arc from="#ABBE2_graph1_1" to="#ABBE2_graph1_origin" corresp="http://www.geonames.org/ontology/documentation.html#alternateName">
                  <label>Alternate Name</label>
               </arc>
            </graph>
```

## Bibliography

https://jtei.revues.org/1480

https://jtei.revues.org/1191

https://jtei.revues.org/1365

http://tei.oucs.ox.ac.uk/Talks/2011-10-teimm/talk.xml