public with sharing class ErrorLogHelper {

    public static void createErrorLog(String processName, String logDetails){

        insert new 	Error_Log__c(Log_Date_Time__c= Datetime.now(),
                              Process_Name__c=processName,
                                   Log_Details__c=logDetails);
    }

    public static void createAtutoLoggedErrors(){
        try{
            insert new Account();
        }catch(Exception exc){
            system.debug('EXC: '+exc.getMessage());
            insert new 	Error_Log__c(Log_Date_Time__c= Datetime.now(),
                                  Process_Name__c='Account.create',
                                       Log_Details__c=exc.getMessage()+
                                   '(Line: '+exc.getLineNumber()+')');}   
    }
  
}