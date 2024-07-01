trigger US_RN5_RenewSubscriptionProductsBasedOnLatestContract on Contract (before update) {
    if(trigger.isUpdate){
        US_RN5_RenewSubscription.renewContract(trigger.new);    
    }
}