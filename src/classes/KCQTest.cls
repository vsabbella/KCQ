/**
 * Created by venkatasabbella on 11/29/17.
 */

@isTest(seealldata=false)
public with sharing class KCQTest {


    private static testMethod void testInventoryTransactionTrigger2(){
        createPOITs();
    }

    private static void createPOITs(){
        TestFuel data = new TestFuel();
        KNDY4__Inventory_Transaction__c it = new KNDY4__Inventory_Transaction__c();

        // PO and Po Line
        KNDY4__Purchase_Order__c po = data.purchaseOrder;
        KNDY4__Purchase_Order_Line__c poLine = data.purchaseOrderLines[0];

        //Item and SKID
        KNDY4__Item__c Item = data.itemList[2];
        KNDY4__SKID__c Skid = data.skids[2];

        KNDY4__Receiving_Document__c receivingDocument1 = new KNDY4__Receiving_Document__c();
        receivingDocument1 = new KNDY4__Receiving_Document__c();
        receivingDocument1.KNDY4__Company__c = data.company.Id;
        receivingDocument1.KNDY4__Supplier__c = poLine.KNDY4__Supplier__c;
        receivingDocument1.KNDY4__Status__c = 'Open';
        receivingDocument1.KNDY4__Date_Created__c = system.today();
        receivingDocument1.KNDY4__Type__c = 'Purchase Order Receipt';
        insert receivingDocument1;

        KNDY4__Receipt_Line__c receiptLine1 = new KNDY4__Receipt_Line__c();
        receiptLine1.KNDY4__Purchase_Order__c = data.purchaseOrder.Id;
        receiptLine1.KNDY4__Purchase_Order_Line__c = data.purchaseOrderLines[0].id;
        receiptLine1.KNDY4__Item__c = item.Id;
        receiptLine1.KNDY4__Company__c =data.company.Id;
        receiptLine1.KNDY4__Supplier__c = poLine.KNDY4__Supplier__c;
        receiptLine1.KNDY4__Quantity_Received__c = 4;
        receiptLine1.KNDY4__Uninvoiced_Quantity__c = 4;
        receiptLine1.KNDY4__Facility__c = poLine.KNDY4__Delivery_Facility__c;
        receiptLine1.KNDY4__Location__c = poLine.KNDY4__Delivery_Location__c;
        receiptLine1.KNDY4__Receiving_Document__c = receivingDocument1.Id;
        insert receiptLine1;

        compliancequest__SQX_Part_Family__c pfam = new compliancequest__SQX_Part_Family__c(name = 'familiyt');
        insert pfam;

        compliancequest__SQX_Part__c part = new compliancequest__SQX_Part__c(compliancequest__Active__c= true,
                compliancequest__Part_Description__c= 'desc',
                compliancequest__Part_Family__c= pfam.id,
                compliancequest__Part_Number__c= '1',
                compliancequest__Part_Risk_Level__c=1,
                compliancequest__Part_Type__c= 'Assembly'
        );
        insert part;

        Item.CQ_Part__c = part.Id;
        Item.Inspection_Required__c = true;
        update Item;



        Sobject sourceDocument = (Sobject)poLine;
        Id sourceDocId = sourceDocument.Id;
        String sourceDocField = sourceDocId.getSObjectType().getDescribe().getLocalName();

        system.debug(LoggingLevel.ERROR,JSON.serialize(data.itemList));

        it.put(sourceDocField,sourceDocId);

        it.KNDY4__Company__c = data.company.Id;
        it.KNDY4__Type__c = 'Purchase Order Receipt';
        it.KNDY4__Transaction_Date__c = System.now();
        it.KNDY4__Finalized__c = true;
        it.KNDY4__Quantity__c = 10;

        Item.KNDY4__Stocking_UOM__c = Item.KNDY4__Stocking_UOM__c;

        KNDY4__Bin__c bin = data.bin;

        it.KNDY4__From_SKID__c = Skid.id;
        it.KNDY4__From_SKID__r = Skid;
        it.KNDY4__From_Bin__c = bin.id;
        //it.KNDY4__From_Lot__c = fromSkid.KNDY4__Lot__c;
        it.KNDY4__From_Location__c = poLine.KNDY4__Delivery_Location__c;
        it.KNDY4__From_Facility__c = poLine.KNDY4__Delivery_Facility__c;
        //it.KNDY4__From_Facility__r = fromSkid.KNDY4__Facility2__r;
        it.KNDY4__From_Packaging_UOM__c = poline.KNDY4__Packaging_UOM__c;
        it.KNDY4__Quantity_Stocking_UOM__c = 100;
        it.KNDY4__Packaging_UOM__c = poline.KNDY4__Packaging_UOM__c;
        it.KNDY4__Work_Order__c= null;
        it.KNDY4__Lot__c = null;
        it.KNDY4__Receipt_Line__c= receiptLine1.Id;
        it.KNDY4__Receipt_Line__r= receiptLine1;
        it.KNDY4__Item__c = Item.Id;
        it.KNDY4__Item__r= Item;
        it.KNDY4__Quantity__c = 10;

        Insert It;

        IT = [select id,name from KNDY4__Inventory_Transaction__c limit 1];
        system.assert(IT!=null);

        List<compliancequest__SQX_Material_Transaction__c> matTrnas = [select id,name from compliancequest__SQX_Material_Transaction__c];
        system.assert(matTrnas.size()>0);








    }

    private static testMethod void testWorkOrders(){
        TestFuel f = new TestFuel();
        System.assert(f.assembly2 != null && f.workOrder != null && f.phantomWorkOrder != null);
        System.assert(f.smrsList != null && f.stockMovementRuleList != null && f.periodList != null);
        system.assert(f.remitToSupplier !=null && f.supplier !=null && f.wcResources !=null);
        f.facility2.KNDY4__Default_Purchasing_Delivery_Location__c = f.location2.Id;
        update f.facility2;

        KNDY4__Inventory_Transaction__c it = new KNDY4__Inventory_Transaction__c();

        TestFuel data =f;

        //Item and SKID
        KNDY4__Item__c Item = data.itemList[5];
        KNDY4__SKID__c Skid = data.skids[5];

        //compliancequest__SQX_Part_Family__c pfam1 = [ select id,name from compliancequest__SQX_Part_Family__c limit 1];
        //compliancequest__SQX_Part_Family__c pfam = new compliancequest__SQX_Part_Family__c(name = 'familiyt-wo');
        //insert pfam;

        /*compliancequest__SQX_Part__c part = new compliancequest__SQX_Part__c(compliancequest__Active__c= true,
                compliancequest__Part_Description__c= 'desc',
                compliancequest__Part_Family__c= pfam.id,
                compliancequest__Part_Number__c= 'WOpart1',
                compliancequest__Part_Risk_Level__c=1,
                compliancequest__Part_Type__c= 'Assembly'
        );
        insert part;*/

        //Item.CQ_Part__c = part.Id;
        Item.Inspection_Required__c = true;
        update Item;

        Sobject sourceDocument = (Sobject) f.workOrder;
        Id sourceDocId = sourceDocument.Id;
        String sourceDocField = sourceDocId.getSObjectType().getDescribe().getLocalName();

        system.debug(LoggingLevel.ERROR,JSON.serialize(data.itemList));

        it.put(sourceDocField,sourceDocId);

        it.KNDY4__Company__c = data.company.Id;
        it.KNDY4__Type__c = 'Work Order Assembly Completion';
        it.KNDY4__Transaction_Date__c = System.now();
        it.KNDY4__Finalized__c = true;
        it.KNDY4__Quantity__c = 10;

        Item.KNDY4__Stocking_UOM__c = Item.KNDY4__Stocking_UOM__c;

        KNDY4__Bin__c bin = data.bin;

        it.KNDY4__From_SKID__c = Skid.id;
        it.KNDY4__From_SKID__r = Skid;
        it.KNDY4__From_Bin__c = bin.id;
        //it.KNDY4__From_Lot__c = fromSkid.KNDY4__Lot__c;
        it.KNDY4__From_Location__c = f.workOrder.KNDY4__Complete_To_Location__c;
        it.KNDY4__From_Facility__c = f.workOrder.KNDY4__Facility__c;
        //it.KNDY4__From_Facility__r = fromSkid.KNDY4__Facility2__r;
        it.KNDY4__From_Packaging_UOM__c = f.workOrder.KNDY4__Packaging_UOM__c;
        it.KNDY4__Quantity_Stocking_UOM__c = 100;
        it.KNDY4__Packaging_UOM__c = f.workOrder.KNDY4__Packaging_UOM__c;
        it.KNDY4__Work_Order__c= f.workOrder.Id;
        it.KNDY4__Lot__c = null;
        it.KNDY4__Item__c = Item.Id;
        it.KNDY4__Item__r= Item;
        it.KNDY4__Quantity__c = 10;

        Insert It;

        KNDY4__Inventory_Transaction__c it1 = new KNDY4__Inventory_Transaction__c();
        it1 = it.clone(false,true, false,false);

        KNDY4__Inventory_Transaction__c it2 = new KNDY4__Inventory_Transaction__c();
        it2 = it.clone(false,true, false,false);
        it2.KNDY4__Type__c = 'Work Order Issue From WIP';
        insert it2;

        KNDY4__Inventory_Transaction__c it3 = new KNDY4__Inventory_Transaction__c();
        it3 = it.clone(false,true, false,false);
        it3.KNDY4__Type__c = 'Work Order Component Issue';
        insert it3;



        IT = [select id,name from KNDY4__Inventory_Transaction__c limit 1];
        system.assert(IT!=null);

        List<compliancequest__SQX_Material_Transaction__c> matTrnas = [select id,name from compliancequest__SQX_Material_Transaction__c];
        system.assert(matTrnas.size()>0);

    }

    private static testMethod void testMaterialTransactionBatch(){
        createCQData();
        List<compliancequest__SQX_Material_Transaction__c> mtList = [select Id,compliancequest__Transaction_Code__c, compliancequest__Status__c, compliancequest__PO_WO_Number__c, compliancequest__SQX_Part_Number__c, compliancequest__Lot_Number__c, compliancequest__Quantity__c, compliancequest__Inspection_Required__c
        from compliancequest__SQX_Material_Transaction__c
        where compliancequest__Status__c ='Pending'
        ];

        system.debug(LoggingLevel.ERROR, '-->'+JSON.serialize(mtlist));

        system.assert(mtList.size()>0);

        Test.startTest();
        Database.executeBatch(new CQMaterialTransactionMonitorBatch(), 10);
        Test.stopTest();

        List<compliancequest__SQX_Material_Transaction__c> mtList_complete = [ select Id,compliancequest__Transaction_Code__c, compliancequest__Status__c, compliancequest__PO_WO_Number__c, compliancequest__SQX_Part_Number__c, compliancequest__Lot_Number__c, compliancequest__Quantity__c, compliancequest__Inspection_Required__c
        from compliancequest__SQX_Material_Transaction__c where compliancequest__Status__c ='Complete'];

        //system.assert(mtList_complete.size()>0);

    }

    private static void createCQData(){
        compliancequest__SQX_Part_Family__c pfam = new compliancequest__SQX_Part_Family__c(name = 'familiyt-wo');
        insert pfam;

        compliancequest__SQX_Part__c part = new compliancequest__SQX_Part__c(compliancequest__Active__c= true,
                compliancequest__Part_Description__c= 'desc',
                compliancequest__Part_Family__c= pfam.id,
                compliancequest__Part_Number__c= 'WOpart1',
                compliancequest__Part_Risk_Level__c=1,
                compliancequest__Part_Type__c= 'Assembly'
        );
        insert part;

        Sobject CQMaterialTransactionSObj = InventoryTransactionTgrHandler.getCQMaterialTransactionSobject();
        String POWONumber = 'POWONumber';


        CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__PO_WO_Number__c, POWONumber);
        CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__SQX_Part_Number__c, part.Id);//KNDY4__Item__r.CQ_Part__c//'a1P1I000000desi'
        CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__SQX_Part_Number__c, part.Id);//KNDY4__Item__r.CQ_Part__c//'a1P1I000000desi'

        CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Transaction_Code__c, 'INSPECTION_PASS');

        Integer quantity = 10;
        CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Quantity__c, quantity);

        String LotNumber =  'No Lot Number';

        CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Lot_Number__c, LotNumber);


        //Id SupplierAccountReference = (Id) ar.get('supplier');
        // CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Supplier__c,SupplierAccountReference);
        String polineNumber ='poline';

        CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__Line_Number__c,polineNumber);
        String ExtReference  = polineNumber;
        CQMaterialTransactionSObj.put(Schema.compliancequest__SQX_Material_Transaction__c.compliancequest__External_Reference__c,polineNumber);

        insert CQMaterialTransactionSObj;

        insert CQMaterialTransactionSObj.clone(false,true,false,false);
        insert CQMaterialTransactionSObj.clone(false,true,false,false);

        insert CQMaterialTransactionSObj.clone(false,true,false,false);

        insert CQMaterialTransactionSObj.clone(false,true,false,false);

        compliancequest__SQX_Material_Transaction__c mt = [select id,name from compliancequest__SQX_Material_Transaction__c limit 1 ];

        system.assert(mt.Id!=null);

    }


}