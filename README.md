# Salesforce Custom Apex REST WebService (@RestResource annotation)

## Salesforce Trailhead
<a href="https://trailhead.salesforce.com/en/modules/apex_integration_services/units/apex_integration_webservices" target="_blank" alt="Apex Web Services">Apex Web Services</a><br/>

Here you will find the following details about Salesforce custom Apex REST Webservice.

<ol type="1">
<li>What does REST stand for?</li>
<li>How to create and expose an Apex REST Webservice?</li>
<li>What are the methods available in Apex REST Webservice?</li>
<li></li>
<li>Useful Resources</li>
</ol>

## What does REST stand for?

<ol type="1">
<li>REST stands for Representational State Transfer.</li>
<li>It returns response in "JSON", "XML", "Custom" format.</li>
</ol>

## How to create and expose an Apex REST Webservice?
<ol type="1">
<li>You can expose your Apex classes and methods by annotating your class with <b>"@RestResource(urlMapping='/yourUrl')"</b> annotation so that external applications can access your code and your application through the REST architecture.</li>
<li>An Apex class must be declared with access modifier "global".</li>
<li>An Apex class method must be declared with access modifier "global static".</li>
<li>Apex class methods must be annotated with one of the following annotations:
<ul>
<li>@HttpDelete</li>
<li>@HttpGet</li>
<li>@HttpPatch</li>
<li>@HttpPost</li>
<li>@HttpPut</li>
</ul>
</li>
<li></li>
</ol>






 

## Useful Resources
<ol type="a">
<li>https://trailhead.salesforce.com/en/modules/apex_integration_services/units/apex_integration_webservices</li>
<li>https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_annotations_rest.htm</li>
<li>https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_rest.htm</li>
<li>https://developer.salesforce.com/page/Creating_REST_APIs_using_Apex_REST</li>
</ol>
