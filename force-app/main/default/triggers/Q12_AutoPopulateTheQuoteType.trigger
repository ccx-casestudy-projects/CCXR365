trigger Q12_AutoPopulateTheQuoteType on SBQQ__Quote__c (after insert){
    list<SBQQ__Quote__c> qt = new list<SBQQ__Quote__c>();
    List<SBQQ__Quote__c> qlist=[Select id,SBQQ__Type__c,SBQQ__Opportunity2__c,
                                SBQQ__Opportunity2__r.SBQQ__RenewedContract__c,
                               SBQQ__Opportunity2__r.SBQQ__AmendedContract__c from SBQQ__Quote__c
                               where id in:trigger.new];
    for(SBQQ__Quote__c q:qlist){
        if(q.SBQQ__Opportunity2__c!=null){
        if(q.SBQQ__Opportunity2__r.SBQQ__RenewedContract__c!=null){
            q.SBQQ__Type__c='Renewal';
        }
      if(q.SBQQ__Opportunity2__r.SBQQ__AmendedContract__c!=null){
            q.SBQQ__Type__c='Amendment';
        }
        }
        qt.add(q);
    }
 update qt;   
}