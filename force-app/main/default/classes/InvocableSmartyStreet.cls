public with sharing class InvocableSmartyStreet {
    @InvocableMethod(label='Call smarty Street' description='Makes callout to smarty street api')
    public static void makeCallout(List<ID> locationids) {

      run(locationids[0]);
    }
       @future
       public static void run(Id locId)
       {   
        try {
            SmartyStreetCreds__c apiCreds= SmartyStreetCreds__c.getOrgDefaults();
            Dev_Location__c loc=[SELECT street__c, State__c, Postal_Code__c 
                                  FROM Dev_Location__c
                                  WHERE Id=:locId WITH SECURITY_ENFORCED];

            string path='street-address?'
            +'street='+EncodingUtil.urlEncode(loc.street__c, 'UTF-8')
            +'&auth-id='+apiCreds.authId__C
            +'&auth-token='+apiCreds.authToken__c
            +'&state='+loc.State__c
            +'&zipcode='+loc.Postal_Code__c 
            +'&match=enhanced';

            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('Callout:smartyStreet/' +path );
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            System.debug('resp: '+response.getBody());
            Boolean isSuccess=response.getStatusCode()==200;
            update new Dev_Location__c(Id=locId, Verified__c=isSuccess);
    
               
           } catch (Exception exc) {
    
            ErrorLogHelper.createAtutoLoggedErrors();           
           }
            
       }
     
    
}
