trigger US_A10_ActiveLocationsTrig on Order (after insert,after update) {

    US_A10_UpdateAccountLocation.UpdtAccLocationList(trigger.new);
}