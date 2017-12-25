/*----------------------------------------------------------------------
Name:       AccountWrapper.cls
Purpose:    An Account wrapper class
------------------------------History----------------------------------
Version     Author      Date                    Detail Description 
-------     -------     --------------          ------------------
1.0         Abrar       25-December-2017        Initial Development 
----------------------------------------------------------------------*/
global with sharing class AccountWrapper{
    /*
    // Note: This is applicable when you want to return a single "AccountWrapper" record.

    global String accountId;
    global String accountName;
    global String accountExternalId;
    global String accountType;
    global String accountIndustry;
    global String accountRating;
    global String accountPhone;
    global String accountFax;
    global String accountWebsite;
    global String accountBillingCountry;
    global String accountBillingState;
    global String accountBillingCity;
    global String accountBillingStreet;
    global String accountBillingPostalCode;
    global String accountShippingCountry;
    global String accountShippingState;
    global String accountShippingCity;
    global String accountShippingStreet;
    global String accountShippingPostalCode;
    global String accountDescription;

    global AccountWrapper(){
        // Set default values
        accountName = '3. Salesforce.com Inc.';
        accountExternalId = '1003';
        accountType = 'Prospect';
        accountIndustry = 'Technology';
        accountRating = 'Hot';
        accountPhone = '1-800-NO-SOFTWARE';
        accountFax = '415-901-7040';
        accountWebsite = 'https://www.salesforce.com';
        accountBillingCountry = 'United States';
        accountBillingState = 'California';
        accountBillingCity = 'San Francisco';
        accountBillingStreet = 'The Landmark @ One Market, Suite 300';
        accountBillingPostalCode = 'CA 94105';
        accountShippingCountry = 'United States';
        accountShippingState = 'California';
        accountShippingCity = 'San Francisco';
        accountShippingStreet = 'The Landmark @ One Market, Suite 300';
        accountShippingPostalCode = 'CA 94105';
        accountDescription = 'The #1 Cloud Computing Software in the world!';
    }
    */

    /*
    // Note: This is applicable when you want to return List of "AccountWrapper" records.

    global List<Accounts> lstAccountRecords;

    global AccountWrapper(){
        lstAccountRecords = new List<Accounts>();
    }

    global class Accounts{
        global String accountId;
        global String accountName;
        global String accountExternalId;
        global String accountType;
        global String accountIndustry;
        global String accountRating;
        global String accountPhone;
        global String accountFax;
        global String accountWebsite;
        global String accountBillingCountry;
        global String accountBillingState;
        global String accountBillingCity;
        global String accountBillingStreet;
        global String accountBillingPostalCode;
        global String accountShippingCountry;
        global String accountShippingState;
        global String accountShippingCity;
        global String accountShippingStreet;
        global String accountShippingPostalCode;
        global String accountDescription;

        global Accounts(){
            // Set default values
            accountName = '3. Salesforce.com Inc.';
            accountExternalId = '1003';
            accountType = 'Prospect';
            accountIndustry = 'Technology';
            accountRating = 'Hot';
            accountPhone = '1-800-NO-SOFTWARE';
            accountFax = '415-901-7040';
            accountWebsite = 'https://www.salesforce.com';
            accountBillingCountry = 'United States';
            accountBillingState = 'California';
            accountBillingCity = 'San Francisco';
            accountBillingStreet = 'The Landmark @ One Market, Suite 300';
            accountBillingPostalCode = 'CA 94105';
            accountShippingCountry = 'United States';
            accountShippingState = 'California';
            accountShippingCity = 'San Francisco';
            accountShippingStreet = 'The Landmark @ One Market, Suite 300';
            accountShippingPostalCode = 'CA 94105';
            accountDescription = 'The #1 Cloud Computing Software in the world!';
        }        
    }
    */
}