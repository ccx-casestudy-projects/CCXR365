trigger US_O3_ConquestOpportunityAmendmentOpportunity on Opportunity (before insert,before update) {
    for(Opportunity o:trigger.new)
    {
        Account a=[select id,Name,(select Name from Contracts)
                   from Account where id=:o.AccountId];
        list<Contract> cons=a.Contracts;
        if(cons.size()<1)
        {
            o.Type='Conquest';
            
        }
        if(cons.size()>=1)
        {
            o.Type='Amendment';
        }
    }  
}