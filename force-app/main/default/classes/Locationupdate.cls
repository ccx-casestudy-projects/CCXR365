public class Locationupdate {
    
    public void UpdtAccLocationList(){
        
        list<Account> acc = [Select Id,Name,NumberofLocations__c,Number_of_Active_Locations__c 
                             from Account];
        list<Id> accIds =new list<Id>();
        
        for(Account a:acc){
            accIds.add(a.id);
        }
        
        list<order> ord = [Select accountId,Status,BillingStreet 
                           from Order 
                           where accountId in :accIds];
        list<Schema.Location> loclist=[select Name,Account__c,Is_Active__c 
                                       from location
                                       where Account__c in :accIds];
        
        list<Account> ac1 = new List<Account>();
        for(Order o: ord){
            
            Schema.Location lc = [Select Name,Account__c,is_Active__c 
                                  from Location 
                                  where Account__r.id = :o.Account.Id and Name=:o.BillingStreet];
            if(lc.is_Active__c == NULL){
                lc.is_Active__c=True;
                loclist.add(lc);
            }
        }
        update loclist;
        
        for(Account a: acc){    
            Integer i = [Select count() 
                         from Location 
                         where Account__c=:a.Id];
            
            a.NumberofLocations__c=i;
            
            Integer i2 = [Select count() 
                          from Location 
                          where Account__c=:a.id and is_Active__c = True];
            a.Number_of_Active_Locations__c=i2;
            ac1.add(a);
            
        }
        update ac1;
        
    }
}