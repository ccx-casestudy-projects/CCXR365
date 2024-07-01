trigger US_APP7If_Quote_Status_Rejected_Edit_NotAccessable on SBQQ__Quote__c (after insert,after update) {
    for(SBQQ__Quote__c ql:trigger.new){
        if(ql.SBQQ__Status__c=='Rejected'){
            ql.addError('You are not accessable to "Edit" the Quote anymore,Instead you can create a new quote or clone the rejected quote and adjust the quote according to the comment by approver before re-submitting for approval');   
        }
    }
}