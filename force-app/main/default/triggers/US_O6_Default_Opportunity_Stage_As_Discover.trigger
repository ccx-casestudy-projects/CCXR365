trigger US_O6_Default_Opportunity_Stage_As_Discover on Opportunity (before insert)
{
    for(Opportunity opp: trigger.new){
        if(opp.Type=='Conquest'&&opp.stagename != 'Discover'){
            
            opp.stagename = 'Discover';
        }
    }
}