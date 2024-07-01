trigger US_APP7_IfStatucIsRejectedEditIsNotAllowed on sbaa__Approval__c (after insert,after update) {
    for(sbaa__Approval__c q:trigger.new){
        if(q.sbaa__CommentsLong__c!=NULL && q.Quote__r.SBQQ__Status__c=='Rejected'){
            q.addError('You are not accessable to "Edit" the Quote anymore,Instead you can create a new quote or clone the rejected quote and adjust the quote according to the comment by approver before re-submitting for approval');
        }
    }

}