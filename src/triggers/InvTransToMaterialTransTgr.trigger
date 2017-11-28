trigger InvTransToMaterialTransTgr on KNDY4__Inventory_Transaction__c(after update) {

    if(!InventoryTransactionTgrHandler.executed) {
        InventoryTransactionTgrHandler.mapInventoryTransacations(trigger.new, trigger.old);
        InventoryTransactionTgrHandler.executed=true;
    }

}
