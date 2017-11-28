/**
 * Created by venkatasabbella on 11/2/17.
 */

public with sharing class CQMaterialTransactionBatchHandler {
    final Static String CQMATERIALTRANSACTION_TRANSCODE_INSPECTION_PASS = 'INSPECTION_PASS';
    final Static String CQMATERIALTRANSACTION_TRANSCODE_INSPECTION_FAIL = 'INSPECTION_FAIL';
    final Static String CQMATERIALTRANSACTION_STATUS_COMPLETED ='Completed';

    public static void processCQMaterialTransactions(List<Sobject> SObjectList){
        //system.assert(false, 'assertion here.'+JSON.serialize(SObjectList));
        for(SObject Sobj: SObjectList){
            If(CQMATERIALTRANSACTION_TRANSCODE_INSPECTION_PASS.equals((String)SObj.get(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Transaction_Code__c))){

                Sobj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Status__c, CQMATERIALTRANSACTION_STATUS_COMPLETED);
                //TOD0: Bulkify this.
                String LotNumber = (String)SObj.get(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Lot_Number__c);
                KNDY4__Lot__c Lot = [select id,name,KNDY4__Lot_Hold__c from KNDY4__Lot__c where Name = :LotNumber order by createdDate desc limit 1];
                Lot.put(Schema.KNDY4__Lot__c.KNDY4__Lot_Hold__c, False);
                //system.assert(false,'MT'+ JSON.serialize(SObj) + 'LOT:' +JSON.serialize(Lot));
                update (compliancequest__SQX_Material_Transaction__c)Sobj;
                update Lot;
            }
            else If(CQMATERIALTRANSACTION_TRANSCODE_INSPECTION_FAIL.equals((String)SObj.get(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Transaction_Code__c))){

                Sobj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Status__c, CQMATERIALTRANSACTION_STATUS_COMPLETED);

                update (compliancequest__SQX_Material_Transaction__c)Sobj;
            }
            // how to get the lot associated with Item, from the part number. // Lot number on material transaction.
            // Diff. between Lot number and supplier lot number.


        }

    }
}
