public class DisplayLocations
{  
    public void getLocations()
    {
        list<Schema.Location> locationList=[select Name,LocationType 
                                     from Location];
        for(Schema.Location l1:locationList)
        {
            system.debug('Location Name : '+l1.Name);
            system.debug('Location Type : '+l1.LocationType);
        }
    }
}