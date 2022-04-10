public with sharing class InvSmartyStreetCaller {
    @InvocableMethod(label='Call smarty Street' description='Makes callout to SmartyStreet API')
    public static void makeCallout(List<Id> locationIds){
      run(locationIds[0]);
    }
    @future(callout=true)
    public static void run(Id locId){
      try {
        SmartyStreetCreds__c apiCreds = SmartyStreetCreds__c.getOrgDefaults();
        Dev_Location__c loc = [SELECT Street__c, State__c, Postal_Code__c FROM  Dev_Location__c WHERE Id =: locId WITH SECURITY_ENFORCED];
        string path = 'street-address?'
            +'street=' + EncodingUtil.urlEncode(loc.Street__c,'UTF-8')
            +'auth-id=' + apiCreds.Auth_Id__c
            +'auth-token=' + apiCreds.Auth_Token__c
            +'&state=' + loc.State__c
            +'&zipcode=' + loc.Postal_Code__c
            +'&match=enhanced';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        //request.setEndpoint('https://us-street.api.smartystreets.com/street-address?street=800 Park Ave,Fort Lee&auth-id=9b0d0fe0-16cf-a868-efeb-d75a25580b35&auth-token=IVArlYJJnte7QV3OhldU&state=NJ&zipcode=07024&match=enhanced');
        request.setEndpoint('callout:SmartyStreetCall/' + path);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        System.debug('resp:' + response.getBody());
        Boolean isSuccess = response.getStatusCode() == 200;
        update new Dev_Location__c(Id=locId, Verified__c = isSuccess);
      } catch (Exception exc) {
      ErrorLogHelper.createErrorLog('Call smarty Street', exc.getMessage());
      }
    }
  }