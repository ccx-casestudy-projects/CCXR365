trigger US_O7UpdateClosedWonOpportunityTrigger on Opportunity (before update) {
    for(Opportunity o:trigger.new){
        if(o.StageName=='Closed Won'){
            o.addError('Can\'t modify Closed won opportunity');
        }
    }

}