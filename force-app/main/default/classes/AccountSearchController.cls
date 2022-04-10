public inherited sharing class AccountSearchController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> searchContact(String keyword) {
        String soqlKeyword = '%'+keyword+'%';

        List<Contact> conList= [
            SELECT Id, Name, Account.name
            FROM Contact
            WHERE Account.name LIKE :soqlKeyword
        ];  
        return conList;
    }
}
