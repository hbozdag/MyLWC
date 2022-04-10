@RestResource(urlMapping= '/LeadsManager/*')
global inherited sharing class LeadsManagerAPI {
    @HttpGet
    global static list<lead> getLeadId(){
        RestRequest request = RestContext.request;
        String URI=request.requestURI;
        system.debug('URI :' + URI);
        Integer idStartIndex = URI.lastIndexOf('/')+1;
        system.debug('idStartIndex:'+idStartIndex);
        String LeadId = URI.substring(idStartIndex);
        List < String > strList =LeadId.split( ',' );
        system.debug('LeadId:'+strList);
        List<lead> lead=[SELECT LastName, Company
                     from Lead where Id in : strList];
        return lead;
    }
    @HttpPost
    global static list<lead> CreateLead(list<lead> records){
      
       Database.SaveResult[] results= Database.insert(records, false);
       return records;
    }

    @HttpPut 
    global static list<lead> upsertLead(list<lead> records){
        
        Database.UpsertResult[] results= Database.upsert(records, false);
        return records;
    }

    @HttpPatch
    global static list<lead> updateLeads(list<lead> records){
        Database.SaveResult[] results= Database.update(records, false);
        return records;
    }

    @HttpDelete
    global static String deleteLeads(){
        RestRequest request = RestContext.request;
        String uri = request.requestURI; ///LeadsManager/00Q5j000008EiIVEA0,00Q5j000008EiIWEA0
        Integer startIndexOfLeadIds = uri.lastIndexOf('/')+1; //14
        String leadIds = uri.substring(startIndexOfLeadIds);	//00Q5j000008EiIVEA0,00Q5j000008EiIWEA0,00Q5j000008EiIWEA0
        List<String> listLeadsIds = leadIds.split(',');
        
        List<Lead> deleteLeads = new List<Lead>();
        for(String leadId: listLeadsIds){
            deleteLeads.add(new Lead(Id = leadId));
        }
        Database.DeleteResult[] results = Database.delete(deleteLeads, false);
        return 'All leads mentioned deleted';
    }
}