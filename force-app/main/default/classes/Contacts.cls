public inherited sharing class Contacts {
    @AuraEnabled(cacheable=true)
    public static list<contact> fetchContact(){
        list<contact> conList=[select id, name, account.Name from contact limit 5];
return conList;
    }
}
