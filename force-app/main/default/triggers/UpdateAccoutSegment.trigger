trigger UpdateAccoutSegment on Account (before update) {
    for(Account a:trigger.new){
        if(a.Strategic__c==true){
            a.Segment2__c='Strategic';
        }
        else if(a.No_Of_Locations2__c>=1&&a.No_Of_Locations2__c<=5){
            a.Segment2__c='	Small and Medium Business(SMB)';
        }
        else if
            (a.No_Of_Locations2__c>=6&&a.No_Of_Locations2__c<=30){
            a.Segment2__c='Mid-Market(MM)';
            }
        else
            {
            a.Segment2__c='Enterprise';
        
    }
}
}