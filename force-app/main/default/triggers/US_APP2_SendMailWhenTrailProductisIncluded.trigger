trigger US_APP2_SendMailWhenTrailProductisIncluded on sbaa__Approval__c (after update,after insert) {
    US_APP2_SendMailToUserClass.applist(trigger.new);
    }