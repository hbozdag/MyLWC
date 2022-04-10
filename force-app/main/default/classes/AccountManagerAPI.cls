@RestResource(urlMapping='/AccountManager/*')
global class AccountManagerAPI {


    @HttpGet
    global static Account getAccountId() {
        RestRequest request = RestContext.request;
        String uri = request.requestURI;
        System.debug('uri: '+uri);

        Integer idStartIndex = uri.lastIndexOf('/')+1;
        System.debug('idStartIndex: '+idStartIndex);

        String accountId = uri.substring(idStartIndex);
        System.debug('accountId: '+accountId);

        Account acc= [SELECT Name, Website, AccountNumber, Industry, Phone 
                      FROM Account WHERE id=:accountId];

                      return acc;
   }

    
   @HttpPost
   global static Id createAccount(
       String accName, String accWebsite, String accAccountNumber, String accIndustry, String accPhone
   ){
       Account acc = new Account();
       acc.Name=accName;
       acc.Website=accWebsite;
       acc.AccountNumber=accAccountNumber;
       acc.Industry=accIndustry;
       acc.Phone=accPhone;

    Database.insert(acc, false);
     
       return acc.Id;
   }

   @HttpPut
    global static String upsertAccount(Account acc){
        String returnString;
        if(acc.Id == null){
            returnString = 'Account created with Id: '; 
        }else{
            returnString = 'ConAccount updated with Id: ';
        }
        
        Database.upsert(acc, false);
        return returnString+acc.Id;
    }

    @HttpPatch
    global static String updateAccount(
    	String accWebsite
    ){
        //Get the request send from external recipient
        RestRequest request = RestContext.request;
        
        //Get the URI of the request
        String uri = request.requestURI;
        System.debug('uri: '+uri);
        
        //Get the starting index of the Id which starts after '/'
        Integer idStartIndex = uri.lastIndexOf('/')+1;
        System.debug('idStartIndex: '+idStartIndex);
        
        //Get the Id of the record based on the start index 
        String accountId = uri.substring(idStartIndex);
        System.debug('accounttId: '+accountId);
        
        Account acc = new Account();
        acc.Id = accountId;
        acc.Website = accWebsite;
       
        Database.update (acc, false);
        return 'Account with Id '+accountId+' updated sucessfully';
    }

    @HttpDelete 
    global static String deleteAccount(){
        //Get the request send from external recipient
        RestRequest request = RestContext.request;
        
        //Get the URI of the request
        String uri = request.requestURI;
        System.debug('uri: '+uri);
        
        //Get the starting index of the Id which starts after '/'
        Integer idStartIndex = uri.lastIndexOf('/')+1;
        System.debug('idStartIndex: '+idStartIndex);
        
        //Get the Id of the record based on the start index 
        String accountId = uri.substring(idStartIndex);
        System.debug('accounttId: '+accountId);
        Account acc = new Account(id=accountId);
        Database.delete(acc, false);
        return 'Account with Id '+accountId+' deleted sucessfully'; 
    }


}
