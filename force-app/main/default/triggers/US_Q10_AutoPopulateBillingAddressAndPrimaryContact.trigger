trigger US_Q10_AutoPopulateBillingAddressAndPrimaryContact on SBQQ__Quote__c (before insert) {
    List<SBQQ__Quote__c> qlist=new list<SBQQ__Quote__c>();
    list<SBQQ__Quote__c> qt=[Select id,Name,SBQQ__PrimaryContact__c,SBQQ__PrimaryContact__r.Name,
                              SBQQ__Account__r.id,
                              SBQQ__Opportunity2__r.AccountId
                              from SBQQ__Quote__c 
                              where id in:trigger.new];
   
    for(SBQQ__Quote__c q:qt){
     List<Account> aclist=[Select id,Name,(Select Name,AccountId from Opportunities) from Account];
        for(Account a:aclist){
           
            for(Opportunity o:a.Opportunities){
        if(q.SBQQ__Account__r.id==o.AccountId){
           q.SBQQ__PrimaryContact__c=q.SBQQ__PrimaryContact__r.Name;
            qlist.add(q);
        }
    }
    }
    }
    
   insert qlist; 

}