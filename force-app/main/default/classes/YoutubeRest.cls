public inherited sharing class YoutubeRest {
    public static void fetchYoutubeVideoDetails(String recordId, String videoId){
        String endpointURL = YouTube_API_Setting__mdt.getInstance('Endpoint').Value__c;
        String apiKey = YouTube_API_Setting__mdt.getInstance('API_Key').Value__c;
        endpointURL += '?part=statistics';
        endpointURL += '&id='+videoId;
        endpointURL += '&key='+apiKey;
        
        
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint(endpointURL);
        Http http = new Http();
        HttpResponse response = http.send(request);
        
        
        if(response.getStatusCode() == 200){
            YouTube_Video_Detail__c youtubeVideo = new YouTube_Video_Detail__c();
            youtubeVideo.Id = recordId;
            Map<String, Object> responseMap = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            if(responseMap.containsKey('items')){
                
                String itemsJSON = JSON.serialize(responseMap.get('items'));
                List<Object> itemsObject = (List<Object>)JSON.deserializeUntyped(itemsJSON);
                
                String items0JSON = JSON.serialize(itemsObject[0]);
                Map<String, Object> videoItem = (Map<String, Object>)JSON.deserializeUntyped(items0JSON);
                
                Object videoItemObject = videoItem.get('statistics');
                String videoItemJSON = JSON.serialize(videoItemObject);
                Map<String, Object> videoStatistics = (Map<String, Object>)JSON.deserializeUntyped(videoItemJSON);
                
                if(videoStatistics.containsKey('viewCount')){
                    Object viewCount = videoStatistics.get('viewCount');
                    youtubeVideo.Number_of_View_Counts__c = String.valueOf(viewCount);
                }
                if(videoStatistics.containsKey('likeCount')){
                    Object likeCount = videoStatistics.get('likeCount');
                    youtubeVideo.Number_of_Likes__c = String.valueOf(likeCount);
                }
                update youtubeVideo;
            }
        }
        
    }
}