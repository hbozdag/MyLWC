@RestResource(urlMapping='/event-details/*')
  global with sharing class WsEventDetails {
    
    @HttpGet
    global static List<EventDetail> getEventDetails(){
        List<EventDetail> details= new List<EventDetail>();

     for(Dev_Event__c evt: [SELECT Name, Event_Type__c, Frequency__c, Live__c, Start_Date_Time__c, End_Date_Time__c
                FROM Dev_Event__c 
                WHERE Live__c=TRUE 
                AND Start_Date_Time__c>:Date.today()
                WITH SECURITY_ENFORCED]){
                    details.add(new EventDetail(evt));
                }

                return details;
    }

    global class EventDetail{

        public string eventId;
        public String name;
        public String eventType;
        public String frequency;
        public Boolean live;
        public String startDate;
        public String endDate;

        public EventDetail(Dev_Event__c evt){
            this.eventId=evt.id;
            this.name=evt.name;
            this.eventType=evt.Event_Type__c;
            this.frequency=evt.Frequency__c;
            this.live=evt.Live__c;
            this.startDate=evt.Start_Date_Time__c?.format('yyyy-MM-dd hh:MM');
            this.endDate=evt.End_Date_Time__c?.format('yyyy-MM-dd hh:MM');

        }

    }

}
