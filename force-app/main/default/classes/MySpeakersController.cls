public inherited sharing class MySpeakersController {
    
    @AuraEnabled(cacheable=true)
    public static List<Speaker__c> fetchSpeakers(){
        List<Speaker__c> speakers;
        try {
            speakers=[SELECT id, Name FROM Speaker__c WITH SECURITY_ENFORCED LIMIT 5];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        return speakers;
    }

    @AuraEnabled(cacheable=true)
    public static List<Speaker__c> apexErrorMethod(){
        List<Speaker__c> speakers;
        Integer i = 10/0;
        return speakers;
    }
}
