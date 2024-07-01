trigger US_Q7_PriceBook_Populated_Automatically on SBQQ__Quote__c (before insert) {
    //PriceBook_Populated_Automatically_Class.priceBookNames(trigger.new);
    for(SBQQ__Quote__c q:trigger.new){
        Pricebook2 p= [select Name from Pricebook2 where name='Whole Saler Price Book'];
        q.SBQQ__priceBook__c=p.id;
    }
}