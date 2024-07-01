public class UserClass {
    public void getuserInfo(){
        Id userId =UserInfo.getUserId(); 
        User example = [SELECT id,lastname FROM User WHERE Id =: userId];
        String uname=example.lastname;
        system.debug(example.lastname);
        GroupMember gname=[Select userorGroupId,group.name
                           From GroupMember 
                           where userorGroupId=:example.id];
        System.debug(gname);
        
    }

}