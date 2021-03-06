# Salesforce Custom Apex REST WebService (@RestResource annotation)

## Salesforce Trailhead
<a href="https://trailhead.salesforce.com/en/modules/apex_integration_services/units/apex_integration_webservices" target="_blank" alt="Apex Web Services">Apex Web Services</a><br/>

Here you will find the following details about Salesforce custom Apex REST Webservice.

<ol type="1">
<li>What does REST stand for?</li>
<li>How to create and expose an Apex REST Webservice?</li>
<li>Apex REST Webservice Annotations, Actions and Details</li>
<li>Considerations</li>
<li>Connected Apps</li>
<li>How to create a Connected App</li>
<li>How to Test Custom Apex REST API?</li>
<li>Test (@isTest) class for Custom Apex REST API</li>
<li>Useful Resources</li>
</ol>

## (1) What does REST stand for?

<ol type="1">
<li>REST stands for Representational State Transfer.</li>
<li>It returns response in <b>"JSON", "XML", "Custom"</b> format.</li>
</ol>

## (2) How to create and expose an Apex REST Webservice?
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
<li>Invoking a custom Apex REST Web service method always uses system context.</li>
<li>Consequently, the current user's credentials are not used, and any user who has access to these methods can use their full power, regardless of permissions, field-level security, or sharing rules.</li>
<li>Apex class methods that are exposed through the Apex REST API don't enforce object permissions and field-level security by default.</li>
<li>Also, sharing rules (record-level access) are enforced only when declaring a class with the with sharing keyword. This requirement applies to all Apex classes, including to classes that are exposed through Apex REST API. To enforce sharing rules for Apex REST API methods, declare the class that contains these methods with the <b>"with sharing"</b> keyword.</li>
<li>A single Apex class annotated with @RestResource can't have multiple methods annotated with the same HTTP request method. For example, the same class can't have two methods annotated with @HttpGet.</li>
<li>Methods annotated with @HttpGet or @HttpDelete should have no parameters. This is because GET and DELETE requests have no request body, so there's nothing to deserialize.</li>
<li>The base endpoint should always be: <b>https://yoursalesforceinstance.salesforce.com/services/apexrest/</b></li>
<li>The full endpoint will be for Managed and Unmanaged packages:

<ul>
<li>Managed Package (if the "urlMapping" is "/MyRestResource/*") = https://instance.salesforce.com/services/apexrest/packageNamespace/MyRestResource/</li>
<li>Unmanaged Pacakge (if the "urlMapping" is "/Account/*") = https://yoursalesforceinstance.salesforce.com/services/apexrest/Account/</li>
</ul>

</li>
<li>The URL mapping is case-sensitive and can contain a wildcard character (*).</li>
</ol>

## (3) Apex REST Webservice Annotations, Actions and Details
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



## (4) Considerations
<ol type="1">
<li>Apex REST currently doesn't support requests of Content-Type multipart/form-data.</li>
<li>If you need to specify a null value for one of your parameters in your request data, you can either omit the parameter entirely or specify a null value. In JSON, you can specify null as the value. In XML, you must use the http://www.w3.org/2001/XMLSchema-instance namespace with a nil value.</li>
<li>For request data in either JSON or XML, valid values for Boolean parameters are: true, false (both of these are treated as case-insensitive), 1 and 0 (the numeric values, not strings of “1” or “0”). Any other values for Boolean parameters result in an error.</li>
<li>Calls to Apex REST classes count against the organization's API governor limits.</li>
<li>All standard Apex governor limits apply to Apex REST classes.</li>
</ol>

## (5) Connected Apps
A <a href="https://help.salesforce.com/articleView?id=connected_app_overview.htm" target="_blank" alt="connected app">connected app</a> integrates an application with Salesforce using APIs. Connected apps use standard SAML and OAuth protocols to authenticate, provide single sign-on, and provide tokens for use with Salesforce APIs. In addition to standard OAuth capabilities, connected apps allow Salesforce admins to set various security policies and have explicit control over who can use the corresponding apps.

Salesforce uses the OAuth protocol to allow users of applications to securely access data without having to reveal username and password credentials. Supported <a href="https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/intro_understanding_authentication.htm" target="_blank" alt="OAuth flows">OAuth flows</a> include:
<ol type="1">
<li><b>Web server flow</b>, where the server can securely protect the consumer secret.</li>
<li><b>User-agent flow</b>, used by applications that cannot securely store the consumer secret.</li>
<li><b>Username-password flow</b>, where the application has direct access to user credentials.</li>
</ol>

## (6) How to create a Connected App
To create a connected app:
<ol type="1">
<li>Go to <b>Setup > App Setup > Create > Apps > in "Connected Apps" section > click New</b></li>
<li><img src="supportedimages/connectedapp1.png" /></li>
<li><img src="supportedimages/connectedapp2.png" /></li>
<li><img src="supportedimages/connectedapp3.png" /></li>
</ol>

