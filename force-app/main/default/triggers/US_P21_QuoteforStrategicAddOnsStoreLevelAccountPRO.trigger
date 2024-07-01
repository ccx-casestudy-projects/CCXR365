trigger US_P21_QuoteforStrategicAddOnsStoreLevelAccountPRO on SBQQ__QuoteLine__c (after insert) {
    for(SBQQ__QuoteLine__c ql:trigger.new)
    {
        if((ql.SBQQ__Quote__r.AccountSegmentType__c=='Strategic')&&
           (ql.SBQQ__ProductCode__c=='R365-ENTACC')&&
           (ql.SBQQ__ProductFamily__c=='Add-On Services'))
        {
            ql.addError('You Should Select Store level Account for additional add ons and the Account Segment type should be "Strategic"');
        }
    }
}