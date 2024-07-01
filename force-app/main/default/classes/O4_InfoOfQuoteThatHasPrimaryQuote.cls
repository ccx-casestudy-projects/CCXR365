public class O4_InfoOfQuoteThatHasPrimaryQuote {
    public static void setPrimaryQuote(list<SBQQ__Quote__c> newQts){
        list<Opportunity> ops=new list<Opportunity>();
        list<SBQQ__Quote__c> qts = new list<SBQQ__Quote__c>();
        list<SBQQ__Quote__c> updateqts = new list<SBQQ__Quote__c>();      
        for(SBQQ__Quote__c q:newQts){
            system.debug(q.SBQQ__Account__c);
            Account a=[select id,name,                          
                       (select name from orders)
                       from account where id=:q.SBQQ__Account__c];
            list<order>ords=a.orders;
            System.debug(ords);
            if(a!=null && ords.size()<1){
                qts= [select SBQQ__Opportunity2__c,SBQQ__Primary__c 
                      From SBQQ__Quote__c
                      where SBQQ__Opportunity2__r.name=:q.SBQQ__Opportunity2__r.name];
                if(qts.size()>0){                
                    for(SBQQ__Quote__c q1:qts){
                        if(q1.SBQQ__Opportunity2__c!=null && (q1.SBQQ__Primary__c==true||q1.SBQQ__Primary__c==null)){
                            q1.SBQQ__Primary__c=false; 
                            updateqts.add(q1);
                        }
                    } }      
                q.SBQQ__Primary__c=true;
                Opportunity op=[select id,SBQQ__PrimaryQuote__c 
                                from Opportunity where id=:q.SBQQ__Opportunity2__c];
                system.debug(op);
                op.SBQQ__PrimaryQuote__c=q.id;
                ops.add(op);                        
            }             
            update updateqts;
            update ops;
        }           
    }
}