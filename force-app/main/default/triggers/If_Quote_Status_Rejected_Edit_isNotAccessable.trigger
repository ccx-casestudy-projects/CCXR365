trigger If_Quote_Status_Rejected_Edit_isNotAccessable on sbaa__Approval__c (after insert) {
List<sbaa__Approval__c> applist=new list<sbaa__Approval__c>();
List<sbaa__Approval__c> app=[Select id,sbaa__Status__c,Quote__r.SBQQ__Status__c
                            from sbaa__Approval__c
                            where id in:trigger.new];
    for(sbaa__Approval__c a:app){
        
        if(a.sbaa__Status__c=='Rejected'){
            a.Quote__r.SBQQ__Status__c='Rejected';
            applist.add(a);
        }
    }
    
   update applist;
}