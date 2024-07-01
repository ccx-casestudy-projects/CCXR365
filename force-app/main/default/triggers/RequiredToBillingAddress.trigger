trigger RequiredToBillingAddress on Opportunity (before update) {
for(Opportunity opp:trigger.new){
            if(opp.account.BillingStreet ==NULL || opp.account.BillingState ==NULL || opp.account.BillingCity==NULL){
                opp.account.addError('Billing Address information must be required');
    }
}
}