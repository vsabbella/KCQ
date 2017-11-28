/**
 * Created by venkatasabbella on 11/2/17.
 */

public with sharing class CQMaterialTransactionMonitorBatch implements Database.Batchable<sObject>,KNDY4.Process.Runnable2 {
    private KNDY4__Process_Job__c job;
    public void runBatch(KNDY4__Process_Job__c job) {
        this.job = job;
        Database.executeBatch(this, 1);
    }
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('select id,name,compliancequest__Transaction_Code__c,compliancequest__Lot_Number__c,compliancequest__Status__c from compliancequest__SQX_Material_Transaction__c where (compliancequest__Transaction_Code__c =\'INSPECTION_PASS\'  or compliancequest__Transaction_Code__c = \'INSPECTION_FAIL\') and compliancequest__Status__c = \'Pending\' ');
    }
    public void execute(Database.BatchableContext bc, List<SObject> Scope) {
        CQMaterialTransactionBatchHandler.processCQMaterialTransactions(Scope);
    }
    public void finish(Database.BatchableContext bc) {

    }

}
