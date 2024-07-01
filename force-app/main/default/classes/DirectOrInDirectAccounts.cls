public class DirectOrInDirectAccounts {
list<Account> accs=[select Name,Industry,Type
                            from Account
                   where Type!='Customer - Direct'];   
}