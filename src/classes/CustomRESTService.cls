/*----------------------------------------------------------------------
Name:       CustomRESTService.cls
Purpose:    An Apex Custom REST Service returning a custom wrapper class "AccountWrapper"
            for @HttpGet and @HttpPost methods
------------------------------History----------------------------------
Version     Author      Date                    Detail Description 
-------     -------     --------------          ------------------
1.0         Abrar       25-December-2017        Initial Development 
----------------------------------------------------------------------*/
@RestResource(urlMapping='/CustomRESTService/*')
global with sharing class CustomRESTService{

    /*
    // Read or Retrieve a Record
    // Returns a single "AccountWrapper" record
    @HttpGet
    global static AccountWrapper doGetAccount() {
        Account accountRecord = new Account();
        AccountWrapper accountWrapper = new AccountWrapper();
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);

        accountRecord = [SELECT Name, ExternalId__c, Type, Industry, Rating, Phone, Fax, Website, Description,
        BillingCountry, BillingState, BillingCity, BillingStreet, BillingPostalCode, 
        ShippingCountry, ShippingState, ShippingCity, ShippingStreet, ShippingPostalCode  
        FROM Account WHERE Id = :accountId LIMIT 1];

        // global methods do not support return type of AccountWrapper
        accountWrapper.accountName = accountRecord.Name;
        accountWrapper.accountExternalId = accountRecord.ExternalId__c;
        accountWrapper.accountType = accountRecord.Type;
        accountWrapper.accountIndustry = accountRecord.Industry;
        accountWrapper.accountRating = accountRecord.Rating;
        accountWrapper.accountPhone = accountRecord.Phone;
        accountWrapper.accountFax = accountRecord.Fax;
        accountWrapper.accountWebsite = accountRecord.Website;
        accountWrapper.accountBillingCountry = accountRecord.BillingCountry;
        accountWrapper.accountBillingState = accountRecord.BillingState;
        accountWrapper.accountBillingCity = accountRecord.BillingCity;
        accountWrapper.accountBillingStreet = accountRecord.BillingStreet;
        accountWrapper.accountBillingPostalCode = accountRecord.BillingPostalCode;
        accountWrapper.accountShippingCountry = accountRecord.ShippingCountry;
        accountWrapper.accountShippingState = accountRecord.ShippingState;
        accountWrapper.accountShippingCity = accountRecord.ShippingCity;
        accountWrapper.accountShippingStreet = accountRecord.ShippingStreet;
        accountWrapper.accountShippingPostalCode = accountRecord.ShippingPostalCode;
        accountWrapper.accountDescription = accountRecord.Description;

        return accountWrapper;
    }
    */

    /*
    // Read or Retrieve a Record
    // Returns List of "AccountWrapper" records
    @HttpGet
    global static AccountWrapper doGetAccounts() {
        List<Account> lstAccountRecords = new List<Account>();

        // This is the change
        AccountWrapper accountWrapperCompleteRecord = new AccountWrapper();
        List<AccountWrapper.Accounts> lsAccountWrappers = new List<AccountWrapper.Accounts>();

        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        lstAccountRecords = [SELECT Name, ExternalId__c, Type, Industry, Rating, Phone, Fax, Website, Description,
        BillingCountry, BillingState, BillingCity, BillingStreet, BillingPostalCode, 
        ShippingCountry, ShippingState, ShippingCity, ShippingStreet, ShippingPostalCode  
        FROM Account WHERE Name LIKE '%Salesforce%' Order By Name];

        for(Account accountRecord : lstAccountRecords){
            // This is the change
            AccountWrapper.Accounts accountWrapper = new AccountWrapper.Accounts();

            accountWrapper.accountName = accountRecord.Name;
            accountWrapper.accountExternalId = accountRecord.ExternalId__c;
            accountWrapper.accountType = accountRecord.Type;
            accountWrapper.accountIndustry = accountRecord.Industry;
            accountWrapper.accountRating = accountRecord.Rating;
            accountWrapper.accountPhone = accountRecord.Phone;
            accountWrapper.accountFax = accountRecord.Fax;
            accountWrapper.accountWebsite = accountRecord.Website;
            accountWrapper.accountBillingCountry = accountRecord.BillingCountry;
            accountWrapper.accountBillingState = accountRecord.BillingState;
            accountWrapper.accountBillingCity = accountRecord.BillingCity;
            accountWrapper.accountBillingStreet = accountRecord.BillingStreet;
            accountWrapper.accountBillingPostalCode = accountRecord.BillingPostalCode;
            accountWrapper.accountShippingCountry = accountRecord.ShippingCountry;
            accountWrapper.accountShippingState = accountRecord.ShippingState;
            accountWrapper.accountShippingCity = accountRecord.ShippingCity;
            accountWrapper.accountShippingStreet = accountRecord.ShippingStreet;
            accountWrapper.accountShippingPostalCode = accountRecord.ShippingPostalCode;
            accountWrapper.accountDescription = accountRecord.Description;

            // This is the change
            lsAccountWrappers.add(accountWrapper);
        }

        // This is the change
        accountWrapperCompleteRecord.lstAccountRecords = lsAccountWrappers;
        return accountWrapperCompleteRecord;
    }
    */

    /*
    // Read or Retrieve a Record
    // Returns List of "AccountWrapper" records
    @HttpGet
    global static List<AccountWrapper> doGetAccounts() {
        List<Account> lstAccountRecords = new List<Account>();
        List<AccountWrapper> lsAccountWrappers = new List<AccountWrapper>();
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        lstAccountRecords = [SELECT Name, ExternalId__c, Type, Industry, Rating, Phone, Fax, Website, Description,
        BillingCountry, BillingState, BillingCity, BillingStreet, BillingPostalCode, 
        ShippingCountry, ShippingState, ShippingCity, ShippingStreet, ShippingPostalCode  
        FROM Account WHERE Name LIKE '%Salesforce%' Order By Name];

        for(Account accountRecord : lstAccountRecords){
            AccountWrapper accountWrapper = new AccountWrapper();
            accountWrapper.accountName = accountRecord.Name;
            accountWrapper.accountExternalId = accountRecord.ExternalId__c;
            accountWrapper.accountType = accountRecord.Type;
            accountWrapper.accountIndustry = accountRecord.Industry;
            accountWrapper.accountRating = accountRecord.Rating;
            accountWrapper.accountPhone = accountRecord.Phone;
            accountWrapper.accountFax = accountRecord.Fax;
            accountWrapper.accountWebsite = accountRecord.Website;
            accountWrapper.accountBillingCountry = accountRecord.BillingCountry;
            accountWrapper.accountBillingState = accountRecord.BillingState;
            accountWrapper.accountBillingCity = accountRecord.BillingCity;
            accountWrapper.accountBillingStreet = accountRecord.BillingStreet;
            accountWrapper.accountBillingPostalCode = accountRecord.BillingPostalCode;
            accountWrapper.accountShippingCountry = accountRecord.ShippingCountry;
            accountWrapper.accountShippingState = accountRecord.ShippingState;
            accountWrapper.accountShippingCity = accountRecord.ShippingCity;
            accountWrapper.accountShippingStreet = accountRecord.ShippingStreet;
            accountWrapper.accountShippingPostalCode = accountRecord.ShippingPostalCode;
            accountWrapper.accountDescription = accountRecord.Description;
            lsAccountWrappers.add(accountWrapper);
        }

        return lsAccountWrappers;
    }
    */




    /*
    // Create a Record
    // Returns a single "AccountWrapper" record
    @HttpPost
    global static AccountWrapper doPostAccount(AccountWrapper requestAccountWrapper) {
        Account accountRecord = new Account();
        AccountWrapper responseAccountWrapper = new AccountWrapper();

        accountRecord.Name = requestAccountWrapper.accountName;
        accountRecord.ExternalId__c = requestAccountWrapper.accountExternalId;
        accountRecord.Type = requestAccountWrapper.accountType;
        accountRecord.Industry = requestAccountWrapper.accountIndustry;
        accountRecord.Rating = requestAccountWrapper.accountRating;
        accountRecord.Phone = requestAccountWrapper.accountPhone;
        accountRecord.Fax = requestAccountWrapper.accountFax;
        accountRecord.Website = requestAccountWrapper.accountWebsite;
        accountRecord.BillingCountry = requestAccountWrapper.accountBillingCountry;
        accountRecord.BillingState = requestAccountWrapper.accountBillingState;
        accountRecord.BillingCity = requestAccountWrapper.accountBillingCity;
        accountRecord.BillingStreet = requestAccountWrapper.accountBillingStreet;
        accountRecord.BillingPostalCode = requestAccountWrapper.accountBillingPostalCode;
        accountRecord.ShippingCountry = requestAccountWrapper.accountShippingCountry;
        accountRecord.ShippingState = requestAccountWrapper.accountShippingState;
        accountRecord.ShippingCity = requestAccountWrapper.accountShippingCity;
        accountRecord.ShippingStreet = requestAccountWrapper.accountShippingStreet;
        accountRecord.ShippingPostalCode = requestAccountWrapper.accountShippingPostalCode;
        accountRecord.Description = requestAccountWrapper.accountDescription;

        insert accountRecord;

        responseAccountWrapper = requestAccountWrapper;
        responseAccountWrapper.accountId = accountRecord.Id;

        return responseAccountWrapper;
    }
    */

    /*
    // Create a Record
    // Returns List of "AccountWrapper" record
    @HttpPost
    global static AccountWrapper doPostAccount(AccountWrapper requestAccountWrapper) {
        AccountWrapper responseAccountWrapper = new AccountWrapper();
        List<AccountWrapper.Accounts> lsAccountWrappers = new List<AccountWrapper.Accounts>();
        List<Account> lstAccountRecords = new List<Account>();

        for(AccountWrapper.Accounts accountWrapper : requestAccountWrapper.lstAccountRecords){
            Account accountRecord = new Account();
            accountRecord.Name = accountWrapper.accountName;
            accountRecord.ExternalId__c = accountWrapper.accountExternalId;
            accountRecord.Type = accountWrapper.accountType;
            accountRecord.Industry = accountWrapper.accountIndustry;
            accountRecord.Rating = accountWrapper.accountRating;
            accountRecord.Phone = accountWrapper.accountPhone;
            accountRecord.Fax = accountWrapper.accountFax;
            accountRecord.Website = accountWrapper.accountWebsite;
            accountRecord.BillingCountry = accountWrapper.accountBillingCountry;
            accountRecord.BillingState = accountWrapper.accountBillingState;
            accountRecord.BillingCity = accountWrapper.accountBillingCity;
            accountRecord.BillingStreet = accountWrapper.accountBillingStreet;
            accountRecord.BillingPostalCode = accountWrapper.accountBillingPostalCode;
            accountRecord.ShippingCountry = accountWrapper.accountShippingCountry;
            accountRecord.ShippingState = accountWrapper.accountShippingState;
            accountRecord.ShippingCity = accountWrapper.accountShippingCity;
            accountRecord.ShippingStreet = accountWrapper.accountShippingStreet;
            accountRecord.ShippingPostalCode = accountWrapper.accountShippingPostalCode;
            accountRecord.Description = accountWrapper.accountDescription;
            lstAccountRecords.add(accountRecord);
        }

        insert lstAccountRecords;

        for(Account accountRecord : lstAccountRecords){
            for(AccountWrapper.Accounts accountWrapper : requestAccountWrapper.lstAccountRecords){
                if(accountRecord.ExternalId__c == accountWrapper.accountExternalId){
                    accountWrapper.accountId = accountRecord.Id;
                    lsAccountWrappers.add(accountWrapper);
                }
            }
        }

        responseAccountWrapper.lstAccountRecords = lsAccountWrappers;

        return responseAccountWrapper;
    }
    */
    
}