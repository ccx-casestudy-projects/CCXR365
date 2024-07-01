public class PriceBook_Populated_Automatically_Class {
      public static void priceBookNames(List<SBQQ__Quote__c> qu){
 	list<Pricebook2> pbList=[select Name from Pricebook2];
          list<id> pbids=new list<id>();
          
          for( Pricebook2 pb:pbList){
              pbids.add(pb.id);
          }
        for(SBQQ__Quote__c q:qu)
        {
           Pricebook2 p= [select Name from Pricebook2 where name='Standard Price Book'];
           q.SBQQ__priceBook__c=p.name;
            for(id pid:pbids){
                if(q.SBQQ__priceBook__r.id!=pid){
                   q.addError('Not a valid Price Book');  
                }
            }
            }            
        }
    }