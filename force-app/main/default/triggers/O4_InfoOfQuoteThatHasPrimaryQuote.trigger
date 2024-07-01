trigger O4_InfoOfQuoteThatHasPrimaryQuote on SBQQ__Quote__c (before insert) {
    O4_InfoOfQuoteThatHasPrimaryQuote.setPrimaryQuote(trigger.new);
}