public class PartnerAccountsCls {
    public list<Account> getparentAccs(){
        list<Account> accs=[select Name,Industry,Type
                            from Account
                           ];   
        list<Account> a1=new list<Account>();
        for(Account a2:accs){
            if(a2.Type!='Customer - Direct'){
                 a1=[select Name,ParentId from Account where ParentId=:a2.id];
            }
        }
        return a1;
    }
}