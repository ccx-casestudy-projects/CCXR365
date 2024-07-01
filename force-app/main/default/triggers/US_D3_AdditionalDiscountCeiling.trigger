trigger US_D3_AdditionalDiscountCeiling on SBQQ__Quote__c (before update) {
    for(SBQQ__Quote__c q:trigger.new)
    {
        for(SBQQ__QuoteLine__c ql:[select SBQQ__Quote__c,SBQQ__Discount__c,SBQQ__ProductCode__c from SBQQ__QuoteLine__c
                                  where SBQQ__Quote__r.Id=:q.Id])
        {
            Product2 p=[select Name,Maximum_Discount__c from Product2 where ProductCode=:ql.SBQQ__ProductCode__c];
            if(p.Maximum_Discount__c!=NULL && ql.SBQQ__Discount__c>p.Maximum_Discount__c)
            {
                q.addError('Additional Discount Should be less than ceiling');
            }
        }
    }
}