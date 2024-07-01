public class US_A10_UpdateAccountLocation {
    
    public static void UpdtAccLocationList(list<order> ords){
        list<id> accIds =new list<Id>();
        list<Schema.Location> loclist=new list<Schema.Location>();
        list<Schema.Location> updateLoclist=new list<Schema.Location>(); 
        list<Account> ac1 = new List<Account>();
        
        for(Order o:ords){
            accIds.add(o.AccountId);
                 }
       loclist=[select Name,Account__r.id,Is_Active__c 
                from location
                where Account__r.id in :accIds];

        for(Order o:ords){      
            for(Schema.location l:locList){
                if(o.BillingStreet==l.Name && o.AccountId==l.Account__c&&l.Is_Active__c!=True){
                    l.Is_Active__c=true;
                    updateLoclist.add(l);
                    System.debug(l.Name+ ' ' + l.Is_Active__c);
                }
                update updateLoclist;
            }}
        list<Account> accs=[select Name,No_Of_Locations2__c,Number_of_Active_Locations__c
                      	from Account where Id=:accids];
            for(Account  a:accs){
                
                Integer i = [Select count() 
                         from Location 
                         where Account__r.id=:a.Id];
            	System.debug('Loc='+i);
             	a.No_Of_Locations2__c=i;
                        Integer i2 = [Select count() 
                         from Location 
                         where Account__r.id=:a.Id and is_Active__c = True];
          	a.Number_of_Active_Locations__c=i2;
            ac1.add(a);
                System.debug(ac1);
            }            
           	update ac1;  
    }
}