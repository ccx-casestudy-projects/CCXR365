public class US_Q13_CustomerURLonQuote {
    public static void urlofAcc(list<SBQQ__Quote__c> urlq){
        
        for(SBQQ__Quote__c q: urlq){
            String l = 'restaurant365';
            
            if(q.SBQQ__Account__c != NULL){
                Account a =[Select id,Name from Account where id=:q.SBQQ__Account__c];
                String m = (a.Name).deleteWhitespace();
                
                if(m.length()>20 && l.length()<=20){
                    if((l.left(1)).isNumeric()==False){
                        q.Customer_URL__c = m.substring(0,19)+'.'+l+'.com'; 
                    }
                    else{
                        q.Customer_URL__c.addError('Sub-Domain should start with alphabet only!'); 
                    }
                    
                }
                
                else if((m.length()>20 || m.length()<20) && l.length()>20){
                    q.Customer_URL__c.addError('Sub-Domain exceeds limit of 20 characters!');
                }
                
                else {
                    q.Customer_URL__c = m+'.'+l+'.com';
                }
            }
            
        }
    }
    
    public static void urltoUpdate(list<SBQQ__Quote__c> oldQ, list<SBQQ__Quote__c> newQ){
        
        for(SBQQ__Quote__c q1:oldQ){
            for(SBQQ__Quote__c q2: newQ){
                
                if(q1.id==q2.id){
                    if(q1.Customer_URL__c.split('\\.').get(0)!=q2.Customer_URL__c.split('\\.').get(0) || q1.Customer_URL__c.split('\\.').get(2) != q2.Customer_URL__c.split('\\.').get(2)){
                        q2.Customer_URL__c.addError('Domain and AccountName cannot be changed!');
                    }
                    else if(q1.Customer_URL__c.split('\\.').get(1) != q2.Customer_URL__c.split('\\.').get(1)){
                        if(q2.Customer_URL__c.split('\\.').get(1).length()>20){
                            q2.Customer_URL__c.addError('Sub domain length cannot Exceed 20!');
                        }
                        if((q2.Customer_URL__c.split('\\.').get(1).left(1)).isNumeric()==True){
                            q2.Customer_URL__c.addError('Sub-Domain should start with alphabet only!'); 
                        }     
                    }
                }
            }
        }
    }
}