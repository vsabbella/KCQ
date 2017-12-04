
public with sharing class CQMaterialTransactionBatchHandler {
    final Static String CQMATERIALTRANSACTION_TRANSCODE_INSPECTION_PASS = 'INSPECTION_PASS';
    final Static String CQMATERIALTRANSACTION_TRANSCODE_INSPECTION_FAIL = 'INSPECTION_FAIL';
    public static final String MATERIAL_TRANSACTION_RTV='RTV';
    public static final String MATERIAL_TRANSACTION_SCRAP='SCRAP';
    public static final String MATERIAL_TRANSACTION_USEASIS='USE_AS_IS';


    final Static String CQMATERIALTRANSACTION_STATUS_COMPLETED ='Completed';

    public static void processCQMaterialTransactions(List<Sobject> SObjectList){
        //system.assert(false, 'assertion here.'+JSON.serialize(SObjectList));
        List<Sobject> MTSobjectList= new List<Sobject>();
        set<String> PO_WO_Numbers = new set<String>();
        set<String> LotNumbers = new set<String>();

        for(SObject Sobj: SObjectList){
            Sobj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Status__c, CQMATERIALTRANSACTION_STATUS_COMPLETED);
            String SobjTransCode = (String)SObj.get(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Transaction_Code__c);
            If(CQMATERIALTRANSACTION_TRANSCODE_INSPECTION_PASS.equals(SobjTransCode)){
                MTSobjectList.add(Sobj);
                PO_WO_Numbers.add((String)Sobj.get(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__PO_WO_Number__c));
                LotNumbers.add((String)SObj.get(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Lot_Number__c));

                //TOD0: Bulkify this.
                /*
                List<KNDY4__Lot__c> LotList = [select id,name,KNDY4__Lot_Hold__c from KNDY4__Lot__c
                                               where Name = :LotNumber and KNDY4__Item__c IN (select KNDY4__Item__c from KNDY4__Work_Order__c where name In:PO_WO_Numbers or KNDY4__Item__c IN (select KNDY4__Item__c from KNDY4__Purchase_Order_Line__c where name In:PO_WO_Numbers))
                                               order by createdDate desc limit 1
                                              ];*/

                /*
                * ( KNDY4__Item__c IN (select KNDY4__Item__c from KNDY4__Work_Order__c where name In:PO_WO_Numbers )
                                                                             or KNDY4__Item__c IN (select KNDY4__Item__c from KNDY4__Purchase_Order_Line__c where name In:PO_WO_Numbers)
                                                                           )

                if(LotList.size()>0){
                    LotList[0].put(Schema.KNDY4__Lot__c.KNDY4__Lot_Hold__c, False);
                    update LotList[0];
                }
                 */

                //update (compliancequest__SQX_Material_Transaction__c)Sobj;

            }
            else If(CQMATERIALTRANSACTION_TRANSCODE_INSPECTION_FAIL.equals(SobjTransCode)){
                //MTSobjectList.add(Sobj);
            }
            else if(MATERIAL_TRANSACTION_RTV.equals(SobjTransCode)){
                //MTSobjectList.add(Sobj);

            }
            else if(MATERIAL_TRANSACTION_SCRAP.equals(SobjTransCode)){
                //MTSobjectList.add(Sobj);
            }
            else if(MATERIAL_TRANSACTION_USEASIS.equals(SobjTransCode)){
                MTSobjectList.add(Sobj);
            }

            releaseLots(new List<String>(LotNumbers), new List<String>(PO_WO_Numbers));
            update (List<compliancequest__SQX_Material_Transaction__c>)MTSobjectList;


            // how to get the lot associated with Item, from the part number. // Lot number on material transaction.
            // Diff. between Lot number and supplier lot number.


        }

    }

    public static void releaseLots(List<String> LotNames , List<String> POWONumbers){
        List<Id> ItemIds = new List<Id>();
        for(KNDY4__Work_Order__c wo : [select Id,Name,KNDY4__Item__c from KNDY4__Work_Order__c where Name In : (POWONumbers)]){
            ItemIds.add(wo.KNDY4__Item__c);
        }
        for(KNDY4__Purchase_Order_Line__c wo : [select Id,Name,KNDY4__Item__c from KNDY4__Purchase_Order_Line__c where Name In : (POWONumbers)]){
            ItemIds.add(wo.KNDY4__Item__c);
        }

        for(List<KNDY4__Lot__c> lotList:[select id,name,KNDY4__Lot_Hold__c from KNDY4__Lot__c]){
            for(KNDY4__Lot__c lot: lotList){
                lot.put(Schema.KNDY4__Lot__c.KNDY4__Lot_Hold__c, False);
            }
            update lotList;
        }
    }
}
