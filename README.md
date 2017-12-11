Kenandy - Compliance Quest (Installation):

Purpose: 

This document describes the installation steps for kenandy extension package  KCQ. KCQ acts a liaison between Kenandy  and  Compliance Quest  to inspect inventory manufactured or received through Kenandy work orders and purchase order receipts. 
Package Installation:
Package URL :
  https://login.salesforce.com/packaging/installPackage.apexp?p0=04t1I000003cCe9


Fixes in release:

Adding CQ Part custom field to item header fieldset.
            Resolution: Add custom field with API KCQ Part to the fieldset.
Hold the lot in inspection fails for an item.
Added Lot Hold Reason values
Fixed the issue with transaction status for Inspection fail and other transaction codes.
Package Pwd:
       kndycq1
Dependent packages :
CQ , KNDY in the same order.

Permission sets:

CQ Admin Extended Permission
Compliance Quest
Access to CQ functionality.
CQ Admin User
Compliance Quest
Access to CQ Functionality
Kenandy Salesforce Permissions(depends on implementation)
Kenandy
Access to purchase orders and work orders
Kenandy Compliance Quest Permissions
KCQ Integration
Access to functionality that  creates CQ Material Transactions

Custom Fields: 

Object Name
Field Name
Description
KNDY4__Item__c
CQ Part (API name kcq1__KCQ_Part__c)
Associate CQ Part with KNDY Item
KNDY4__Item__c
Inspection Required
Use this flag to have this item inspected.

Post Installation Configuration:


Compliance Quest: Please follow the post installation configuration steps for CQ
KNDY : Please follow the post installation configuration steps for KNDY.



KCQ:
      
Assign the permission set KCQ permissions to the user record.
Assign the necessary permission required for CQ and KNDY 
Add the fields CQ Part and Inspection required to the Item header fieldset. 
Add the Inspection Required flag from Item onto the Receiving RO Fieldset on purchase order line.
Add the Transaction Codes USE_AS_IS,RTV and SCRAP to MT Transaction Code field.
Add the Transaction Codes 'INSPECTION_PASS', 'INSPECTION_FAIL','SCRAP','RTV','USE_AS_IS' to 
            Lot Hold Reason on Lot Object.

Scheduling the Kenandy Batch Job:
Go to the company record and then to the list of batch jobs
Create a new batch job with CQ Kenandy Material Batch, class name “CQMaterialTransactionMonitorBatch” and namespace “kcq1”.
Note: While creating the process job records copy paste the whole name including the namespace.

Licenses: Assign the licenses for the KNDY and CQ packages.

Material Transaction Transaction Codes:
INSPECTION_PASS: set MT Status to Complete and Lot hold to false
INSPECTION_FAIL: set MT Status to Complete and Leave Lot Hold to True.
USE_AS_IS : set MT Status to Complete and Set Lot hold to false.
RTV and SCRAP: set MT Status to Complete and Leave the lot hold to true.


Purchase Order Receiving: On receipt of material through a PO, the LOT for the LOT tracked item, having the inspection required checkbox checked, gets put on hold.


Work Order Completion: On completion of goods through a WO, the LOT for the LOT tracked item, having the inspection required checkbox checked, gets put on hold.
