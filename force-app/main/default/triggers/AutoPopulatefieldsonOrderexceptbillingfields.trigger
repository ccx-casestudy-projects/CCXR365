trigger AutoPopulatefieldsonOrderexceptbillingfields on Order (after update) {
List<Order> olist=new list<Order>();
List<Order>o1list=[Select id,AccountId,Status,EffectiveDate
                  from Order
                  where id in:trigger.new];
    for( Order o:o1list){
     List<Account>accs=[Select id,Name from Account];
     List<SBQQ__Quote__c> qlist=[Select SBQQ__Ordered__c,SBQQ__Account__c from SBQQ__Quote__c];      
        for(Account a:accs){
            for(SBQQ__Quote__c q:qlist){
                if(q.SBQQ__Ordered__c==true){
                   o.AccountId=q.SBQQ__Account__c;
                   o.EffectiveDate=System.today();
                   o.Status='Activated';
                   olist.add(o); 
                }
            }
            
            }
        }
insert olist;    
    }