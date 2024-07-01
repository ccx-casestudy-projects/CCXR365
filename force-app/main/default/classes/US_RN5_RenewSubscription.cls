public class US_RN5_RenewSubscription {
    public static void renewContract(list<contract> c1){
        list<Contract> C=[Select name,(select name from SBQQ__Subscriptions__r) 
                          from contract 
                          where SBQQ__RenewalQuoted__c=false order by createdDate desc limit 1];
        for(contract con:c){
            for(contract con2:c1){
                if(con.SBQQ__Subscriptions__r.size()<0 &&con.id==con2.id){
                    con2.addError('Can not update Old Contract');
                }
            }
        }
        
    }
}