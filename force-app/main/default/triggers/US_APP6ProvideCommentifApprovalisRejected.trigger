trigger US_APP6ProvideCommentifApprovalisRejected on sbaa__Approval__c (after insert) {
    for(sbaa__Approval__c app:trigger.new){
        if(app.sbaa__CommentsLong__c==NULL && app.sbaa__Status__c=='Rejected'){
            app.addError('If Approval Status is "Rejected" Comments Section Should be Explained');   
        }
    }
}