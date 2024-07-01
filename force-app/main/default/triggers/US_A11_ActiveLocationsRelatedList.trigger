trigger US_A11_ActiveLocationsRelatedList on Location (after insert,after update) {
 Active_Locations__c listLoc = new Active_Locations__c();
    if(trigger.isInsert){
        for(Schema.Location l:trigger.new){
        if(l.Account__c != NUll&&l.Is_Active__c==True){
            listLoc.Name=l.Name;
            listLoc.Account__c=l.Account__c;
            insert listLoc;
        }   
    }
    }
    if(trigger.isUpdate){
        for(Schema.Location l:trigger.new){
        if(l.Account__c != NUll&&l.Is_Active__c==True){
            listLoc.Name=l.Name;
            listLoc.Account__c=l.Account__c;
            insert listLoc;
        }
    }
    }
}