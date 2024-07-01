trigger US_Q6_ReadOnly on SBQQ__Quote__c (after insert,after update) {
for (SBQQ__Quote__c q : Trigger.new) {
     
      if (Trigger.isUpdate && q.SBQQ__SubscriptionTerm__c==null) {
        q.SBQQ__SubscriptionTerm__c.addError('This field is read-only and cannot be modified.');
      }
     
     
   }
}