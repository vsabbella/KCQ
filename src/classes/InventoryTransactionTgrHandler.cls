
/**
 * Created by venkatasabbella on 11/14/17.
 */

public with sharing class InventoryTransactionTgrHandler {

    public static boolean executed=false;

    public static void mapInventoryTransacations(List<KNDY4__Inventory_Transaction__c> newList, List<KNDY4__Inventory_Transaction__c> oldList){
        set<String> WOITTypes = new Set<String>{
                'Work Order Assembly Completion',
                'Work Order Issue From WIP',
                'Work Order Component Issue',
                'Purchase Order Receipt'
        };
        List<KNDY4__Inventory_Transaction__c> InspectionITs = new List<KNDY4__Inventory_Transaction__c>();
        Map<Id, Map<String,KNDY4__Inventory_Transaction__c>> ItsByWOId = new Map<Id, Map<String,KNDY4__Inventory_Transaction__c>>();
        Map<Id,KNDY4__Inventory_Transaction__c> newMap = new  Map<Id,KNDY4__Inventory_Transaction__c>(newList);
        for(Id InvTransId: newMap.keyset()){
            KCQUtils KCQUtilObj = new KCQUtils();
            Sobject CQMaterialTransactionSObj = KCQUtilObj.getCQMaterialTransactionInstance();
            KNDY4__Inventory_Transaction__c ITRecord = newMap.get(InvTransId);
            if(ITTypes.contains(ITRecord.KNDY4__Type__c)){
                InspectionITs.add(ITRecord);
            }

        }

        if(InspectionITs.size()>0) {
            queryInvTransaction(InspectionITs, ItsByWOId);
            mapMaterialTransaction(ItsByWOId);
        }
    }

    public static void queryInvTransaction(List<KNDY4__Inventory_Transaction__c> newList, Map<Id, Map<String,KNDY4__Inventory_Transaction__c>> ItsByWOId){
        system.debug(LoggingLevel.ERROR, 'Before:'+ JSON.serialize(newList));
        set<Id> workOrderIds = new set<Id>();
        for(KNDY4__Inventory_Transaction__c ITRecord: newList){
            if(ITRecord.KNDY4__Work_Order__c!=null){
                workOrderIds.add(ITRecord.KNDY4__Work_Order__c);
            }
        }
        List<string> ITTypes = new List<string>{ 'Work Order Issue From WIP',
                                                 'Work Order Assembly Completion'
        };

        String ITQuery = 'select id,name,KNDY4__Lot__r.name, KNDY4__Work_Order__r.name, KNDY4__Operation_Tracking__c, KNDY4__Material_Tracking__c,KNDY4__Type__c,'+
        ' KNDY4__Line_Type__c, KNDY4__Item__r.name, KNDY4__Receipt_Line__c, KNDY4__Quantity__c,KNDY4__Item__r.Inspection_Required__c,'+
        ' KNDY4__Material_Tracking__r.KNDY4__Supplier__c,KNDY4__Material_Tracking__r.KNDY4__Item__r.name, KNDY4__Item__r.CQ_Part__c,KNDY4__Item__r.KNDY4__Supplier__r.KNDY4__Address__c,'+
        ' KNDY4__Material_Tracking__r.KNDY4__Quantity_Completed__c, KNDY4__Material_Tracking__r.KNDY4__Quantity_Required__c,CreatedDate '+
        ' from KNDY4__Inventory_Transaction__c where KNDY4__Work_Order__c IN : workOrderIds and  KNDY4__Type__c In :ITTypes order by createdDate desc';

        newList = database.query(ITQuery);
        //system.debug(LoggingLevel, 'newList:'+JSON.serialize(newList));
        for(KNDY4__Inventory_Transaction__c IT : newList){


            if(ItsByWOId.containsKey(IT.KNDY4__Work_Order__c)){
                Map<String,KNDY4__Inventory_Transaction__c> ITMap = ItsByWOId.get(IT.KNDY4__Work_Order__c);
                ITMap.put(IT.KNDY4__Type__c, IT);
                ItsByWOId.put(IT.KNDY4__Work_Order__c,ITMap);
              }
            else{
                Map<String,KNDY4__Inventory_Transaction__c> ITMap = new  Map<String,KNDY4__Inventory_Transaction__c>{IT.KNDY4__Type__c => IT};
                ItsByWOId.put(IT.KNDY4__Work_Order__c,ITMap);

            }
        //set<KNDY4__Inventory_Transaction__c> ITlist = ItsByWOId.get(IT.KNDY4__Work_Order__c)!=null?ItsByWOId.get(IT.KNDY4__Work_Order__c):new KNDY4__Inventory_Transaction__c[2];

        }

        //system.debug(false, 'ITMap:'+JSON.serialize(ItsByWOId));
        //system.assert(newList.size()>0,'No records retrieved' );
        system.debug(LoggingLevel.ERROR,'new List:'+newList.size());
        system.debug(LoggingLevel.ERROR, 'After:'+JSON.serialize(newList));
    }
    private static void mapMaterialTransaction(Map<Id, Map<String,KNDY4__Inventory_Transaction__c>> ItsByWOId){
        //system.assert(false, 'test');
        final String CQMT_TRANSCODE_INCOMERECEIPT = 'INCOMING_RECEIPT';
        final String CQMT_STATUS_PENDING = 'Pending';

        KCQUtils KCQUtilObj = new KCQUtils();
        List<Sobject> CQMaterialTransactionSObjList = new List<Sobject>();
        List<String> LotNumbers = new List<String>();


        for(Id WOId:ItsByWOId.keyset() ) {
            Map<String, KNDY4__Inventory_Transaction__c> ITMap = ItsByWOId.get(WOId);
            //
            //system.assert(false, JSON.serialize(RW));
            //system.debug(LoggingLevel.ERROR,'ITLIst Size: '+ITList.size());
//            if(ITList.size()!=2){
//                continue;
//            }
            //system.debug(LoggingLevel.ERROR, 'Before Insepction Required:' + ITList[0].KNDY4__Item__r.Inspection_Required__c);
            KNDY4__Inventory_Transaction__c ITComp = ITMap.get('Work Order Assembly Completion');
                    system.assert(ITComp!=null, 'ITComp is null');
            KNDY4__Inventory_Transaction__c ITWIP = ITMap.get('Work Order Issue From WIP');
            system.assert(ITWIP!=null, 'ITWIP is null');
            if (ITComp.KNDY4__Item__r.Inspection_Required__c) {//RW.item!=null && RW.item.Inspection_Required__c
                system.debug(LoggingLevel.ERROR, 'Before Insepction Required');

                //ItemsForInspection.add(RW.item.Id);
                //system.assert(false, 'assertion herer.');
                Sobject CQMaterialTransactionSObj = KCQUtilObj.getCQMaterialTransactionInstance();
                // each purchae orderline can have mulitple skids. What skid should be considered.
                //String LotNumber =[Select id,name from Lot__c where Id= : RW.skidList[0].Lot__c].Name;// 'LOT-11';//
                //system.assert(false, RW.serialWrapperList[0].skid.Lot_Number__c);
                String LotNumber = ITWIP.KNDY4__Lot__r.name;
                LotNumbers.add(LotNumber);

                CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Lot_Number__c, LotNumber);
                CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__SQX_Part_Number__c, ITWIP.KNDY4__Item__r.CQ_Part__c);//KNDY4__Item__r.CQ_Part__c//'a1P1I000000desi'
                CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Part_Rev__c, 'a1P1I000000desi');
                CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__SQX_Part_Number__c, ITComp.KNDY4__Item__r.CQ_Part__c);//KNDY4__Item__r.CQ_Part__c//'a1P1I000000desi'
                CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Part_Number__c, 'Part Number');//KNDY4__Item__r.CQ_Part__c//'a1P1I000000desi'
                CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Transaction_Code__c, CQMT_TRANSCODE_INCOMERECEIPT);
                CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Status__c, CQMT_STATUS_PENDING);
                CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__PO_WO_Number__c, ITWIP.KNDY4__Work_Order__r.name);
                //CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Line_Number__c,RW.pol.get(Schema.Purchase_Order_Line__c.Name));
                //CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__SQX_Receipt_Number__c,'Sample Rcpt Number');
                //CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Supplier__c,ITComp.KNDY4__Item__r.Supplier__r.Address__c);
                CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Quantity__c,ITWIP.KNDY4__Quantity__c);
                CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Inspection_Required__c, true);
                //system.assert(false, '');
                //CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__External_Reference__c,RW.rl.Name);
                CQMaterialTransactionSObjList.add(CQMaterialTransactionSObj);

            }

            Insert (List<compliancequest__SQX_Material_Transaction__c>)CQMaterialTransactionSObjList;

            for(List<KNDY4__Lot__c> lotList: [Select id,name from KNDY4__Lot__c where  Name in:LotNumbers ]){
                for(KNDY4__Lot__c lot:lotList){
                    lot.KNDY4__Lot_Hold__c = true;
                }
                update lotList;
            }

        }

    }
}
