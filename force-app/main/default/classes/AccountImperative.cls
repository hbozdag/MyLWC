public inherited sharing class AccountImperative {
    @AuraEnabled
    public static List<Account> fetchAccounts(){
        List<Account> accList = [
            SELECT Id, Name, Phone
            FROM Account
            ORDER BY CreatedDate DESC
        ];
        return accList;
    }
    @AuraEnabled
    public static Account fetchFirstAccount(String accountId){
        Account acc = [
            SELECT Id, Name, Phone
            FROM Account
            WHERE Id = :accountId
        ];
            return acc;
    }
        @AuraEnabled
        public static string updateAccountPhone(Account acc){
            try{
                update acc;
                return 'success';
            }catch(Exception ex){
                return 'failure';
            }
        }
    }








