/*----------------------------------------------------------------------
Name:       AccountRESTService.cls
Purpose:    An Apex Custom REST Service returning Standard Account Object
------------------------------History----------------------------------
Version     Author      Date                    Detail Description 
-------     -------     --------------          ------------------
1.0         Abrar       25-December-2017        Initial Development 
----------------------------------------------------------------------*/
@RestResource(urlMapping='/AccountRESTService/*')
global with sharing class AccountRESTService{

    // Read or Retrieve a Record
    // Returns a Standard Account record
    @HttpGet
    global static Account doGetAccount() {
        Account accountRecord = new Account();
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        System.Debug('>>req.headers<<'+req.headers);
        System.Debug('>>req.httpMethod<<'+req.httpMethod);
        System.Debug('>>req.params<<'+req.params);
        System.Debug('>>req.remoteAddress<<'+req.remoteAddress);
        System.Debug('>>req.requestBody<<'+req.requestBody);
        System.Debug('>>req.requestURI<<'+req.requestURI);
        System.Debug('>>req.resourcePath<<'+req.resourcePath);

        // Approach 1
        //https://ap1.salesforce.com/services/apexrest/AccountRESTService/0019000001KwyWt
        //>>req.headers<<{Accept=application/xml, CipherSuite=ECDHE-RSA-AES256-GCM-SHA384 TLSv1.2 256-bits, Content-Type=application/json, Host=ap1.salesforce.com, X-Salesforce-SIP=176.24.13.159}
        //>>req.httpMethod<<GET
        //>>req.params<<{}
        //>>req.remoteAddress<<176.24.13.159
        //>>req.requestBody<<Blob[0]
        //>>req.requestURI<</AccountRESTService/0019000001KwyWt
        //>>req.resourcePath<</services/apexrest/AccountRESTService/*
        //String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);

        // Approach 2
        //https://ap1.salesforce.com/services/apexrest/AccountRESTService?Id=0019000001KwyWt
        //>>req.headers<<{Accept=application/xml, CipherSuite=ECDHE-RSA-AES256-GCM-SHA384 TLSv1.2 256-bits, Content-Type=application/json, Host=ap1.salesforce.com, X-Salesforce-SIP=176.24.13.159}
        //>>req.httpMethod<<GET
        //>>req.params<<{Id=0019000001KwyWt}
        //>>req.remoteAddress<<176.24.13.159
        //>>req.requestBody<<Blob[0]
        //>>req.requestURI<</AccountRESTService
        //>>req.resourcePath<</services/apexrest/AccountRESTService/*
        String accountId = req.params.get('Id');

        accountRecord = [SELECT BillingCountry, BillingState, BillingCity, BillingStreet, BillingPostalCode, 
        ShippingCountry, ShippingState, ShippingCity, ShippingStreet, ShippingPostalCode  
        FROM Account WHERE Id = :accountId LIMIT 1];

        return accountRecord;
    }

    // Create a Record
    // Returns a Standard Account record
    @HttpPost
    global static Account doPostAccount(String name) {
        Account accountRecord = new Account();
            accountRecord.Name = name;
            accountRecord.BillingCountry = 'United States';
            accountRecord.BillingState = 'California';
            accountRecord.BillingCity = 'San Francisco';
            accountRecord.BillingStreet = 'The Landmark @ One Market, Suite 300';
            accountRecord.BillingPostalCode = 'CA 94105';
            accountRecord.Industry = 'Technology';
            accountRecord.Phone = '1-800-NO-SOFTWARE';
            accountRecord.Fax = '415-901-7040';
            accountRecord.Website = 'https://www.salesforce.com';
            accountRecord.Rating = 'Hot';
            accountRecord.Type = 'Prospect';
        insert accountRecord;
        return accountRecord;
    }   

    // Update a Record
    // Returns a simple String
    @HttpPatch
    global static String doPatchAccount(String accountId) {
        Account accountRecord = new Account();

        accountRecord = [SELECT Name, BillingCountry, BillingState, BillingCity, BillingStreet, BillingPostalCode, 
            ShippingCountry, ShippingState, ShippingCity, ShippingStreet, ShippingPostalCode  
            FROM Account WHERE Id = :accountId LIMIT 1];

        accountRecord.Name = accountRecord.Name + ' UPDATED!';
        update accountRecord;
        return accountRecord.Name;
    }

    // Upsert a Record
    // Returns a Standard Account record
    @HttpPut
    global static Account doPutAccount(String name, String externalId) {
        Account accountRecord = new Account();
            accountRecord.ExternalId__c = externalId;
            accountRecord.Name = name;
            accountRecord.BillingCountry = 'United States';
            accountRecord.BillingState = 'California';
            accountRecord.BillingCity = 'San Francisco';
            accountRecord.BillingStreet = 'The Landmark @ One Market, Suite 300';
            accountRecord.BillingPostalCode = 'CA 94105';
            accountRecord.Industry = 'Technology';
            accountRecord.Phone = '1-800-NO-SOFTWARE';
            accountRecord.Fax = '415-901-7040';
            accountRecord.Website = 'https://www.salesforce.com';
            accountRecord.Rating = 'Hot';
            accountRecord.Type = 'Prospect';
            upsert accountRecord ExternalId__c;
        return accountRecord;
    }
    
    // Delete a Record
    // Returns a simple String
    @HttpDelete
    global static String doDeleteAccount() {
        Account accountRecord = new Account();
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        System.Debug('>>req.headers<<'+req.headers);
        System.Debug('>>req.httpMethod<<'+req.httpMethod);
        System.Debug('>>req.params<<'+req.params);
        System.Debug('>>req.remoteAddress<<'+req.remoteAddress);
        System.Debug('>>req.requestBody<<'+req.requestBody);
        System.Debug('>>req.requestURI<<'+req.requestURI);
        System.Debug('>>req.resourcePath<<'+req.resourcePath);

        // Approach 1
        //https://ap1.salesforce.com/services/apexrest/AccountRESTService/0019000001KwyWt
        //>>req.headers<<{Accept=application/xml, CipherSuite=ECDHE-RSA-AES256-GCM-SHA384 TLSv1.2 256-bits, Content-Type=application/json, Host=ap1.salesforce.com, X-Salesforce-SIP=176.24.13.159}
        //>>req.httpMethod<<GET
        //>>req.params<<{}
        //>>req.remoteAddress<<176.24.13.159
        //>>req.requestBody<<Blob[0]
        //>>req.requestURI<</AccountRESTService/0019000001KwyWt
        //>>req.resourcePath<</services/apexrest/AccountRESTService/*
        //String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);

        // Approach 2
        //https://ap1.salesforce.com/services/apexrest/AccountRESTService?Id=0019000001KwyWt
        //>>req.headers<<{Accept=application/xml, CipherSuite=ECDHE-RSA-AES256-GCM-SHA384 TLSv1.2 256-bits, Content-Type=application/json, Host=ap1.salesforce.com, X-Salesforce-SIP=176.24.13.159}
        //>>req.httpMethod<<GET
        //>>req.params<<{Id=0019000001KwyWt}
        //>>req.remoteAddress<<176.24.13.159
        //>>req.requestBody<<Blob[0]
        //>>req.requestURI<</AccountRESTService
        //>>req.resourcePath<</services/apexrest/AccountRESTService/*
        String accountId = req.params.get('Id');

        accountRecord = [SELECT Id FROM Account WHERE Id = :accountId LIMIT 1];
        Delete accountRecord;

        return 'Success';
    }
    
}