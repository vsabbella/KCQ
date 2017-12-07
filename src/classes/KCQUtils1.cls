/**
 * Created by venkatasabbella on 11/2/17.
 */

public with sharing class KCQUtils1 {
    public final String CQ_MATERIALTRANSACTION = 'compliancequest__SQX_Material_Transaction__c';
    private Map<String, Schema.SObjectType> globalDescribe{
        get{
            if(globalDescribe==null)  globalDescribe = Schema.getGlobalDescribe();
            return globalDescribe;
        }
        private set;
    }

    public SObject getCQMaterialTransactionInstance(){ 
        return globalDescribe.get(CQ_MATERIALTRANSACTION).newSObject();
    }

}