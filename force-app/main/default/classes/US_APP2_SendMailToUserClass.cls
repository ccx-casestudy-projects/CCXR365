public class US_APP2_SendMailToUserClass {
    public static void applist(list<sbaa__Approval__c> aplist){
        
        List<sbaa__Approval__c> newlist=new list<sbaa__Approval__c>();
        list<id> aid=new list<id>();
        list<String>toAddress=new list<String>();
        
        for(sbaa__Approval__c a:aplist){
            
            list<SBQQ__QuoteLine__c> qlist=[Select id,Name,SBQQ__Quote__c,SBQQ__Product__r.Trail_Product__c
                                            from SBQQ__QuoteLine__c 
                                            where SBQQ__Quote__c=:a.Quote__c and SBQQ__Product__r.Trail_Product__c=true];
            List<sbaa__Approval__c> aplist2=[Select Quote__c,OwnerId from sbaa__Approval__c];
            
            for(sbaa__Approval__c a1:aplist2){
                for(SBQQ__QuoteLine__c ql1:qlist){
                    if(a1.Quote__c==ql1.SBQQ__Quote__c){
                        newlist.add(a1);
                        aid.add(a1.OwnerId);
                        system.debug(a1.OwnerId);
                    }
                }
            }
        }    
        list<User> user1=[Select id,Email From User where id in:aid];
        for(sbaa__Approval__c ap:newlist){
            for(User u:user1){
                if(ap.OwnerId==u.id){
                    toAddress.add(u.Email);
                    Messaging.SingleEmailMessage myemail=new Messaging.SingleEmailMessage();
                    myemail.setToAddresses(toAddress);
                    myemail.setSubject('Trail Products Are Included');
                    myemail.setPlainTextBody('The Trail Products are included in the Quote.Please Approve this Quote.');
                    Messaging.SendEmail(new Messaging.SingleEmailMessage[]{myemail});
                    
                }
            }
        }
    }
    
}