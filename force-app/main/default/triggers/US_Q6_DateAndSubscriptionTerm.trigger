trigger US_Q6_DateAndSubscriptionTerm on SBQQ__Quote__c (after insert) {
    List<SBQQ__Quote__c> newlist=new list<SBQQ__Quote__c>();
    List<SBQQ__Quote__c> qlist=[Select id,SBQQ__StartDate__c,SBQQ__SubscriptionTerm__c
                                from SBQQ__Quote__c
                                where id in:trigger.new];
    for(SBQQ__Quote__c q:qlist){
        if((q.SBQQ__StartDate__c==Null && q.SBQQ__SubscriptionTerm__c==NUll) || (q.SBQQ__StartDate__c!=Null && q.SBQQ__SubscriptionTerm__c!=NUll)) {
           q.SBQQ__StartDate__c=system.today()+1;
           q.SBQQ__EndDate__c=q.SBQQ__StartDate__c.ADDMONTHS(12); 
           q.SBQQ__SubscriptionTerm__c=12; 
        }
       newlist.add(q);
    }
update newlist;
    
}