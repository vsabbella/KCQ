
public with sharing class CQMaterialTransactionBatchHandler {
    final Static String CQMATERIALTRANSACTION_TRANSCODE_INSPECTION_PASS = 'INSPECTION_PASS';
    final Static String CQMATERIALTRANSACTION_TRANSCODE_INSPECTION_FAIL = 'INSPECTION_FAIL';
    public static final String MATERIAL_TRANSACTION_RTV='RTV';
    public static final String MATERIAL_TRANSACTION_SCRAP='SCRAP';
    public static final String MATERIAL_TRANSACTION_USEASIS='USE_AS_IS';


    final Static String CQMATERIALTRANSACTION_STATUS_COMPLETED ='Completed';

    public static void processCQMaterialTransactions(List<Sobject> SObjectList){
        List<Sobject> MTSobjectList= new List<Sobject>();
        set<String> PO_WO_Numbers = new set<String>();
        set<String> LotNumbers = new set<String>();
        Map<String,String> lotHoldReason = new Map<String,String>();
        Map<String,Boolean> lotHoldStatus = new Map<String,Boolean>();


        for(SObject Sobj: SObjectList){
            Sobj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Status__c, CQMATERIALTRANSACTION_STATUS_COMPLETED);
            String SobjTransCode = (String)SObj.get(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Transaction_Code__c);
            String LotNumber = (String)SObj.get(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Lot_Number__c);
            String PO_WO_Number = (String)Sobj.get(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__PO_WO_Number__c);
            PO_WO_Numbers.add(PO_WO_Number);

            If(CQMATERIALTRANSACTION_TRANSCODE_INSPECTION_PASS.equals(SobjTransCode)){
                MTSobjectList.add(Sobj);
                if(!String.isEmpty(LotNumber)){
                    lotHoldReason.put(LotNumber,null);
                    lotHoldStatus.put(LotNumber, false);
                }
            }
            else if(CQMATERIALTRANSACTION_TRANSCODE_INSPECTION_FAIL.equals(SobjTransCode)){
                //system.assert(false);
                MTSobjectList.add(Sobj);
                //PO_WO_Numbers.add((String)Sobj.get(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__PO_WO_Number__c));
                if(!String.isEmpty(LotNumber)){
                    //LotNumbers.add(LotNumber);
                    lotHoldStatus.put(LotNumber, true);
                    lotHoldReason.put(LotNumber,CQMATERIALTRANSACTION_TRANSCODE_INSPECTION_FAIL);
                    system.debug(LoggingLevel.ERROR, JSON.serialize(lotHoldReason));
                    system.debug(LoggingLevel.ERROR, JSON.serialize(Sobj));

                }

            }
            else if(MATERIAL_TRANSACTION_RTV.equals(SobjTransCode)){
                MTSobjectList.add(Sobj);
                if(!String.isEmpty(LotNumber)){
                    //LotNumbers.add(LotNumber);
                    lotHoldStatus.put(LotNumber, true);
                    lotHoldReason.put(LotNumber,MATERIAL_TRANSACTION_RTV);
                }

            }
            else if(MATERIAL_TRANSACTION_SCRAP.equals(SobjTransCode)){
                MTSobjectList.add(Sobj);
                if(!String.isEmpty(LotNumber)){
                    lotHoldStatus.put(LotNumber, true);
                    lotHoldReason.put(LotNumber,MATERIAL_TRANSACTION_SCRAP);
                }
            }
            else if(MATERIAL_TRANSACTION_USEASIS.equals(SobjTransCode)){
                MTSobjectList.add(Sobj);
                PO_WO_Numbers.add((String)Sobj.get(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__PO_WO_Number__c));
                if(!String.isEmpty(LotNumber)){
                    //LotNumbers.add(LotNumber);
                    lotHoldReason.put(LotNumber,MATERIAL_TRANSACTION_USEASIS);
                    lotHoldStatus.put(LotNumber, false);
                }

            }
            LotNumbers.addAll(lotHoldStatus.keyset());

            releaseLots(new List<String>(LotNumbers), new List<String>(PO_WO_Numbers), lotHoldStatus,lotHoldReason);
            update (List<compliancequest__SQX_Material_Transaction__c>)MTSobjectList;


            // how to get the lot associated with Item, from the part number. // Lot number on material transaction.
            // Diff. between Lot number and supplier lot number.


        }

    }

    public static void releaseLots(List<String> LotNames , List<String> POWONumbers,Map<String,Boolean> lotHoldStatusMap , Map<String,String> lotHoldReasonMap){
        List<Id> ItemIds = new List<Id>();
        for(KNDY4__Work_Order__c wo : [select Id,Name,KNDY4__Item__c from KNDY4__Work_Order__c where Name In : (POWONumbers)]){
            ItemIds.add(wo.KNDY4__Item__c);
        }

        for(KNDY4__Purchase_Order_Line__c po: [select Id,Name,KNDY4__Item__c from KNDY4__Purchase_Order_Line__c where KNDY4__Purchase_Order__r.name In : (POWONumbers)]){
            ItemIds.add(po.KNDY4__Item__c);
        }
        system.debug(LoggingLevel.ERROR, 'lots:'+JSON.serialize(LotNames) + ': Items; ' + JSON.serialize(itemIds));
        String Query = 'select id,name,KNDY4__Lot_Hold__c,KNDY4__Lot_Hold_Reason__c from KNDY4__Lot__c where name in :LotNames and KNDY4__Item__c in:ItemIds';
        system.debug(LoggingLevel.ERROR,Query);
        for(List<KNDY4__Lot__c> lotList:database.query(Query)){
            for(KNDY4__Lot__c lot: lotList){
                System.debug(LoggingLevel.ERROR,lotHoldStatusMap);

                boolean lotStatus = lotHoldStatusMap.get(lot.name);
                lot.put(Schema.KNDY4__Lot__c.KNDY4__Lot_Hold__c, lotStatus);
                String lotHoldReason = lotHoldReasonMap.get(lot.name);
                System.debug(LoggingLevel.ERROR,lotHoldReason);
                lot.put(Schema.KNDY4__Lot__c.KNDY4__Lot_Hold_Reason__c, lotHoldReason);
            }
            update lotList;
        }
    }
}
