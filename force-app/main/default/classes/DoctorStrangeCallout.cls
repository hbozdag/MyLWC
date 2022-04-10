public inherited sharing class DoctorStrangeCallout {
    public static HttpResponse fetchVideoDetails(String videoId){
        HttpRequest request= new HttpRequest();
       String endPoint= Youtube_API_Setting__mdt.getInstance('Endpoint').value__c;
       String keyApi= Youtube_API_Setting__mdt.getInstance('API_Key').value__c; 
       endPoint +='?part=statistics&id='+videoId+ '&key='+keyApi;
      //  request.setEndpoint('https://youtube.googleapis.com/youtube/v3/videos?part=statistics&id=aWzlQ2N6qqg&key=AIzaSyBlL8kuBSgywB_uZ21uiYBqDlUS0neRlRw');
      request.setEndpoint(endPoint);  
      request.setMethod('GET');

        Http http=new Http();
        HttpResponse response=http.send(request);

        system.debug('Status code: '+response.getStatusCode());
        system.debug('Status: '+response.getStatus());
        
        return response;

    }
}
