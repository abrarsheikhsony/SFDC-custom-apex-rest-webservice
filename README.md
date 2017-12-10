# Salesforce Custom Apex REST WebService (@RestResource annotation)

## Salesforce Trailhead
<a href="https://trailhead.salesforce.com/en/modules/apex_integration_services/units/apex_integration_webservices" target="_blank" alt="Apex Web Services">Apex Web Services</a><br/>

Here you will find the following details about Salesforce custom Apex REST Webservice.

<ol type="1">
<li>What does REST stand for?</li>
<li>How to create and expose an Apex REST Webservice?</li>
<li>Apex REST Webservice Annotations, Actions and Details</li>
<li></li>
<li>Considerations</li>
<li>Useful Resources</li>
</ol>

## What does REST stand for?

<ol type="1">
<li>REST stands for Representational State Transfer.</li>
<li>It returns response in <b>"JSON", "XML", "Custom"</b> format.</li>
</ol>

## How to create and expose an Apex REST Webservice?
<ol type="1">
<li>You can expose your Apex classes and methods by annotating your class with <b>"@RestResource(urlMapping='/yourUrl')"</b> annotation so that external applications can access your code and your application through the REST architecture.</li>
<li>An Apex class must be declared with access modifier <b>"global"</b>.</li>
<li>An Apex class method must be declared with access modifier <b>"global static"</b>.</li>
<li>Apex class methods must be annotated with one of the following annotations:
<ul>
<li>@HttpGet</li>
<li>@HttpPost</li>
<li>@HttpPatch</li>
<li>@HttpPut</li>
<li>@HttpDelete</li>
</ul>
</li>
<li>A single Apex class annotated with @RestResource can't have multiple methods annotated with the same HTTP request method. For example, the same class can't have two methods annotated with @HttpGet.</li>
<li>Methods annotated with @HttpGet or @HttpDelete should have no parameters. This is because GET and DELETE requests have no request body, so there's nothing to deserialize.</li>
<li>The base endpoint should always be: <b>https://yoursalesforceinstance.salesforce.com/services/apexrest/</b></li>
<li>The full endpoint will be: <b>https://yoursalesforceinstance.salesforce.com/services/apexrest/Account/</b> if the "urlMapping" will be: "/Account/*"</li>
<li>The URL mapping is case-sensitive and can contain a wildcard character (*).</li>
</ol>

## Apex REST Webservice Annotations, Actions and Details
<table>
	<tr>
		<th colspan="3">Apex REST Annotations, associated Actions and Details</th>
	</tr>
	<tr>
		<th>Annotation</th>
		<th>Action</th>
		<th>Details</th>
	</tr>
	<tr>
		<td>@HttpGet</td>
		<td>Read</td>
		<td>Reads or retrieves records.</td>
	</tr>
	<tr>
		<td>@HttpPost</td>
		<td>Create</td>
		<td>Creates records.</td>
	</tr>
	<tr>
		<td>@HttpPatch</td>
		<td>Update</td>
		<td>Typically used to update fields in existing records.</td>
	</tr>
	<tr>
		<td>@HttpPut</td>
		<td>Upsert</td>
		<td>Typically used to update existing records or create records.</td>
	</tr>
	<tr>
		<td>@HttpDelete</td>
		<td>Delete</td>
		<td>Deletes records.</td>
	</tr>
</table>



## Considerations
<ol type="1">
<li>Apex REST currently doesn't support requests of Content-Type multipart/form-data.</li>
<li>Calls to Apex REST classes count against the organization's API governor limits.</li>
<li>All standard Apex governor limits apply to Apex REST classes.</li>
<li></li>
</ol>

## Useful Resources
<ol type="a">
<li>https://trailhead.salesforce.com/en/modules/apex_integration_services/units/apex_integration_webservices</li>
<li>https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_annotations_rest.htm</li>
<li>https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_rest.htm</li>
<li>https://developer.salesforce.com/page/Creating_REST_APIs_using_Apex_REST</li>
</ol>