## (7) How to Test Custom Apex REST API?
For Testing purpose you can use following publicly available services. Most of them are free!
<ol type="1">
<li>Advanced REST Client (https://chrome.google.com/webstore/detail/advanced-rest-client/hgmloofddffdnphfgcellkdfbfbjeloo)</li>
<li>Salesforce Workbench (https://workbench.developerforce.com/login.php)</li>
</ol>
In this example:
<ol type="1">
<li>"Advanced REST Client (a chrome browser extension)" has been used for testing the Apex REST Service</li>
<li>"Username-Password OAuth Authentication Flow" for authentication the user using Connected App</li>
</ol>

### OAuth Authentication
Follow these steps to test an Apex custom REST service:
<ol type="1">
<li>Install <a href="https://chrome.google.com/webstore/detail/advanced-rest-client/hgmloofddffdnphfgcellkdfbfbjeloo" target="_blank" alt="Advanced REST Client">Advanced REST Client</a></li>
<li>Logged In into Advanced REST Client</li>
<li><img src="supportedimages/ARC1.png" /></li>
<li>Authenticate User using Connected App (Callback URL, Consumer Key (client_id), Consumer Secret (client_secret)) and Username-Password OAuth Authentication flow. Set the values in Advanced REST Client as below:</li>
<ul>	
<li>HTTP Method = POST</li>
<li>HTTP Request URl = https://login.salesforce.com/services/oauth2/token</li>
<li>grant_type = password</li>
<li>client_id = Consumer Key (client_id) from your Connected App</li>
<li>client_secret = Consumer Secret (client_secret) from your Connected App</li>
<li>username = Your Salesforce Username</li>
<li>password = Your Salesforce UserPassword concatenate with Security Token</li>
<li>The complete URL should look like as this = https://login.salesforce.com/services/oauth2/token?grant_type=password&client_id={Consumer Key}&client_secret={Consumer Secret}&username=test@salesforce.com&password={password+securitytoken}</li>
<li><img src="supportedimages/ARC2.png" /></li>
</ul>
<li>Click Send</li>	
<li>You will get a response by Salesforce</li>
<li>

```
{
	"access_token": "00ABC90000000gNcm!ARcAQOxof.l34GtM3iLpD.hSfBZHGTEIbV9BtEsfP4VeomlgsLL84unDpah8._3l9o59W7JgzzHBO5fGNto2NtTt8k_v526o",
	"instance_url": "https://ap1.salesforce.com",
	"id": "https://login.salesforce.com/id/00ABC90000000gNcmEAE/00590000000cLaiABC",
	"token_type": "Bearer",
	"issued_at": "9994123281476",
	"signature": "abcADhXpEx0ZwvR+9OGLc+A2ki/57L4NOLNh1KQLbWI="
}
```
</li>
<li><img src="supportedimages/ARC3.png" /></li>
</ol>

### Read a Record with "@HTTPGet" Method
#### Return Standard Account Record
<ol type="1">
<li><img src="supportedimages/HttpGet.png" /></li>
<ul>
<li><b>Note: Both 15 or 18 Digit Salesforce Record Id works!</b></li>	
<li>HTTP Method = GET</li>	
<li>instance_url"/services/apexrest/AccountRESTService/{Salesforce AccountId Here}"</li>
<li>URL = https://ap1.salesforce.com/services/apexrest/AccountRESTService/0019000001KwyWt</li>
<li>Authorization = Bearer(space)access_token</li>
<li>Authorization = Bearer 00ABC90000000gNcm!ARcAQOxof.l34GtM3iLpD.hSfBZHGTEIbV9BtEsfP4VeomlgsLL84unDpah8._3l9o59W7JgzzHBO5fGNto2NtTt8k_v526o</li>
<li>Content-Type = application/json</li>
<li>Accept = application/xml</li>
<li><img src="supportedimages/ARC4.png" /></li>
</ul>
<li>Click Send</li>
<li>You will get response in XML as below</li>
<li><img src="supportedimages/ARC5.png" /></li>
<li>
<?xml version="1.0" encoding="UTF-8" ?>

```
<response xsi:type="sObject">
	<type>Account</type>
	<Id>0019000001KwyWtAAJ</Id>
	<BillingCountry>United States</BillingCountry>
	<BillingCity>San Francisco</BillingCity>
	<BillingStreet>The Landmark @ One Market, Suite 300</BillingStreet>
	<BillingPostalCode>CA 94105</BillingPostalCode>
	<ShippingCountry>United States</ShippingCountry>
	<ShippingCity>San Francisco</ShippingCity>
	<ShippingStreet>The Landmark @ One Market, Suite 300</ShippingStreet>
	<ShippingPostalCode>CA 94105</ShippingPostalCode>
</response>
```
</li>	
<li>You will get response in JSON as below</li>
<li><img src="supportedimages/ARC6.png" /></li>
<li>

```
{
	"attributes": {
		"type": "Account",
		"url": "/services/data/v41.0/sobjects/Account/0019000001KwyWtAAJ"
	},
	"BillingCountry": "United States",
	"BillingCity": "San Francisco",
	"BillingStreet": "The Landmark @ One Market, Suite 300",
	"BillingPostalCode": "CA 94105",
	"ShippingCountry": "United States",
	"ShippingCity": "San Francisco",
	"ShippingStreet": "The Landmark @ One Market, Suite 300",
	"ShippingPostalCode": "CA 94105",
	"Id": "0019000001KwyWtAAJ"
}
```
</li>
</ol>

### Read a Record with "@HTTPGet" Method
#### Return a Custom Account Wrapper Class Record
<ol type="1">
<li><b>Note: All wrapper class variables must be declared with "global" access modifier otherwise you will get an error "global methods do not support return type of AccountWrapper"</b></li>	
<li><img src="supportedimages/AccountWrapper.png" /></li>
<li><img src="supportedimages/HttpGet_Return_AccountWrapper.png" /></li>
<li><b>Note: Both 15 or 18 Digit Salesforce Record Id works!</b></li>
<li>HTTP Method = GET</li>	
<li>URL = https://ap1.salesforce.com/services/apexrest/CustomRESTService/{Salesforce AccountId Here}</li>
<li>HTTP Response Body

```
// In JSON
{
	"accountWebsite": "https://www.salesforce.com",
	"accountType": "Prospect",
	"accountShippingStreet": null,
	"accountShippingState": null,
	"accountShippingPostalCode": null,
	"accountShippingCountry": null,
	"accountShippingCity": null,
	"accountRating": "Hot",
	"accountPhone": "1-800-NO-SOFTWARE",
	"accountName": "Salesforce.com Inc.",
	"accountIndustry": "Technology",
	"accountFax": "(415) 901-7040",
	"accountExternalId": "1001",
	"accountDescription": "Salesforce.com Inc.",
	"accountBillingStreet": "The Landmark @ One Market, Suite 300",
	"accountBillingState": "California",
	"accountBillingPostalCode": "CA 94105",
	"accountBillingCountry": "United States",
	"accountBillingCity": "San Francisco"
}
```

```
// In XML
<?xml version="1.0" encoding="UTF-8" ?>
<response>
	<AccountWrapper:accountBillingCity>San Francisco</AccountWrapper:accountBillingCity>
	<AccountWrapper:accountBillingCountry>United States</AccountWrapper:accountBillingCountry>
	<AccountWrapper:accountBillingPostalCode>CA 94105</AccountWrapper:accountBillingPostalCode>
	<AccountWrapper:accountBillingState>California</AccountWrapper:accountBillingState>
	<AccountWrapper:accountBillingStreet>The Landmark @ One Market, Suite 300</AccountWrapper:accountBillingStreet>
	<AccountWrapper:accountDescription>Salesforce.com Inc.</AccountWrapper:accountDescription>
	<AccountWrapper:accountExternalId>1001</AccountWrapper:accountExternalId>
	<AccountWrapper:accountFax>(415) 901-7040</AccountWrapper:accountFax>
	<AccountWrapper:accountIndustry>Technology</AccountWrapper:accountIndustry>
	<AccountWrapper:accountName>Salesforce.com Inc.</AccountWrapper:accountName>
	<AccountWrapper:accountPhone>1-800-NO-SOFTWARE</AccountWrapper:accountPhone>
	<AccountWrapper:accountRating>Hot</AccountWrapper:accountRating>
	<AccountWrapper:accountShippingCity xsi:nil="true" />
	<AccountWrapper:accountShippingCountry xsi:nil="true" />
	<AccountWrapper:accountShippingPostalCode xsi:nil="true" />
	<AccountWrapper:accountShippingState xsi:nil="true" />
	<AccountWrapper:accountShippingStreet xsi:nil="true" />
	<AccountWrapper:accountType>Prospect</AccountWrapper:accountType>
	<AccountWrapper:accountWebsite>https://www.salesforce.com</AccountWrapper:accountWebsite>
</response>
```

</li>
</ol>

### Read a Record with "@HTTPGet" Method
#### Return List of Custom Account Wrapper Class Records
<ol type="1">
<li><b>Note: All wrapper class variables must be declared with "global" access modifier otherwise you will get an error "global methods do not support return type of AccountWrapper"</b></li>
<li><img src="supportedimages/AccountWrapper.png" /></li>
<li><img src="supportedimages/HttpGet_Return_List_AccountWrapper.png" /></li>
<li><b>Note: Both 15 or 18 Digit Salesforce Record Id works!</b></li>
<li>HTTP Method = GET</li>	
<li>URL = https://ap1.salesforce.com/services/apexrest/CustomRESTService/</li>
<li>HTTP Response Body

```
// In JSON
[
	{
		"accountWebsite": "https://www.salesforce.com",
		"accountType": "Prospect",
		"accountShippingStreet": "The Landmark @ One Market, Suite 300",
		"accountShippingState": "California",
		"accountShippingPostalCode": "CA 94105",
		"accountShippingCountry": "United States",
		"accountShippingCity": "San Francisco",
		"accountRating": "Hot",
		"accountPhone": "1-800-NO-SOFTWARE",
		"accountName": "1. Salesforce.com Inc.",
		"accountIndustry": "Technology",
		"accountFax": "(415) 901-7040",
		"accountExternalId": "1001",
		"accountDescription": "The #1 Cloud Computing Software in the world!",
		"accountBillingStreet": "The Landmark @ One Market, Suite 300",
		"accountBillingState": "California",
		"accountBillingPostalCode": "CA 94105",
		"accountBillingCountry": "United States",
		"accountBillingCity": "San Francisco"
	},
	{
		"accountWebsite": "https://www.salesforce.com",
		"accountType": "Prospect",
		"accountShippingStreet": "The Landmark @ One Market, Suite 300",
		"accountShippingState": "California",
		"accountShippingPostalCode": "CA 94105",
		"accountShippingCountry": "United States",
		"accountShippingCity": "San Francisco",
		"accountRating": "Hot",
		"accountPhone": "1-800-NO-SOFTWARE",
		"accountName": "2. Salesforce.com Inc.",
		"accountIndustry": "Technology",
		"accountFax": "(415) 901-7040",
		"accountExternalId": "1002",
		"accountDescription": "The #1 Cloud Computing Software in the world!",
		"accountBillingStreet": "The Landmark @ One Market, Suite 300",
		"accountBillingState": "California",
		"accountBillingPostalCode": "CA 94105",
		"accountBillingCountry": "United States",
		"accountBillingCity": "San Francisco"
	}
]
```

```
// In XML, you will get an error because:
(1) The current structure of the "AccountWrapper" does not fit according to the XML structure rules.
(2) As XML traverse items based on nodes and you don't have a parent node to hold "AccountWrapper".

<?xml version="1.0" encoding="UTF-8" ?>
<Errors>
	<Error>
		<errorCode>NOT_ACCEPTABLE</errorCode>
		<message>Unsupported return type for XML: List<AccountWrapper></message>
	</Error>
</Errors>
```

<li><b>For XML to work, you need to slightly change the strcuture of the "AccountWrapper" class</b></li>
<li><img src="supportedimages/AccountWrapper_XML.png" /></li>
<li><img src="supportedimages/HttpGet_Return_List_AccountWrapper_XML.png" /></li>
<li><b>Note: Both 15 or 18 Digit Salesforce Record Id works!</b></li>
<li>HTTP Method = GET</li>	
<li>URL = https://ap1.salesforce.com/services/apexrest/CustomRESTService/</li>
<li>HTTP Response Body

```
// In JSON
{
	"lstAccountRecords": 
	[
		{
			"accountWebsite": "https://www.salesforce.com",
			"accountType": "Prospect",
			"accountShippingStreet": "The Landmark @ One Market, Suite 300",
			"accountShippingState": "California",
			"accountShippingPostalCode": "CA 94105",
			"accountShippingCountry": "United States",
			"accountShippingCity": "San Francisco",
			"accountRating": "Hot",
			"accountPhone": "1-800-NO-SOFTWARE",
			"accountName": "1. Salesforce.com Inc.",
			"accountIndustry": "Technology",
			"accountFax": "(415) 901-7040",
			"accountExternalId": "1001",
			"accountDescription": "The #1 Cloud Computing Software in the world!",
			"accountBillingStreet": "The Landmark @ One Market, Suite 300",
			"accountBillingState": "California",
			"accountBillingPostalCode": "CA 94105",
			"accountBillingCountry": "United States",
			"accountBillingCity": "San Francisco"
		},
		{
			"accountWebsite": "https://www.salesforce.com",
			"accountType": "Prospect",
			"accountShippingStreet": "The Landmark @ One Market, Suite 300",
			"accountShippingState": "California",
			"accountShippingPostalCode": "CA 94105",
			"accountShippingCountry": "United States",
			"accountShippingCity": "San Francisco",
			"accountRating": "Hot",
			"accountPhone": "1-800-NO-SOFTWARE",
			"accountName": "2. Salesforce.com Inc.",
			"accountIndustry": "Technology",
			"accountFax": "(415) 901-7040",
			"accountExternalId": "1002",
			"accountDescription": "The #1 Cloud Computing Software in the world!",
			"accountBillingStreet": "The Landmark @ One Market, Suite 300",
			"accountBillingState": "California",
			"accountBillingPostalCode": "CA 94105",
			"accountBillingCountry": "United States",
			"accountBillingCity": "San Francisco"
		}
	],
}
```

```
// In XML
<?xml version="1.0" encoding="UTF-8" ?>
<response>
	<AccountWrapper:lstAccountRecords>
		<AccountWrapper:accountBillingCity>San Francisco</AccountWrapper:accountBillingCity>
		<AccountWrapper:accountBillingCountry>United States</AccountWrapper:accountBillingCountry>
		<AccountWrapper:accountBillingPostalCode>CA 94105</AccountWrapper:accountBillingPostalCode>
		<AccountWrapper:accountBillingState>California</AccountWrapper:accountBillingState>
		<AccountWrapper:accountBillingStreet>The Landmark @ One Market, Suite 300</AccountWrapper:accountBillingStreet>
		<AccountWrapper:accountDescription>The #1 Cloud Computing Software in the world!</AccountWrapper:accountDescription>
		<AccountWrapper:accountExternalId>1001</AccountWrapper:accountExternalId>
		<AccountWrapper:accountFax>(415) 901-7040</AccountWrapper:accountFax>
		<AccountWrapper:accountIndustry>Technology</AccountWrapper:accountIndustry>
		<AccountWrapper:accountName>1. Salesforce.com Inc.</AccountWrapper:accountName>
		<AccountWrapper:accountPhone>1-800-NO-SOFTWARE</AccountWrapper:accountPhone>
		<AccountWrapper:accountRating>Hot</AccountWrapper:accountRating>
		<AccountWrapper:accountShippingCity>San Francisco</AccountWrapper:accountShippingCity>
		<AccountWrapper:accountShippingCountry>United States</AccountWrapper:accountShippingCountry>
		<AccountWrapper:accountShippingPostalCode>CA 94105</AccountWrapper:accountShippingPostalCode>
		<AccountWrapper:accountShippingState>California</AccountWrapper:accountShippingState>
		<AccountWrapper:accountShippingStreet>The Landmark @ One Market, Suite 300</AccountWrapper:accountShippingStreet>
		<AccountWrapper:accountType>Prospect</AccountWrapper:accountType>
		<AccountWrapper:accountWebsite>https://www.salesforce.com</AccountWrapper:accountWebsite>
	</AccountWrapper:lstAccountRecords>
	<AccountWrapper:lstAccountRecords>
		<AccountWrapper:accountBillingCity>San Francisco</AccountWrapper:accountBillingCity>
		<AccountWrapper:accountBillingCountry>United States</AccountWrapper:accountBillingCountry>
		<AccountWrapper:accountBillingPostalCode>CA 94105</AccountWrapper:accountBillingPostalCode>
		<AccountWrapper:accountBillingState>California</AccountWrapper:accountBillingState>
		<AccountWrapper:accountBillingStreet>The Landmark @ One Market, Suite 300</AccountWrapper:accountBillingStreet>
		<AccountWrapper:accountDescription>The #1 Cloud Computing Software in the world!</AccountWrapper:accountDescription>
		<AccountWrapper:accountExternalId>1002</AccountWrapper:accountExternalId>
		<AccountWrapper:accountFax>(415) 901-7040</AccountWrapper:accountFax>
		<AccountWrapper:accountIndustry>Technology</AccountWrapper:accountIndustry>
		<AccountWrapper:accountName>2. Salesforce.com Inc.</AccountWrapper:accountName>
		<AccountWrapper:accountPhone>1-800-NO-SOFTWARE</AccountWrapper:accountPhone>
		<AccountWrapper:accountRating>Hot</AccountWrapper:accountRating>
		<AccountWrapper:accountShippingCity>San Francisco</AccountWrapper:accountShippingCity>
		<AccountWrapper:accountShippingCountry>United States</AccountWrapper:accountShippingCountry>
		<AccountWrapper:accountShippingPostalCode>CA 94105</AccountWrapper:accountShippingPostalCode>
		<AccountWrapper:accountShippingState>California</AccountWrapper:accountShippingState>
		<AccountWrapper:accountShippingStreet>The Landmark @ One Market, Suite 300</AccountWrapper:accountShippingStreet>
		<AccountWrapper:accountType>Prospect</AccountWrapper:accountType>
		<AccountWrapper:accountWebsite>https://www.salesforce.com</AccountWrapper:accountWebsite>
	</AccountWrapper:lstAccountRecords>
</response>
```

</li>
</ol>

### Create a Record with "@HttpPost" Method
#### Return Standard Account Record
<ol type="1">
<li><img src="supportedimages/HttpPost.png" /></li>	
<li>HTTP Method = GET</li>	
<li>URL = https://ap1.salesforce.com/services/apexrest/AccountRESTService</li>
<li>HTTP Request Body = 

```
// In JSON
{
	"name" : "Salesforce.com Inc."
}
```

```
// In XML
<?xml version="1.0" encoding="UTF-8" ?>
<request>
	<name>Salesforce.com Inc.</name>
</request>
```

</li>
<li>HTTP Response Body = 

```
// In JSON
{
	"attributes": {
		"type": "Account",
		"url": "/services/data/v41.0/sobjects/Account/0019000001zQkHPAA0"
	},
	"Name": "Salesforce.com Inc.",
	"BillingCountry": "United States",
	"BillingState": "California",
	"BillingCity": "San Francisco",
	"BillingStreet": "The Landmark @ One Market, Suite 300",
	"BillingPostalCode": "CA 94105",
	"Industry": "Technology",
	"Phone": "1-800-NO-SOFTWARE",
	"Fax": "415-901-7040",
	"Website": "https://www.salesforce.com",
	"Rating": "Hot",
	"Type": "Prospect",
	"Id": "0019000001zQkHPAA0"
}
```

```
// In XML
<?xml version="1.0" encoding="UTF-8" ?>
<response xsi:type="sObject">
	<type>Account</type>
	<Id>0019000001zQkHFAA0</Id>
	<Name>Salesforce.com Inc.</Name>
	<BillingCountry>United States</BillingCountry>
	<BillingState>California</BillingState>
	<BillingCity>San Francisco</BillingCity>
	<BillingStreet>The Landmark @ One Market, Suite 300</BillingStreet>
	<BillingPostalCode>CA 94105</BillingPostalCode>
	<Industry>Technology</Industry>
	<Phone>1-800-NO-SOFTWARE</Phone>
	<Fax>415-901-7040</Fax>
	<Website>https://www.salesforce.com</Website>
	<Rating>Hot</Rating>
	<Type>Prospect</Type>
</response>
```

</li>
</ol>

### Create a Record with "@HttpPost" Method
#### Return a Custom Account Wrapper Class Record
<ol type="1">
<li><img src="supportedimages/HTTPPost_AccountWrapper.png" /></li>
<li><img src="supportedimages/HTTPPost_CustomRESTService.png" /></li>
<li>HTTP Method = POST</li>	
<li>URL = https://ap1.salesforce.com/services/apexrest/AccountRESTService</li>
<li>HTTP Request Body = 

```
// In JSON
{
	"requestAccountWrapper" : {
		"accountWebsite": "https://www.salesforce.com",
		"accountType": "Prospect",
		"accountShippingStreet": "The Landmark @ One Market, Suite 300",
		"accountShippingState": "California",
		"accountShippingPostalCode": "CA 94105",
		"accountShippingCountry": "United States",
		"accountShippingCity": "San Francisco",
		"accountRating": "Hot",
		"accountPhone": "1-800-NO-SOFTWARE",
		"accountName": "3. Salesforce.com Inc.",
		"accountIndustry": "Technology",
		"accountFax": "(415) 901-7040",
		"accountExternalId": "1003",
		"accountDescription": "The #1 Cloud Computing Software in the world!",
		"accountBillingStreet": "The Landmark @ One Market, Suite 300",
		"accountBillingState": "California",
		"accountBillingPostalCode": "CA 94105",
		"accountBillingCountry": "United States",
		"accountBillingCity": "San Francisco"	
	}
}
```

```
In XML
<?xml version="1.0" encoding="UTF-8" ?>
<request>
	<requestAccountWrapper xmlns:AccountWrapper="http://soap.sforce.com/schemas/class/CustomRESTService" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
		<AccountWrapper:accountName>4. Salesforce.com Inc.</AccountWrapper:accountName>
		<AccountWrapper:accountExternalId>1004</AccountWrapper:accountExternalId>
		<AccountWrapper:accountDescription>The #1 Cloud Computing Software in the world!</AccountWrapper:accountDescription>
		<AccountWrapper:accountType>Prospect</AccountWrapper:accountType>
		<AccountWrapper:accountIndustry>Technology</AccountWrapper:accountIndustry>
		<AccountWrapper:accountRating>Hot</AccountWrapper:accountRating>
		<AccountWrapper:accountPhone>1-800-NO-SOFTWARE</AccountWrapper:accountPhone>
		<AccountWrapper:accountFax>(415) 901-7040</AccountWrapper:accountFax>
		<AccountWrapper:accountWebsite>https://www.salesforce.com</AccountWrapper:accountWebsite>
		<AccountWrapper:accountBillingCountry>United States</AccountWrapper:accountBillingCountry>
		<AccountWrapper:accountBillingState>California</AccountWrapper:accountBillingState>
		<AccountWrapper:accountBillingCity>San Francisco</AccountWrapper:accountBillingCity>
		<AccountWrapper:accountBillingStreet>The Landmark @ One Market, Suite 300</AccountWrapper:accountBillingStreet>
		<AccountWrapper:accountBillingPostalCode>CA 94105</AccountWrapper:accountBillingPostalCode>
		<AccountWrapper:accountShippingCountry>United States</AccountWrapper:accountShippingCountry>
		<AccountWrapper:accountShippingState>California</AccountWrapper:accountShippingState>
		<AccountWrapper:accountShippingCity>San Francisco</AccountWrapper:accountShippingCity>
		<AccountWrapper:accountShippingStreet>The Landmark @ One Market, Suite 300</AccountWrapper:accountShippingStreet>
		<AccountWrapper:accountShippingPostalCode>CA 94105</AccountWrapper:accountShippingPostalCode>
	</requestAccountWrapper>
</request>
```

</li>

<li>HTTP Response Body = 

```
// In JSON
{
	"accountWebsite": "https://www.salesforce.com",
	"accountType": "Prospect",
	"accountShippingStreet": "The Landmark @ One Market, Suite 300",
	"accountShippingState": "California",
	"accountShippingPostalCode": "CA 94105",
	"accountShippingCountry": "United States",
	"accountShippingCity": "San Francisco",
	"accountRating": "Hot",
	"accountPhone": "1-800-NO-SOFTWARE",
	"accountName": "3. Salesforce.com Inc.",
	"accountIndustry": "Technology",
	"accountId": "0019000001zQp35AAC",
	"accountFax": "(415) 901-7040",
	"accountExternalId": "1003",
	"accountDescription": "The #1 Cloud Computing Software in the world!",
	"accountBillingStreet": "The Landmark @ One Market, Suite 300",
	"accountBillingState": "California",
	"accountBillingPostalCode": "CA 94105",
	"accountBillingCountry": "United States",
	"accountBillingCity": "San Francisco"
}
```

```
// In XML
<?xml version="1.0" encoding="UTF-8" ?>
<response>
	<AccountWrapper:accountBillingCity>San Francisco</AccountWrapper:accountBillingCity>
	<AccountWrapper:accountBillingCountry>United States</AccountWrapper:accountBillingCountry>
	<AccountWrapper:accountBillingPostalCode>CA 94105</AccountWrapper:accountBillingPostalCode>
	<AccountWrapper:accountBillingState>California</AccountWrapper:accountBillingState>
	<AccountWrapper:accountBillingStreet>The Landmark @ One Market, Suite 300</AccountWrapper:accountBillingStreet>
	<AccountWrapper:accountDescription>The #1 Cloud Computing Software in the world!</AccountWrapper:accountDescription>
	<AccountWrapper:accountExternalId>1005</AccountWrapper:accountExternalId>
	<AccountWrapper:accountFax>(415) 901-7040</AccountWrapper:accountFax>
	<AccountWrapper:accountId>0019000001zQp3tAAC</AccountWrapper:accountId>
	<AccountWrapper:accountIndustry>Technology</AccountWrapper:accountIndustry>
	<AccountWrapper:accountName>5. Salesforce.com Inc.</AccountWrapper:accountName>
	<AccountWrapper:accountPhone>1-800-NO-SOFTWARE</AccountWrapper:accountPhone>
	<AccountWrapper:accountRating>Hot</AccountWrapper:accountRating>
	<AccountWrapper:accountShippingCity>San Francisco</AccountWrapper:accountShippingCity>
	<AccountWrapper:accountShippingCountry>United States</AccountWrapper:accountShippingCountry>
	<AccountWrapper:accountShippingPostalCode>CA 94105</AccountWrapper:accountShippingPostalCode>
	<AccountWrapper:accountShippingState>California</AccountWrapper:accountShippingState>
	<AccountWrapper:accountShippingStreet>The Landmark @ One Market, Suite 300</AccountWrapper:accountShippingStreet>
	<AccountWrapper:accountType>Prospect</AccountWrapper:accountType>
	<AccountWrapper:accountWebsite>https://www.salesforce.com</AccountWrapper:accountWebsite>
</response>
```

</li>
</ol>


### Create a Record with "@HttpPost" Method
#### Return List Custom Account Wrapper Class Records
<ol type="1">
<li><img src="supportedimages/HTTPPost_List_AccountWrapper.png" /></li>
<li><img src="supportedimages/HTTPPost_List_CustomRESTService.png" /></li>
<li>HTTP Method = POST</li>	
<li>URL = https://ap1.salesforce.com/services/apexrest/AccountRESTService</li>
<li>HTTP Request Body = 

```
// In JSON
{
	"requestAccountWrapper" : {
		"lstAccountRecords" :
		[
			{
				"accountWebsite": "https://www.salesforce.com",
				"accountType": "Prospect",
				"accountShippingStreet": "The Landmark @ One Market, Suite 300",
				"accountShippingState": "California",
				"accountShippingPostalCode": "CA 94105",
				"accountShippingCountry": "United States",
				"accountShippingCity": "San Francisco",
				"accountRating": "Hot",
				"accountPhone": "1-800-NO-SOFTWARE",
				"accountName": "6. Salesforce.com Inc.",
				"accountIndustry": "Technology",
				"accountFax": "(415) 901-7040",
				"accountExternalId": "1006",
				"accountDescription": "The #1 Cloud Computing Software in the world!",
				"accountBillingStreet": "The Landmark @ One Market, Suite 300",
				"accountBillingState": "California",
				"accountBillingPostalCode": "CA 94105",
				"accountBillingCountry": "United States",
				"accountBillingCity": "San Francisco"	
			},
			{
				"accountWebsite": "https://www.salesforce.com",
				"accountType": "Prospect",
				"accountShippingStreet": "The Landmark @ One Market, Suite 300",
				"accountShippingState": "California",
				"accountShippingPostalCode": "CA 94105",
				"accountShippingCountry": "United States",
				"accountShippingCity": "San Francisco",
				"accountRating": "Hot",
				"accountPhone": "1-800-NO-SOFTWARE",
				"accountName": "7. Salesforce.com Inc.",
				"accountIndustry": "Technology",
				"accountFax": "(415) 901-7040",
				"accountExternalId": "1007",
				"accountDescription": "The #1 Cloud Computing Software in the world!",
				"accountBillingStreet": "The Landmark @ One Market, Suite 300",
				"accountBillingState": "California",
				"accountBillingPostalCode": "CA 94105",
				"accountBillingCountry": "United States",
				"accountBillingCity": "San Francisco"	
			}
		]
	}
}
```

```
// In XML
<?xml version="1.0" encoding="UTF-8" ?>
<request>
	<requestAccountWrapper xmlns:AccountWrapper="http://soap.sforce.com/schemas/class/CustomRESTService" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
		<AccountWrapper:lstAccountRecords>
			<AccountWrapper:accountName>8. Salesforce.com Inc.</AccountWrapper:accountName>
			<AccountWrapper:accountExternalId>1008</AccountWrapper:accountExternalId>
			<AccountWrapper:accountDescription>The #1 Cloud Computing Software in the world!</AccountWrapper:accountDescription>
			<AccountWrapper:accountType>Prospect</AccountWrapper:accountType>
			<AccountWrapper:accountIndustry>Technology</AccountWrapper:accountIndustry>
			<AccountWrapper:accountRating>Hot</AccountWrapper:accountRating>
			<AccountWrapper:accountPhone>1-800-NO-SOFTWARE</AccountWrapper:accountPhone>
			<AccountWrapper:accountFax>(415) 901-7040</AccountWrapper:accountFax>
			<AccountWrapper:accountWebsite>https://www.salesforce.com</AccountWrapper:accountWebsite>
			<AccountWrapper:accountBillingCountry>United States</AccountWrapper:accountBillingCountry>
			<AccountWrapper:accountBillingState>California</AccountWrapper:accountBillingState>
			<AccountWrapper:accountBillingCity>San Francisco</AccountWrapper:accountBillingCity>
			<AccountWrapper:accountBillingStreet>The Landmark @ One Market, Suite 300</AccountWrapper:accountBillingStreet>
			<AccountWrapper:accountBillingPostalCode>CA 94105</AccountWrapper:accountBillingPostalCode>
			<AccountWrapper:accountShippingCountry>United States</AccountWrapper:accountShippingCountry>
			<AccountWrapper:accountShippingState>California</AccountWrapper:accountShippingState>
			<AccountWrapper:accountShippingCity>San Francisco</AccountWrapper:accountShippingCity>
			<AccountWrapper:accountShippingStreet>The Landmark @ One Market, Suite 300</AccountWrapper:accountShippingStreet>
			<AccountWrapper:accountShippingPostalCode>CA 94105</AccountWrapper:accountShippingPostalCode>
		</AccountWrapper:lstAccountRecords>
		<AccountWrapper:lstAccountRecords>
			<AccountWrapper:accountName>9. Salesforce.com Inc.</AccountWrapper:accountName>
			<AccountWrapper:accountExternalId>1009</AccountWrapper:accountExternalId>
			<AccountWrapper:accountDescription>The #1 Cloud Computing Software in the world!</AccountWrapper:accountDescription>
			<AccountWrapper:accountType>Prospect</AccountWrapper:accountType>
			<AccountWrapper:accountIndustry>Technology</AccountWrapper:accountIndustry>
			<AccountWrapper:accountRating>Hot</AccountWrapper:accountRating>
			<AccountWrapper:accountPhone>1-800-NO-SOFTWARE</AccountWrapper:accountPhone>
			<AccountWrapper:accountFax>(415) 901-7040</AccountWrapper:accountFax>
			<AccountWrapper:accountWebsite>https://www.salesforce.com</AccountWrapper:accountWebsite>
			<AccountWrapper:accountBillingCountry>United States</AccountWrapper:accountBillingCountry>
			<AccountWrapper:accountBillingState>California</AccountWrapper:accountBillingState>
			<AccountWrapper:accountBillingCity>San Francisco</AccountWrapper:accountBillingCity>
			<AccountWrapper:accountBillingStreet>The Landmark @ One Market, Suite 300</AccountWrapper:accountBillingStreet>
			<AccountWrapper:accountBillingPostalCode>CA 94105</AccountWrapper:accountBillingPostalCode>
			<AccountWrapper:accountShippingCountry>United States</AccountWrapper:accountShippingCountry>
			<AccountWrapper:accountShippingState>California</AccountWrapper:accountShippingState>
			<AccountWrapper:accountShippingCity>San Francisco</AccountWrapper:accountShippingCity>
			<AccountWrapper:accountShippingStreet>The Landmark @ One Market, Suite 300</AccountWrapper:accountShippingStreet>
			<AccountWrapper:accountShippingPostalCode>CA 94105</AccountWrapper:accountShippingPostalCode>
		</AccountWrapper:lstAccountRecords>
	</requestAccountWrapper>
</request>
```

</li>

<li>HTTP Response Body = 

```
// In JSON
{
	"lstAccountRecords":
	[
		{
			"accountWebsite": "https://www.salesforce.com",
			"accountType": "Prospect",
			"accountShippingStreet": "The Landmark @ One Market, Suite 300",
			"accountShippingState": "California",
			"accountShippingPostalCode": "CA 94105",
			"accountShippingCountry": "United States",
			"accountShippingCity": "San Francisco",
			"accountRating": "Hot",
			"accountPhone": "1-800-NO-SOFTWARE",
			"accountName": "6. Salesforce.com Inc.",
			"accountIndustry": "Technology",
			"accountId": "0019000001zQp6TAAS",
			"accountFax": "(415) 901-7040",
			"accountExternalId": "1006",
			"accountDescription": "The #1 Cloud Computing Software in the world!",
			"accountBillingStreet": "The Landmark @ One Market, Suite 300",
			"accountBillingState": "California",
			"accountBillingPostalCode": "CA 94105",
			"accountBillingCountry": "United States",
			"accountBillingCity": "San Francisco"
		},
		{
			"accountWebsite": "https://www.salesforce.com",
			"accountType": "Prospect",
			"accountShippingStreet": "The Landmark @ One Market, Suite 300",
			"accountShippingState": "California",
			"accountShippingPostalCode": "CA 94105",
			"accountShippingCountry": "United States",
			"accountShippingCity": "San Francisco",
			"accountRating": "Hot",
			"accountPhone": "1-800-NO-SOFTWARE",
			"accountName": "7. Salesforce.com Inc.",
			"accountIndustry": "Technology",
			"accountId": "0019000001zQp6UAAS",
			"accountFax": "(415) 901-7040",
			"accountExternalId": "1007",
			"accountDescription": "The #1 Cloud Computing Software in the world!",
			"accountBillingStreet": "The Landmark @ One Market, Suite 300",
			"accountBillingState": "California",
			"accountBillingPostalCode": "CA 94105",
			"accountBillingCountry": "United States",
			"accountBillingCity": "San Francisco"
		}
	]
}
```

```
// In XML
<?xml version="1.0" encoding="UTF-8" ?>
<response>
	<AccountWrapper:lstAccountRecords>
		<AccountWrapper:accountBillingCity>San Francisco</AccountWrapper:accountBillingCity>
		<AccountWrapper:accountBillingCountry>United States</AccountWrapper:accountBillingCountry>
		<AccountWrapper:accountBillingPostalCode>CA 94105</AccountWrapper:accountBillingPostalCode>
		<AccountWrapper:accountBillingState>California</AccountWrapper:accountBillingState>
		<AccountWrapper:accountBillingStreet>The Landmark @ One Market, Suite 300</AccountWrapper:accountBillingStreet>
		<AccountWrapper:accountDescription>The #1 Cloud Computing Software in the world!</AccountWrapper:accountDescription>
		<AccountWrapper:accountExternalId>1008</AccountWrapper:accountExternalId>
		<AccountWrapper:accountFax>(415) 901-7040</AccountWrapper:accountFax>
		<AccountWrapper:accountId>0019000001zQp6iAAC</AccountWrapper:accountId>
		<AccountWrapper:accountIndustry>Technology</AccountWrapper:accountIndustry>
		<AccountWrapper:accountName>8. Salesforce.com Inc.</AccountWrapper:accountName>
		<AccountWrapper:accountPhone>1-800-NO-SOFTWARE</AccountWrapper:accountPhone>
		<AccountWrapper:accountRating>Hot</AccountWrapper:accountRating>
		<AccountWrapper:accountShippingCity>San Francisco</AccountWrapper:accountShippingCity>
		<AccountWrapper:accountShippingCountry>United States</AccountWrapper:accountShippingCountry>
		<AccountWrapper:accountShippingPostalCode>CA 94105</AccountWrapper:accountShippingPostalCode>
		<AccountWrapper:accountShippingState>California</AccountWrapper:accountShippingState>
		<AccountWrapper:accountShippingStreet>The Landmark @ One Market, Suite 300</AccountWrapper:accountShippingStreet>
		<AccountWrapper:accountType>Prospect</AccountWrapper:accountType>
		<AccountWrapper:accountWebsite>https://www.salesforce.com</AccountWrapper:accountWebsite>
	</AccountWrapper:lstAccountRecords>
	<AccountWrapper:lstAccountRecords>
		<AccountWrapper:accountBillingCity>San Francisco</AccountWrapper:accountBillingCity>
		<AccountWrapper:accountBillingCountry>United States</AccountWrapper:accountBillingCountry>
		<AccountWrapper:accountBillingPostalCode>CA 94105</AccountWrapper:accountBillingPostalCode>
		<AccountWrapper:accountBillingState>California</AccountWrapper:accountBillingState>
		<AccountWrapper:accountBillingStreet>The Landmark @ One Market, Suite 300</AccountWrapper:accountBillingStreet>
		<AccountWrapper:accountDescription>The #1 Cloud Computing Software in the world!</AccountWrapper:accountDescription>
		<AccountWrapper:accountExternalId>1009</AccountWrapper:accountExternalId>
		<AccountWrapper:accountFax>(415) 901-7040</AccountWrapper:accountFax>
		<AccountWrapper:accountId>0019000001zQp6jAAC</AccountWrapper:accountId>
		<AccountWrapper:accountIndustry>Technology</AccountWrapper:accountIndustry>
		<AccountWrapper:accountName>9. Salesforce.com Inc.</AccountWrapper:accountName>
		<AccountWrapper:accountPhone>1-800-NO-SOFTWARE</AccountWrapper:accountPhone>
		<AccountWrapper:accountRating>Hot</AccountWrapper:accountRating>
		<AccountWrapper:accountShippingCity>San Francisco</AccountWrapper:accountShippingCity>
		<AccountWrapper:accountShippingCountry>United States</AccountWrapper:accountShippingCountry>
		<AccountWrapper:accountShippingPostalCode>CA 94105</AccountWrapper:accountShippingPostalCode>
		<AccountWrapper:accountShippingState>California</AccountWrapper:accountShippingState>
		<AccountWrapper:accountShippingStreet>The Landmark @ One Market, Suite 300</AccountWrapper:accountShippingStreet>
		<AccountWrapper:accountType>Prospect</AccountWrapper:accountType>
		<AccountWrapper:accountWebsite>https://www.salesforce.com</AccountWrapper:accountWebsite>
	</AccountWrapper:lstAccountRecords>
</response>
```

</li>
</ol>

### Update a Record with "@HttpPatch" Method
#### Return String
<ol type="1">
<li><img src="supportedimages/HttpPatch.png" /></li>
<li>HTTP Method = PATCH</li>	
<li>URL = https://ap1.salesforce.com/services/apexrest/AccountRESTService</li>
<li>HTTP Request Body = 

```
// In JSON
{
	"accountId" : "0019000001zQkHoAAK"
}
```

```
// In XML
<?xml version="1.0" encoding="UTF-8" ?>
<request>
	<accountId>0019000001zQkHoAAK</accountId>
</request>
```

</li>

<li>HTTP Response Body = 

```
// In JSON
"Salesforce.com Inc. UPDATED! UPDATED!"
```

```
// In XML
<?xml version="1.0" encoding="UTF-8" ?>
<response>Salesforce.com Inc. UPDATED!</response>
```

</li>
</ol>

### Upsert a Record with "@HttpPut" Method
#### Return Standard Account Record
<ol type="1">
<li><img src="supportedimages/HttpPut.png" /></li>
<li>HTTP Method = PUT</li>	
<li>URL = https://ap1.salesforce.com/services/apexrest/AccountRESTService</li>
<li>HTTP Request Body = 

```
// In JSON
{
	"name" : "Salesforce.com Inc.",
	"externalId" : "1001"
}
```

```
// In XML
<?xml version="1.0" encoding="UTF-8" ?>
<request>
	<name>Salesforce.com Inc.</name>
	<externalId>1001</externalId>
</request>
```

</li>

<li>HTTP Response Body = 

```
// In JSON
{
	"attributes": {
		"type": "Account",
		"url": "/services/data/v41.0/sobjects/Account/0019000001zQkJGAA0"
	},
	"ExternalId__c": "1001",
	"Name": "Salesforce.com Inc.",
	"BillingCountry": "United States",
	"BillingState": "California",
	"BillingCity": "San Francisco",
	"BillingStreet": "The Landmark @ One Market, Suite 300",
	"BillingPostalCode": "CA 94105",
	"Industry": "Technology",
	"Phone": "1-800-NO-SOFTWARE",
	"Fax": "415-901-7040",
	"Website": "https://www.salesforce.com",
	"Rating": "Hot",
	"Type": "Prospect",
	"Id": "0019000001zQkJGAA0"
}
```

```
// In XML
<?xml version="1.0" encoding="UTF-8" ?>
<response xsi:type="sObject">
	<type>Account</type>
	<Id>0019000001zQkKEAA0</Id>
	<ExternalId__c>1003</ExternalId__c>
	<Name>Salesforce.com Inc.</Name>
	<BillingCountry>United States</BillingCountry>
	<BillingState>California</BillingState>
	<BillingCity>San Francisco</BillingCity>
	<BillingStreet>The Landmark @ One Market, Suite 300</BillingStreet>
	<BillingPostalCode>CA 94105</BillingPostalCode>
	<Industry>Technology</Industry>
	<Phone>1-800-NO-SOFTWARE</Phone>
	<Fax>415-901-7040</Fax>
	<Website>https://www.salesforce.com</Website>
	<Rating>Hot</Rating>
	<Type>Prospect</Type>
</response>
```

</li>
</ol>

### Delete a Record with "@HttpDelete" Method
#### Return String
<ol type="1">
<li><img src="supportedimages/HttpDelete.png" /></li>
<li>HTTP Method = DELETE</li>	
<li>URL = https://ap1.salesforce.com/services/apexrest/AccountRESTService?Id={Record Id here}</li>
<li>HTTP Response Body = 

```
// In JSON
"Success"
```

```
// In XML
<?xml version="1.0" encoding="UTF-8" ?>
<response>Success</response>
```

</li>
</ol>




## (8) Test (@isTest) class for Custom Apex REST API

## (9) Useful Resources
<ol type="a">
<li>https://trailhead.salesforce.com/en/modules/apex_integration_services/units/apex_integration_webservices</li>
<li>https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_rest.htm</li>
<li>https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_methods_system_restcontext.htm#apex_methods_system_restcontext</li>
<li>https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_methods_system_restrequest.htm#apex_methods_system_restrequest</li>
<li>https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_methods_system_restresponse.htm#apex_methods_system_restresponse</li>
<li>https://help.salesforce.com/articleView?id=connected_app_overview.htm</li>
<li>https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/intro_understanding_authentication.htm</li>
<li>https://developer.salesforce.com/page/Creating_REST_APIs_using_Apex_REST</li>
</ol>
