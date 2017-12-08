public with sharing class InventoryTransactionTgrHandler {

    public static boolean executed=false;

    public static void mapInventoryTransacations(List<KNDY4__Inventory_Transaction__c> newList, List<KNDY4__Inventory_Transaction__c> oldList){
        set<String> ITTypes = new Set<String>{
                'Work Order Assembly Completion',
                'Work Order Issue From WIP',
                'Work Order Component Issue',
                'Purchase Order Receipt' };
        List<KNDY4__Inventory_Transaction__c> InspectionITs = new List<KNDY4__Inventory_Transaction__c>();
        Map<Id, List<AggregateResult>> AggResultListById = new Map<Id, List<AggregateResult>>();
        Map<Id,KNDY4__Inventory_Transaction__c> newMap = new  Map<Id,KNDY4__Inventory_Transaction__c>(newList);
        for(Id InvTransId: newMap.keyset()){
            KCQUtils1 KCQUtilObj = new KCQUtils1();
            Sobject CQMaterialTransactionSObj = KCQUtilObj.getCQMaterialTransactionInstance();
            KNDY4__Inventory_Transaction__c ITRecord = newMap.get(InvTransId);
            if(ITTypes.contains(ITRecord.KNDY4__Type__c)){
                InspectionITs.add(ITRecord);
            }

        }

        if(InspectionITs.size()>0) {
            queryInvTransaction(InspectionITs, AggResultListById);
            mapMaterialTransaction(AggResultListById);
        }
    }

    public static void queryInvTransaction(List<KNDY4__Inventory_Transaction__c> InspectionITs, Map<Id, List<AggregateResult>> AggResultListById){
        system.debug(LoggingLevel.ERROR, '1.Before:'+ JSON.serialize(InspectionITs));
        set<Id> workOrderIds = new set<Id>();
        set<Id> ReceiptLineIds = new set<Id>();
        for(KNDY4__Inventory_Transaction__c ITRecord: InspectionITs){
            if(ITRecord.KNDY4__Work_Order__c!=null){
                workOrderIds.add(ITRecord.KNDY4__Work_Order__c);
            }
            else if(ITRecord.KNDY4__Receipt_Line__c!=null){
                ReceiptLineIds.add(ITRecord.KNDY4__Receipt_Line__c);
            }
        }
        List<string> ITTypes = new List<string>{ 'Work Order Issue From WIP',
                                                 'Work Order Assembly Completion'
        };

        String AggregateQuery = ' select SUM(KNDY4__Quantity__c) qty,KNDY4__Lot__r.name LotNumber,KNDY4__Work_Order__c woId,KNDY4__Work_Order__r.name woNumber, '+
                ' KNDY4__Type__c ITType,KNDY4__Receipt_Line__r.name rcptNum,KNDY4__Receipt_Line__c rcptLineId,KNDY4__Receipt_Line__r.KNDY4__Purchase_Order__r.name PONumber,KNDY4__Receipt_Line__r.KNDY4__Purchase_Order_Line__r.name poline, KNDY4__Item__r.kcq1__CQ_Part__c CQPart, ' +
                ' KNDY4__Item__r.kcq1__Inspection_Required__c inspectionReq, KNDY4__Item__r.KNDY4__Supplier__r.KNDY4__Address__c supplier ' +
                ' from KNDY4__Inventory_Transaction__c where (KNDY4__Work_Order__c IN :workOrderIds or KNDY4__Receipt_Line__c IN:ReceiptLineIds ) AND  KNDY4__Item__r.kcq1__Inspection_Required__c=true '+
                '  group by KNDY4__Work_Order__c,KNDY4__Type__c,KNDY4__Receipt_Line__r.name ,KNDY4__Receipt_Line__c,KNDY4__Receipt_Line__r.KNDY4__Purchase_Order__r.name, '+
                ' KNDY4__Item__r.kcq1__CQ_Part__c,KNDY4__Work_Order__r.name,KNDY4__Lot__r.name,KNDY4__Item__r.kcq1__Inspection_Required__c,'+
                ' KNDY4__Item__r.KNDY4__Supplier__r.KNDY4__Address__c, KNDY4__Receipt_Line__r.KNDY4__Purchase_Order_Line__r.name ';



                List<AggregateResult> InvTransAggResult = (List<AggregateResult>) database.query(AggregateQuery);
        System.debug(LoggingLevel.ERROR, '2: Query'+JSON.serialize(InvTransAggResult));

        for(AggregateResult ar : InvTransAggResult){
            Id woPoId = ar.get('woId')!=null?(Id)ar.get('woId'):(Id)ar.get('rcptLineId');
            if(String.isEmpty(woPoId)){
                continue;
            }
            if( !AggResultListById.containsKey(woPoId)) {
                //List<AggregateResult> aggResult =  ;
                AggResultListById.put(woPoId,new List<AggregateResult>{ar});
            }
            else{
                List<AggregateResult> exAggResult = AggResultListById.get(woPoId);
                exAggResult.add(ar);
                AggResultListById.put(woPoId,exAggResult);
            }


        }
        System.debug(LoggingLevel.ERROR,'3 :AggResultListById:'+JSON.serialize(AggResultListById));

    }
    private static void mapMaterialTransaction(Map<Id,  List<AggregateResult>> AggResultListById)
    {
        final String CQMT_TRANSCODE_INCOMERECEIPT = 'INCOMING_RECEIPT';
        final String CQMT_STATUS_PENDING = 'Pending';

        KCQUtils1 KCQUtilObj = new KCQUtils1();
        List<Sobject> CQMaterialTransactionSObjList = new List<Sobject>();
        List<String> LotNumbers = new List<String>();

        String ReceiptLineObj =  'KNDY4__Receipt_Line__c';
        String WorkOrderObj  = 'KNDY4__Work_Order__c';
        String[] inspectionObjects = new String[]{ReceiptLineObj,WorkOrderObj};
        Map<String,String> ObjectByKeyPrefix = getObjectByKeyPrefix(inspectionObjects);

        for(Id woPoId:AggResultListById.keyset() )
        {
            List<AggregateResult> AggResList = AggResultListById.get(woPoId);
            Sobject CQMaterialTransactionSObj = getCQMaterialTransactionSobject();

            String WorkOrderPrefix = ObjectByKeyPrefix.get(WorkOrderObj);
            String purchaseOrderPrefix = ObjectByKeyPrefix.get(ReceiptLineObj);
            AggregateResult ar;
            String woPoIdStr = (String)woPoId;
            if (woPoIdStr.startsWith(WorkOrderPrefix))
            {
                Map<String, AggregateResult> AggResultByWoType = getAggResultByWOType(AggResList);
                ar = AggResultByWoType.get('Work Order Assembly Completion');
            }
            else if(woPoIdStr.startsWith(purchaseOrderPrefix))
            {
                ar = AggResList[0];
            }

            System.debug(LoggingLevel.ERROR,'3.1 Ar'+JSON.serialize(ar));


            String POWONumber = (ar.get('woNumber') != null) ? (String) ar.get('woNumber') : (String)ar.get('PONumber');
            CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__PO_WO_Number__c, POWONumber);
            Id partReference = ar.get('CQPart') != null ? (Id) ar.get('CQPart') : null;
            CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__SQX_Part_Number__c, partReference);//KNDY4__Item__r.KCQ_Part__c//'a1P1I000000desi'
            Decimal quantity = ar.get('qty')!=null?(Decimal) ar.get('qty'):-1;
            CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Quantity__c, quantity);
            String LotNumber = ar.get('LotNumber') != null ? (String) ar.get('LotNumber') : 'No Lot Number';
            CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Lot_Number__c, LotNumber);
            LotNumbers.add(LotNumber);
            CQMaterialTransactionSObjList.add(CQMaterialTransactionSObj);
            Id SupplierAccountReference = (Id) ar.get('supplier');
            CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Supplier__c,SupplierAccountReference);
            String polineNumber = (String) ar.get('poline');
            CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Line_Number__c,polineNumber);
            String ExtReference  = (String)ar.get('rcptNum');
            CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__External_Reference__c,polineNumber);
            //Todo receipt Number is lookup in CQ. Confirmation required.
            //CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__SQX_Receipt_Number__c,'Sample Rcpt Number');
            System.debug(LoggingLevel.ERROR,'4.CQMaterialTransactionSObjList'+JSON.serialize(CQMaterialTransactionSObjList));

        }


            Insert (List<compliancequest__SQX_Material_Transaction__c>)CQMaterialTransactionSObjList;

            for(List<KNDY4__Lot__c> lotList: [Select id,name from KNDY4__Lot__c where  Name in:LotNumbers ]){
                for(KNDY4__Lot__c lot:lotList){
                    lot.KNDY4__Lot_Hold__c = true;
                }
                update lotList;
            }

    }
    public static SObject getCQMaterialTransactionSobject(){
        final String CQMT_TRANSCODE_INCOMERECEIPT = 'INCOMING_RECEIPT';
        final String CQMT_STATUS_PENDING = 'Pending';
        KCQUtils1 KCQUtilObj = new KCQUtils1();
        Sobject CQMaterialTransactionSObj = KCQUtilObj.getCQMaterialTransactionInstance();
        //CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__SQX_Part_Number__c, ITWIP.KNDY4__Item__r.KCQ_Part__c);//KNDY4__Item__r.KCQ_Part__c//'a1P1I000000desi'
        CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Part_Rev__c, 'a1P1I000000desi');
        CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Part_Number__c, 'Part Number');//KNDY4__Item__r.KCQ_Part__c//'a1P1I000000desi'
        CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Transaction_Code__c, CQMT_TRANSCODE_INCOMERECEIPT);
        CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Status__c, CQMT_STATUS_PENDING);
        CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Inspection_Required__c, true);
        System.debug(LoggingLevel.ERROR,'5. CQMaterialTransactionSObj'+JSON.serialize(CQMaterialTransactionSObj));
        return CQMaterialTransactionSObj;
    }
    public static  Map<String,AggregateResult> getAggResultByWOType(List<AggregateResult> AggregateResult){
        Map<String,AggregateResult> AggResultByWOType = new Map<String,AggregateResult>();
        for(AggregateResult ar:AggregateResult){
            AggResultByWOType.put((String)ar.get('ITType'),ar);


        }
        System.debug(LoggingLevel.ERROR,'6 . AggResultByWOType'+JSON.serialize(AggResultByWOType));

        return AggResultByWOType;

    }
    public static Map<String,String> getObjectbyKeyPrefix(String[] inspectionObjects){
        String[] types = inspectionObjects;
        Schema.DescribeSobjectResult[] results = Schema.describeSObjects(types);
        Map<String,String> ObjectByKeyPrefix = new Map<String,String>{results[0].getName()=>results[0].getKeyPrefix(),results[1].getName()=>results[1].getKeyPrefix()};
        System.debug(LoggingLevel.ERROR,'7. ObjectByKeyPrefix'+JSON.serialize(ObjectByKeyPrefix));
        return ObjectByKeyPrefix;

    }

}
