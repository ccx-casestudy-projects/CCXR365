trigger US_Q13_Customer_URL on SBQQ__Quote__c (before insert,before update) {
  if(trigger.isInsert){
       US_Q13_CustomerURLonQuote.urlofAcc(trigger.new);
    }
    if(trigger.isUpdate){
        for(SBQQ__Quote__c oQ : trigger.old){
            for(SBQQ__Quote__c nQ : trigger.new){
                if(oq.id==nq.id && oq.Customer_URL__c != nq.Customer_URL__c){
                    US_Q13_CustomerURLonQuote.urltoUpdate(trigger.old,trigger.new);
                }
            }
        } 
    }
}