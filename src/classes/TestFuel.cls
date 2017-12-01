@isTest
public class TestFuel {
    public class MyException extends Exception {}

    public Map<String,String> CustomerRecordTypes = KSE.RecordTypeDevNameMap('KNDY4__Customer__c');
    public map <string,string> SupplierRecordTypes = KSE.RecordTypeDevNameMap('KNDY4__Supplier__c');

    public Account account {
        get {
            if (account == null) {
                account = new Account();
                //account.name = 'KenandyTestFuel'+ '-' + String.ValueOf(Math.round(Math.random(), 2));
                account.name = 'KenandyTestFuel' + '-Account #1';
                account.billingstreet = '303 Twin Dolphin Drive, Suite 500';
                account.billingcity = 'Redwood City';
                account.billingstate = 'CA';
                account.billingpostalcode = '94065';
                account.billingcountry = 'USA';
                account.shippingstreet = '303 Twin Dolphin Drive, Suite 500';
                account.shippingcity = 'Redwood City';
                account.shippingstate = 'CA';
                account.shippingpostalcode = '94065';
                account.shippingcountry = 'USA';
                account.phone = '650-468-20001';
                account.fax = '650-468-2010';
                account.website = 'kenandyTest.com';
                insert account;
            }
            return account;
        }
        set;
    }

    public KNDY4__Accounting_Standard__c accountingStandard{
        get{
            if(accountingStandard == null){
                accountingStandard = new KNDY4__Accounting_Standard__c();
                accountingStandard.name = 'US GAAP';
                insert accountingStandard;
            }
            return accountingStandard;
        }
        set;
    }

    public static KNDY4__Currency__c currencyUSD{
        get {
            if(currencyUSD== null){
                currencyUSD = new KNDY4__Currency__c();
                currencyUSD.name = 'USD TestFuel';
                //currencyUSD.KNDY4__Active__c = TRUE;
                currencyUSD.KNDY4__ISO_Code__c = 'USD';
                currencyUSD.KNDY4__Currency__c = 'USD Currency';
                insert currencyUSD;
            }
            return currencyUSD;
        }

        set;
    }

    public static KNDY4__Currency__c currencyGBP {
        get {
            if(currencyGBP == null){
                currencyGBP = new KNDY4__Currency__c();
                currencyGBP.name = 'GBP TestFuel';
                //currencyUSD.KNDY4__Active__c = TRUE;
                currencyGBP.KNDY4__ISO_Code__c = 'GBP';
                currencyGBP.KNDY4__Currency__c = 'British Pound';
                insert currencyGBP;
            }
            return currencyGBP;
        }

        set;
    }

    public static KNDY4__Currency__c currencyEUR {
        get {
            if(currencyEUR == null){
                currencyEUR = new KNDY4__Currency__c();
                currencyEUR.name = 'EUR TestFuel';
                //currencyUSD.KNDY4__Active__c = TRUE;
                currencyEUR.KNDY4__ISO_Code__c = 'EUR';
                currencyEUR.KNDY4__Currency__c = 'EURO Currency';
                insert currencyEUR;
            }
            return currencyEUR;
        }

        set;
    }

    public static KNDY4__Currency__c currencySGD {
        get {
            if(currencySGD == null){
                currencySGD = new KNDY4__Currency__c();
                currencySGD.name = 'SGD TestFuel';
                //currencyUSD.KNDY4__Active__c = TRUE;
                currencySGD.KNDY4__ISO_Code__c = 'SGD';
                currencySGD.KNDY4__Currency__c = 'SGD Currency';
                insert currencySGD;
            }
            return currencySGD;
        }

        set;
    }

    public static KNDY4__Currency__c currencyCAD {
        get {
            if(currencyCAD == null){
                currencyCAD = new KNDY4__Currency__c();
                currencyCAD.name = 'CAD TestFuel';
                //currencyUSD.KNDY4__Active__c = TRUE;
                currencyCAD.KNDY4__ISO_Code__c = 'CAD';
                currencyCAD.KNDY4__Currency__c = 'CAD Currency';
                insert currencyCAD;
            }
            return currencyCAD;
        }

        set;
    }

    public KNDY4__Company__c company {

        get {
            String AT_RECEIPT = 'At receipt and all processes';

            if (company == null) {
                company = new KNDY4__Company__c();
                company.name = 'Kenandy' + '-Main Company';
                company.KNDY4__accounting_standard__c = accountingStandard.Id;
                company.KNDY4__Address__c = account.ID;
                company.KNDY4__A_Days__c = 30;
                company.KNDY4__B_Days__c = 60;
                company.KNDY4__C_Days__c = 180;
                company.KNDY4__Company_Identifier__c = 'KEN' + '-mainCompany#1';
                company.KNDY4__Comp_Currency__c = TestFuel.currencyUSD.id;
                company.KNDY4__Consol_Currency__c = TestFuel.currencyUSD.id;
                company.KNDY4__Stat_Currency__c = TestFuel.currencyUSD.id;
                company.KNDY4__Subs_Currency__c = TestFuel.currencyUSD.id;
                company.KNDY4__Default_Transaction_Currency__c = TestFuel.currencyUSD.id;
                //company.KNDY4__Finalize_Supplier_Invoices_w_Exceptions__c = false; //KNDY-2817
                company.KNDY4__Serial_Control__c = AT_RECEIPT;
                system.assert(AutoBackdatingConfigVal != null);//Make the setting to default No as all existing tests are written based on that flow.
                insert company;
            }
            return company;
        }
        set;
    }

    public KNDY4__Configuration__c AutoBackdatingConfigVal {
        get {
            if(AutoBackdatingConfigVal==null){
                // Create Configuration
                AutoBackdatingConfigVal = new KNDY4__Configuration__c();
                AutoBackdatingConfigVal.name = 'AutoBackdateToOpenSubledgers';
                AutoBackdatingConfigVal.KNDY4__Value__c = 'No';
                insert AutoBackdatingConfigVal;
            }
            return AutoBackdatingConfigVal;
        }
        set;
    }
    public KNDY4__Company__c altCompany {
        get {
            if (altCompany == null) {
                altCompany = new KNDY4__Company__c();
                altCompany.name = 'AltKenandyTestFuel' + '-Alternate';
                altCompany.KNDY4__accounting_standard__c = accountingStandard.Id;
                altCompany.KNDY4__Address__c = account.ID;
                altCompany.KNDY4__A_Days__c = 30;
                altCompany.KNDY4__B_Days__c = 60;
                altCompany.KNDY4__C_Days__c = 180;
                altCompany.KNDY4__Company_Identifier__c = 'KEN' + '-AltCompany#2';
                altCompany.KNDY4__Comp_Currency__c = TestFuel.currencyUSD.id;
                altCompany.KNDY4__Consol_Currency__c = TestFuel.currencyEUR.id;
                altCompany.KNDY4__Stat_Currency__c = TestFuel.currencyGBP.id;
                altCompany.KNDY4__Subs_Currency__c = TestFuel.currencyUSD.id;
                altCompany.KNDY4__Default_Transaction_Currency__c = TestFuel.currencyUSD.id;
                //company.KNDY4__Finalize_Supplier_Invoices_w_Exceptions__c = false; //KNDY-2817
                system.assert(AutoBackdatingConfigVal != null);//Make the setting to default No as all existing tests are written based on that flow.
                insert altCompany;
            }
            return altCompany;
        }
        set;
    }

    public List<KNDY4__Accounting_Rule__c> invoiceRuleList{
        get{
            if(invoiceRuleList == null){
                invoiceRuleList = new List<KNDY4__Accounting_Rule__c>();

                KNDY4__Accounting_Rule__c intercoInvestment1 = new KNDY4__Accounting_Rule__c();
                intercoInvestment1.KNDY4__Object_Name__c = 'KNDY4__Invoice__c';
                //intercoInvestment1.KNDY4__Company__c = company.id;
                intercoInvestment1.KNDY4__Transaction__c = 'Intercompany Investment';
                intercoInvestment1.KNDY4__Role__c = 'Investor';
                intercoInvestment1.KNDY4__SubTransaction_Type__c = null;
                intercoInvestment1.KNDY4__Line_Type__c = null;
                intercoInvestment1.KNDY4__Rule_Type__c = 'CR';
                intercoInvestment1.KNDY4__Default_GL_Account__c = true;
                intercoInvestment1.KNDY4__GL_Account_Reference_Value__c = null;
                intercoInvestment1.KNDY4__GL_Account__c = intercompanyAPGL.id;
                intercoInvestment1.KNDY4__Amount_Reference__c = null;
                intercoInvestment1.KNDY4__Company_Ledger__c = true;
                intercoInvestment1.KNDY4__Intercompany_Reference_Value__c = 'KNDY4__Invoice__r.KNDY4__From_Company__c';
                invoiceRuleList.add(intercoInvestment1);

                KNDY4__Accounting_Rule__c intercoInvestment2 = new KNDY4__Accounting_Rule__c();
                intercoInvestment2.KNDY4__Object_Name__c = 'KNDY4__Invoice__c';
                //intercoInvestment2.KNDY4__Company__c = company.id;
                intercoInvestment2.KNDY4__Transaction__c = 'Intercompany Investment';
                intercoInvestment2.KNDY4__Role__c = 'Investor';
                intercoInvestment2.KNDY4__SubTransaction_Type__c = null;
                intercoInvestment2.KNDY4__Line_Type__c = null;
                intercoInvestment2.KNDY4__Rule_Type__c = 'DR';
                intercoInvestment2.KNDY4__Default_GL_Account__c = true;
                intercoInvestment2.KNDY4__GL_Account_Reference_Value__c = null;
                intercoInvestment2.KNDY4__GL_Account__c = intercompanyInvestmentGL.id;
                intercoInvestment2.KNDY4__Amount_Reference__c = null;
                intercoInvestment2.KNDY4__Company_Ledger__c = true;
                intercoInvestment2.KNDY4__Intercompany_Reference_Value__c = 'KNDY4__Invoice__r.KNDY4__From_Company__c';
                invoiceRuleList.add(intercoInvestment2);
				/*
                KNDY4__Accounting_Rule__c intercoInvestment3 = new KNDY4__Accounting_Rule__c();
                intercoInvestment3.KNDY4__Object_Name__c = 'KNDY4__Invoice__c';
	            //intercoInvestment3.KNDY4__Company__c = altCompany.id;
                intercoInvestment3.KNDY4__Transaction__c = 'Intercompany Investment';
                intercoInvestment3.KNDY4__Role__c = 'Investor';
                intercoInvestment3.KNDY4__SubTransaction_Type__c = null;
                intercoInvestment3.KNDY4__Line_Type__c = null;
                intercoInvestment3.KNDY4__Rule_Type__c = 'CR';
                intercoInvestment3.KNDY4__Default_GL_Account__c = true;
                intercoInvestment3.KNDY4__GL_Account_Reference_Value__c = null;
                intercoInvestment3.KNDY4__GL_Account__c = intercompanyInvestmentGL.id;
                intercoInvestment3.KNDY4__Amount_Reference__c = null;
                intercoInvestment3.KNDY4__Company_Ledger__c = true;
                intercoInvestment3.KNDY4__Intercompany_Reference_Value__c = 'KNDY4__Invoice__r.KNDY4__From_Company__c';
                invoiceRuleList.add(intercoInvestment3);

                KNDY4__Accounting_Rule__c intercoInvestment4 = new KNDY4__Accounting_Rule__c();
                intercoInvestment4.KNDY4__Object_Name__c = 'KNDY4__Invoice__c';
	            //intercoInvestment4.KNDY4__Company__c = altCompany.id;
                intercoInvestment4.KNDY4__Transaction__c = 'Intercompany Investment';
                intercoInvestment4.KNDY4__Role__c = 'Investor';
                intercoInvestment4.KNDY4__SubTransaction_Type__c = null;
                intercoInvestment4.KNDY4__Line_Type__c = null;
                intercoInvestment4.KNDY4__Rule_Type__c = 'DR';
                intercoInvestment4.KNDY4__Default_GL_Account__c = true;
                intercoInvestment4.KNDY4__GL_Account_Reference_Value__c = null;
                intercoInvestment4.KNDY4__GL_Account__c = intercompanyAPGL.id;
                intercoInvestment4.KNDY4__Amount_Reference__c = null;
                intercoInvestment4.KNDY4__Company_Ledger__c = true;
                intercoInvestment4.KNDY4__Intercompany_Reference_Value__c = 'KNDY4__Invoice__r.KNDY4__From_Company__c';
                invoiceRuleList.add(intercoInvestment4);
	            */
                KNDY4__Accounting_Rule__c intercoInvestment5 = new KNDY4__Accounting_Rule__c();
                intercoInvestment5.KNDY4__Object_Name__c = 'KNDY4__Invoice__c';
                //intercoInvestment5.KNDY4__Company__c = company.id;
                intercoInvestment5.KNDY4__Transaction__c = 'Intercompany Investment';
                intercoInvestment5.KNDY4__Role__c = 'Investee';
                intercoInvestment5.KNDY4__SubTransaction_Type__c = null;
                intercoInvestment5.KNDY4__Line_Type__c = null;
                intercoInvestment5.KNDY4__Rule_Type__c = 'CR';
                intercoInvestment5.KNDY4__Default_GL_Account__c = true;
                intercoInvestment5.KNDY4__GL_Account_Reference_Value__c = null;
                intercoInvestment5.KNDY4__GL_Account__c = intercompanyAPICGL.id;
                intercoInvestment5.KNDY4__Amount_Reference__c = null;
                intercoInvestment5.KNDY4__Company_Ledger__c = true;
                intercoInvestment5.KNDY4__Intercompany_Reference_Value__c = 'KNDY4__Invoice__r.KNDY4__To_Company__c';
                invoiceRuleList.add(intercoInvestment5);

                KNDY4__Accounting_Rule__c intercoInvestment6 = new KNDY4__Accounting_Rule__c();
                intercoInvestment6.KNDY4__Object_Name__c = 'KNDY4__Invoice__c';
                //intercoInvestment6.KNDY4__Company__c = company.id;
                intercoInvestment6.KNDY4__Transaction__c = 'Intercompany Investment';
                intercoInvestment6.KNDY4__Role__c = 'Investee';
                intercoInvestment6.KNDY4__SubTransaction_Type__c = null;
                intercoInvestment6.KNDY4__Line_Type__c = null;
                intercoInvestment6.KNDY4__Rule_Type__c = 'DR';
                intercoInvestment6.KNDY4__Default_GL_Account__c = true;
                intercoInvestment6.KNDY4__GL_Account_Reference_Value__c = null;
                intercoInvestment6.KNDY4__GL_Account__c = intercompanyARGL.id;
                intercoInvestment6.KNDY4__Amount_Reference__c = null;
                intercoInvestment6.KNDY4__Company_Ledger__c = true;
                intercoInvestment6.KNDY4__Intercompany_Reference_Value__c = 'KNDY4__Invoice__r.KNDY4__To_Company__c';
                invoiceRuleList.add(intercoInvestment6);
				/*
                KNDY4__Accounting_Rule__c intercoInvestment7 = new KNDY4__Accounting_Rule__c();
                intercoInvestment7.KNDY4__Object_Name__c = 'KNDY4__Invoice__c';
	            //intercoInvestment7.KNDY4__Company__c = altCompany.id;
                intercoInvestment7.KNDY4__Transaction__c = 'Intercompany Investment';
                intercoInvestment7.KNDY4__Role__c = 'Investee';
                intercoInvestment7.KNDY4__SubTransaction_Type__c = null;
                intercoInvestment7.KNDY4__Line_Type__c = null;
                intercoInvestment7.KNDY4__Rule_Type__c = 'CR';
                intercoInvestment7.KNDY4__Default_GL_Account__c = true;
                intercoInvestment7.KNDY4__GL_Account_Reference_Value__c = null;
                intercoInvestment7.KNDY4__GL_Account__c = intercompanyAPICGL.id;
                intercoInvestment7.KNDY4__Amount_Reference__c = null;
                intercoInvestment7.KNDY4__Company_Ledger__c = true;
                intercoInvestment7.KNDY4__Intercompany_Reference_Value__c = 'KNDY4__Invoice__r.KNDY4__To_Company__c';
                invoiceRuleList.add(intercoInvestment7);

                KNDY4__Accounting_Rule__c intercoInvestment8 = new KNDY4__Accounting_Rule__c();
                intercoInvestment8.KNDY4__Object_Name__c = 'KNDY4__Invoice__c';
	            //intercoInvestment8.KNDY4__Company__c = altCompany.id;
                intercoInvestment8.KNDY4__Transaction__c = 'Intercompany Investment';
                intercoInvestment8.KNDY4__Role__c = 'Investee';
                intercoInvestment8.KNDY4__SubTransaction_Type__c = null;
                intercoInvestment8.KNDY4__Line_Type__c = null;
                intercoInvestment8.KNDY4__Rule_Type__c = 'DR';
                intercoInvestment8.KNDY4__Default_GL_Account__c = true;
                intercoInvestment8.KNDY4__GL_Account_Reference_Value__c = null;
                intercoInvestment8.KNDY4__GL_Account__c = intercompanyARGL.id;
                intercoInvestment8.KNDY4__Amount_Reference__c = null;
                intercoInvestment8.KNDY4__Company_Ledger__c = true;
                intercoInvestment8.KNDY4__Intercompany_Reference_Value__c = 'KNDY4__Invoice__r.KNDY4__To_Company__c';
                invoiceRuleList.add(intercoInvestment8);
	            */
                KNDY4__Accounting_Rule__c intercoCrossCharge1 = new KNDY4__Accounting_Rule__c();
                intercoCrossCharge1.KNDY4__Object_Name__c = 'KNDY4__Invoice__c';
                //intercoCrossCharge1.KNDY4__Company__c = Company.id;
                intercoCrossCharge1.KNDY4__Transaction__c = 'Intercompany Cross Charge';
                intercoCrossCharge1.KNDY4__Role__c = 'Payee';
                intercoCrossCharge1.KNDY4__SubTransaction_Type__c = null;
                intercoCrossCharge1.KNDY4__Line_Type__c = null;
                intercoCrossCharge1.KNDY4__Rule_Type__c = 'CR';
                intercoCrossCharge1.KNDY4__Default_GL_Account__c = true;
                intercoCrossCharge1.KNDY4__GL_Account_Reference_Value__c = null;
                intercoCrossCharge1.KNDY4__GL_Account__c = intercompanyARGL.id;
                intercoCrossCharge1.KNDY4__Amount_Reference__c = null;
                intercoCrossCharge1.KNDY4__Company_Ledger__c = true;
                intercoCrossCharge1.KNDY4__Intercompany_Reference_Value__c = 'KNDY4__Invoice__r.KNDY4__To_Company__c';
                invoiceRuleList.add(intercoCrossCharge1);

                KNDY4__Accounting_Rule__c intercoCrossCharge2 = new KNDY4__Accounting_Rule__c();
                intercoCrossCharge2.KNDY4__Object_Name__c = 'KNDY4__Invoice__c';
                //intercoCrossCharge2.KNDY4__Company__c = Company.id;
                intercoCrossCharge2.KNDY4__Transaction__c = 'Intercompany Cross Charge';
                intercoCrossCharge2.KNDY4__Role__c = 'Payee';
                intercoCrossCharge2.KNDY4__SubTransaction_Type__c = null;
                intercoCrossCharge2.KNDY4__Line_Type__c = null;
                intercoCrossCharge2.KNDY4__Rule_Type__c = 'DR';
                intercoCrossCharge2.KNDY4__Default_GL_Account__c = false;
                intercoCrossCharge2.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__Accounting_Default__r.KNDY4__GL_Account__c';
                intercoCrossCharge2.KNDY4__GL_Account__c = null;
                intercoCrossCharge2.KNDY4__Amount_Reference__c = null;
                intercoCrossCharge2.KNDY4__Company_Ledger__c = true;
                intercoCrossCharge2.KNDY4__Intercompany_Reference_Value__c = 'KNDY4__Invoice__r.KNDY4__To_Company__c';
                invoiceRuleList.add(intercoCrossCharge2);
	            /*
                KNDY4__Accounting_Rule__c intercoCrossCharge3 = new KNDY4__Accounting_Rule__c();
                intercoCrossCharge3.KNDY4__Object_Name__c = 'KNDY4__Invoice__c';
	            //intercoCrossCharge3.KNDY4__Company__c = altCompany.id;
                intercoCrossCharge3.KNDY4__Transaction__c = 'Intercompany Cross Charge';
                intercoCrossCharge3.KNDY4__Role__c = 'Payor';
                intercoCrossCharge3.KNDY4__SubTransaction_Type__c = null;
                intercoCrossCharge3.KNDY4__Line_Type__c = null;
                intercoCrossCharge3.KNDY4__Rule_Type__c = 'CR';
                intercoCrossCharge3.KNDY4__Default_GL_Account__c = true;
                intercoCrossCharge3.KNDY4__GL_Account_Reference_Value__c = null;
                intercoCrossCharge3.KNDY4__GL_Account__c = intercompanyAPGL.id;
                intercoCrossCharge3.KNDY4__Amount_Reference__c = null;
                intercoCrossCharge3.KNDY4__Company_Ledger__c = true;
                intercoCrossCharge3.KNDY4__Intercompany_Reference_Value__c = 'KNDY4__Invoice__r.KNDY4__From_Company__c';
                invoiceRuleList.add(intercoCrossCharge3);

                KNDY4__Accounting_Rule__c intercoCrossCharge4 = new KNDY4__Accounting_Rule__c();
                intercoCrossCharge4.KNDY4__Object_Name__c = 'KNDY4__Invoice__c';
	            //intercoCrossCharge4.KNDY4__Company__c = altCompany.id;
                intercoCrossCharge4.KNDY4__Transaction__c = 'Intercompany Cross Charge';
                intercoCrossCharge4.KNDY4__Role__c = 'Payor';
                intercoCrossCharge4.KNDY4__SubTransaction_Type__c = null;
                intercoCrossCharge4.KNDY4__Line_Type__c = null;
                intercoCrossCharge4.KNDY4__Rule_Type__c = 'DR';
                intercoCrossCharge4.KNDY4__Default_GL_Account__c = false;
                intercoCrossCharge4.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__Accounting_Default__r.KNDY4__GL_Account__c';
                intercoCrossCharge4.KNDY4__GL_Account__c = null;
                intercoCrossCharge4.KNDY4__Amount_Reference__c = null;
                intercoCrossCharge4.KNDY4__Company_Ledger__c = true;
                intercoCrossCharge4.KNDY4__Intercompany_Reference_Value__c = 'KNDY4__Invoice__r.KNDY4__From_Company__c';
                invoiceRuleList.add(intercoCrossCharge4 );
	            */
                //Adding Effectivity to the accounting rules.
                for(KNDY4__Accounting_rule__c rule:invoiceRuleList)
                {
                    rule.KNDY4__Effective_Start_Date__c= effStartDate;
                    rule.KNDY4__Accounting_Standard__c  = accountingStandard.Id;
                }

                insert invoiceRuleList;
            }
            return invoiceRuleList;
        }
        set;

    }


    public List<KNDY4__Accounting_Rule__c> paymentRuleList{
        get{
            if(paymentRuleList == null){
                paymentRuleList = new List<KNDY4__Accounting_Rule__c>();


                KNDY4__Accounting_Rule__c intercoPayment1 = new KNDY4__Accounting_Rule__c();
                intercoPayment1.KNDY4__Object_Name__c = 'KNDY4__Payment__c';
                //intercoPayment1.KNDY4__Company__c = Company.id;
                intercoPayment1.KNDY4__Transaction__c = 'Intercompany Payment';
                intercoPayment1.KNDY4__Role__c = 'Payor';
                intercoPayment1.KNDY4__SubTransaction_Type__c = 'Intercompany Payment';
                intercoPayment1.KNDY4__Line_Type__c = null;
                intercoPayment1.KNDY4__Rule_Type__c = 'DR';
                intercoPayment1.KNDY4__Default_GL_Account__c = true;
                intercoPayment1.KNDY4__GL_Account_Reference_Value__c = null;
                intercoPayment1.KNDY4__GL_Account__c = intercompanyAPGL.id;
                intercoPayment1.KNDY4__Amount_Reference__c = null;
                intercoPayment1.KNDY4__Company_Ledger__c = true;
                intercoPayment1.KNDY4__Intercompany_Reference_Value__c = 'KNDY4__Payment__r.KNDY4__To_Company__c';
                paymentRuleList.add(intercoPayment1);

                KNDY4__Accounting_Rule__c intercoPayment2 = new KNDY4__Accounting_Rule__c();
                intercoPayment2.KNDY4__Object_Name__c = 'KNDY4__Payment__c';
                //intercoPayment2.KNDY4__Company__c = Company.id;
                intercoPayment2.KNDY4__Transaction__c = 'Intercompany Payment';
                intercoPayment2.KNDY4__Role__c = 'Payor';
                intercoPayment2.KNDY4__SubTransaction_Type__c = 'Intercompany Payment';
                intercoPayment2.KNDY4__Line_Type__c = null;
                intercoPayment2.KNDY4__Rule_Type__c = 'CR';
                intercoPayment2.KNDY4__Default_GL_Account__c = true;
                intercoPayment2.KNDY4__GL_Account_Reference_Value__c = null;
                intercoPayment2.KNDY4__GL_Account__c = IntercompanyUnappliedCashGL.id;
                intercoPayment2.KNDY4__Amount_Reference__c = null;
                intercoPayment2.KNDY4__Company_Ledger__c = true;
                intercoPayment2.KNDY4__Intercompany_Reference_Value__c = 'KNDY4__Payment__r.KNDY4__To_Company__c';
                paymentRuleList.add(intercoPayment2);

                KNDY4__Accounting_Rule__c intercoPayment11 = new KNDY4__Accounting_Rule__c();
                intercoPayment11.KNDY4__Object_Name__c = 'KNDY4__Payment__c';
                //intercoPayment11.KNDY4__Company__c = Company.id;
                intercoPayment11.KNDY4__Transaction__c = 'Intercompany Payment';
                intercoPayment11.KNDY4__Role__c = 'Payor';
                intercoPayment11.KNDY4__Line_Type__c = null;
                intercoPayment11.KNDY4__Rule_Type__c = 'DR';
                intercoPayment11.KNDY4__Default_GL_Account__c = true;
                intercoPayment11.KNDY4__GL_Account_Reference_Value__c = null;
                intercoPayment11.KNDY4__GL_Account__c = intercompanyAPGL.id;
                intercoPayment11.KNDY4__Amount_Reference__c = null;
                intercoPayment11.KNDY4__Company_Ledger__c = true;
                intercoPayment11.KNDY4__Intercompany_Reference_Value__c = 'KNDY4__Payment__r.KNDY4__To_Company__c';
                paymentRuleList.add(intercoPayment11);

                KNDY4__Accounting_Rule__c intercoPayment12 = new KNDY4__Accounting_Rule__c();
                intercoPayment12.KNDY4__Object_Name__c = 'KNDY4__Payment__c';
                //intercoPayment12.KNDY4__Company__c = Company.id;
                intercoPayment12.KNDY4__Transaction__c = 'Intercompany Payment';
                intercoPayment12.KNDY4__Role__c = 'Payor';
                intercoPayment12.KNDY4__Line_Type__c = null;
                intercoPayment12.KNDY4__Rule_Type__c = 'CR';
                intercoPayment12.KNDY4__Default_GL_Account__c = true;
                intercoPayment12.KNDY4__GL_Account_Reference_Value__c = null;
                intercoPayment12.KNDY4__GL_Account__c = IntercompanyUnappliedCashGL.id;
                intercoPayment12.KNDY4__Amount_Reference__c = null;
                intercoPayment12.KNDY4__Company_Ledger__c = true;
                intercoPayment12.KNDY4__Intercompany_Reference_Value__c = 'KNDY4__Payment__r.KNDY4__To_Company__c';
                paymentRuleList.add(intercoPayment12);

                KNDY4__Accounting_Rule__c intercoPayment3 = new KNDY4__Accounting_Rule__c();
                intercoPayment3.KNDY4__Object_Name__c = 'KNDY4__Payment__c';
                //intercoPayment3.KNDY4__Company__c = Company.id;
                intercoPayment3.KNDY4__Transaction__c = 'Intercompany Payment';
                intercoPayment3.KNDY4__Role__c = 'Payor';
                intercoPayment3.KNDY4__SubTransaction_Type__c = 'Intercompany Netting';
                intercoPayment3.KNDY4__Line_Type__c = null;
                intercoPayment3.KNDY4__Rule_Type__c = 'DR';
                intercoPayment3.KNDY4__Default_GL_Account__c = true;
                intercoPayment3.KNDY4__GL_Account_Reference_Value__c = null;
                intercoPayment3.KNDY4__GL_Account__c = IntercompanyUnappliedCashGL.id;
                intercoPayment3.KNDY4__Amount_Reference__c = null;
                intercoPayment3.KNDY4__Company_Ledger__c = true;
                intercoPayment3.KNDY4__Intercompany_Reference_Value__c = 'KNDY4__Payment__r.KNDY4__To_Company__c';
                paymentRuleList.add(intercoPayment3);

                KNDY4__Accounting_Rule__c intercoPayment4 = new KNDY4__Accounting_Rule__c();
                intercoPayment4.KNDY4__Object_Name__c = 'KNDY4__Payment__c';
                //intercoPayment4.KNDY4__Company__c = Company.id;
                intercoPayment4.KNDY4__Transaction__c = 'Intercompany Payment';
                intercoPayment4.KNDY4__Role__c = 'Payor';
                intercoPayment4.KNDY4__SubTransaction_Type__c = 'Intercompany Netting';
                intercoPayment4.KNDY4__Line_Type__c = null;
                intercoPayment4.KNDY4__Rule_Type__c = 'CR';
                intercoPayment4.KNDY4__Default_GL_Account__c = true;
                intercoPayment4.KNDY4__GL_Account_Reference_Value__c = null;
                intercoPayment4.KNDY4__GL_Account__c = intercompanyARGL.id;
                intercoPayment4.KNDY4__Amount_Reference__c = null;
                intercoPayment4.KNDY4__Company_Ledger__c = true;
                intercoPayment4.KNDY4__Intercompany_Reference_Value__c = 'KNDY4__Payment__r.KNDY4__To_Company__c';
                paymentRuleList.add(intercoPayment4);
	            /*
                KNDY4__Accounting_Rule__c intercoPayment5 = new KNDY4__Accounting_Rule__c();
                intercoPayment5.KNDY4__Object_Name__c = 'KNDY4__Payment__c';
	            //intercoPayment5.KNDY4__Company__c = altCompany.id;
                intercoPayment5.KNDY4__Transaction__c = 'Intercompany Payment';
                intercoPayment5.KNDY4__Role__c = 'Payee';
                intercoPayment5.KNDY4__SubTransaction_Type__c = 'Intercompany Payment';
                intercoPayment5.KNDY4__Line_Type__c = null;
                intercoPayment5.KNDY4__Rule_Type__c = 'DR';
                intercoPayment5.KNDY4__Default_GL_Account__c = true;
                intercoPayment5.KNDY4__GL_Account_Reference_Value__c = null;
                intercoPayment5.KNDY4__GL_Account__c = IntercompanyUnappliedCashGL.id;
                intercoPayment5.KNDY4__Amount_Reference__c = null;
                intercoPayment5.KNDY4__Company_Ledger__c = true;
                intercoPayment5.KNDY4__Intercompany_Reference_Value__c = 'KNDY4__Payment__r.KNDY4__From_Company__c';
                paymentRuleList.add(intercoPayment5);

                KNDY4__Accounting_Rule__c intercoPayment6 = new KNDY4__Accounting_Rule__c();
                intercoPayment6.KNDY4__Object_Name__c = 'KNDY4__Payment__c';
	            //intercoPayment6.KNDY4__Company__c = altCompany.id;
                intercoPayment6.KNDY4__Transaction__c = 'Intercompany Payment';
                intercoPayment6.KNDY4__Role__c = 'Payee';
                intercoPayment6.KNDY4__SubTransaction_Type__c = 'Intercompany Payment';
                intercoPayment6.KNDY4__Line_Type__c = null;
                intercoPayment6.KNDY4__Rule_Type__c = 'CR';
                intercoPayment6.KNDY4__Default_GL_Account__c = true;
                intercoPayment6.KNDY4__GL_Account_Reference_Value__c = null;
                intercoPayment6.KNDY4__GL_Account__c = intercompanyARGL.id;
                intercoPayment6.KNDY4__Amount_Reference__c = null;
                intercoPayment6.KNDY4__Company_Ledger__c = true;
                intercoPayment6.KNDY4__Intercompany_Reference_Value__c = 'KNDY4__Payment__r.KNDY4__From_Company__c';
                paymentRuleList.add(intercoPayment6);

                KNDY4__Accounting_Rule__c intercoPayment9 = new KNDY4__Accounting_Rule__c();
                intercoPayment9.KNDY4__Object_Name__c = 'KNDY4__Payment__c';
	            //intercoPayment9.KNDY4__Company__c = altCompany.id;
                intercoPayment9.KNDY4__Transaction__c = 'Intercompany Payment';
                intercoPayment9.KNDY4__Role__c = 'Payee';
                intercoPayment9.KNDY4__Line_Type__c = null;
                intercoPayment9.KNDY4__Rule_Type__c = 'DR';
                intercoPayment9.KNDY4__Default_GL_Account__c = true;
                intercoPayment9.KNDY4__GL_Account_Reference_Value__c = null;
                intercoPayment9.KNDY4__GL_Account__c = IntercompanyUnappliedCashGL.id;
                intercoPayment9.KNDY4__Amount_Reference__c = null;
                intercoPayment9.KNDY4__Company_Ledger__c = true;
                intercoPayment9.KNDY4__Intercompany_Reference_Value__c = 'KNDY4__Payment__r.KNDY4__From_Company__c';
                paymentRuleList.add(intercoPayment9);

                KNDY4__Accounting_Rule__c intercoPayment10 = new KNDY4__Accounting_Rule__c();
                intercoPayment10.KNDY4__Object_Name__c = 'KNDY4__Payment__c';
                intercoPayment10.KNDY4__Company__c = altCompany.id;
                intercoPayment10.KNDY4__Transaction__c = 'Intercompany Payment';
                intercoPayment10.KNDY4__Role__c = 'Payee';
                intercoPayment10.KNDY4__Line_Type__c = null;
                intercoPayment10.KNDY4__Rule_Type__c = 'CR';
                intercoPayment10.KNDY4__Default_GL_Account__c = true;
                intercoPayment10.KNDY4__GL_Account_Reference_Value__c = null;
                intercoPayment10.KNDY4__GL_Account__c = intercompanyARGL.id;
                intercoPayment10.KNDY4__Amount_Reference__c = null;
                intercoPayment10.KNDY4__Company_Ledger__c = true;
                intercoPayment10.KNDY4__Intercompany_Reference_Value__c = 'KNDY4__Payment__r.KNDY4__From_Company__c';
                paymentRuleList.add(intercoPayment10);

                KNDY4__Accounting_Rule__c intercoPayment7 = new KNDY4__Accounting_Rule__c();
                intercoPayment7.KNDY4__Object_Name__c = 'KNDY4__Payment__c';
	            //intercoPayment7.KNDY4__Company__c = altCompany.id;
                intercoPayment7.KNDY4__Transaction__c = 'Intercompany Payment';
                intercoPayment7.KNDY4__Role__c = 'Payee';
                intercoPayment7.KNDY4__SubTransaction_Type__c = 'Intercompany Netting';
                intercoPayment7.KNDY4__Line_Type__c = null;
                intercoPayment7.KNDY4__Rule_Type__c = 'DR';
                intercoPayment7.KNDY4__Default_GL_Account__c = true;
                intercoPayment7.KNDY4__GL_Account_Reference_Value__c = null;
                intercoPayment7.KNDY4__GL_Account__c = IntercompanyUnappliedCashGL.id;
                intercoPayment7.KNDY4__Amount_Reference__c = null;
                intercoPayment7.KNDY4__Company_Ledger__c = true;
                intercoPayment7.KNDY4__Intercompany_Reference_Value__c = 'KNDY4__Payment__r.KNDY4__From_Company__c';
                paymentRuleList.add(intercoPayment7);

                KNDY4__Accounting_Rule__c intercoPayment8 = new KNDY4__Accounting_Rule__c();
                intercoPayment8.KNDY4__Object_Name__c = 'KNDY4__Payment__c';
	            //intercoPayment8.KNDY4__Company__c = altCompany.id;
                intercoPayment8.KNDY4__Transaction__c = 'Intercompany Payment';
                intercoPayment8.KNDY4__Role__c = 'Payee';
                intercoPayment8.KNDY4__SubTransaction_Type__c = 'Intercompany Netting';
                intercoPayment8.KNDY4__Line_Type__c = null;
                intercoPayment8.KNDY4__Rule_Type__c = 'CR';
                intercoPayment8.KNDY4__Default_GL_Account__c = true;
                intercoPayment8.KNDY4__GL_Account_Reference_Value__c = null;
                intercoPayment8.KNDY4__GL_Account__c = intercompanyAPGL.id;
                intercoPayment8.KNDY4__Amount_Reference__c = null;
                intercoPayment8.KNDY4__Company_Ledger__c = true;
                intercoPayment8.KNDY4__Intercompany_Reference_Value__c = 'KNDY4__Payment__r.KNDY4__From_Company__c';
                paymentRuleList.add(intercoPayment8);
	            */
                //Adding Effectivity to the accounting rules.
                for(KNDY4__Accounting_rule__c rule:paymentRuleList)
                {
                    rule.KNDY4__Effective_Start_Date__c= effStartDate;
                    rule.KNDY4__Accounting_Standard__c = accountingStandard.Id;
                }

                insert paymentRuleList;
            }
            return paymentRuleList;
        }
        set;

    }

    public List<KNDY4__Exchange_Rate__c> exchangeRateList {
        get {
            if (exchangeRateList == null) {
                exchangeRateList = new List<KNDY4__Exchange_Rate__c>();
                KNDY4__Exchange_Rate__c exchangeRate1, exchangeRate2, exchangeRate3, exchangeRate4, exchangeRate5;
                exchangeRate1= new KNDY4__Exchange_Rate__c();
                exchangeRate1.KNDY4__Active__c = true;
                exchangeRate1.KNDY4__From_Currency__c = TestFuel.currencyUSD.id;
                exchangeRate1.KNDY4__To_Currency__c = TestFuel.currencySGD.id;
                exchangeRate1.KNDY4__Daily_Monthly__c = 'Daily';
                exchangeRate1.KNDY4__Multiplier_Exchange_Rate__c = 1.250000;
                exchangeRate1.KNDY4__rate_start_datetime__c = system.now();
                exchangeRate1.KNDY4__rate_end_datetime__c = system.now() + 2;


                exchangeRateList.add(exchangeRate1);

                exchangeRate2= new KNDY4__Exchange_Rate__c();
                exchangeRate2.KNDY4__Active__c = true;
                exchangeRate2.KNDY4__From_Currency__c = TestFuel.currencySGD.id;
                exchangeRate2.KNDY4__To_Currency__c = TestFuel.currencyGBP.id;
                exchangeRate2.KNDY4__Daily_Monthly__c = 'Daily';
                exchangeRate2.KNDY4__Multiplier_Exchange_Rate__c = 0.470000;
                exchangeRate2.KNDY4__rate_start_datetime__c = system.now();
                exchangeRate2.KNDY4__rate_end_datetime__c = system.now() + 30;

                exchangeRateList.add(exchangeRate2);

                exchangeRate3= new KNDY4__Exchange_Rate__c();
                exchangeRate3.KNDY4__Active__c = true;
                exchangeRate3.KNDY4__From_Currency__c = TestFuel.currencySGD.id;
                exchangeRate3.KNDY4__To_Currency__c = TestFuel.currencyEUR.id;
                exchangeRate3.KNDY4__Daily_Monthly__c = 'Daily';
                exchangeRate3.KNDY4__Multiplier_Exchange_Rate__c = 0.580000;
                exchangeRate3.KNDY4__rate_start_datetime__c = system.now();
                exchangeRate3.KNDY4__rate_end_datetime__c = system.now() + 30;

                exchangeRateList.add(exchangeRate3);

                exchangeRate4= new KNDY4__Exchange_Rate__c();
                exchangeRate4.KNDY4__Active__c = true;
                exchangeRate4.KNDY4__From_Currency__c = TestFuel.currencySGD.id;
                exchangeRate4.KNDY4__To_Currency__c = TestFuel.currencyUSD.id;
                exchangeRate4.KNDY4__Daily_Monthly__c = 'Daily';
                exchangeRate4.KNDY4__Multiplier_Exchange_Rate__c = 0.800000;
                exchangeRate4.KNDY4__rate_start_datetime__c = system.now();
                exchangeRate4.KNDY4__rate_end_datetime__c = system.now() + 30;

                exchangeRateList.add(exchangeRate4);

                exchangeRate5= new KNDY4__Exchange_Rate__c();
                exchangeRate5.KNDY4__Active__c = true;
                exchangeRate5.KNDY4__From_Currency__c = TestFuel.currencyCAD.id;
                exchangeRate5.KNDY4__To_Currency__c = TestFuel.currencySGD.id;
                exchangeRate5.KNDY4__Daily_Monthly__c = 'Daily';
                exchangeRate5.KNDY4__Multiplier_Exchange_Rate__c = 1.140000;
                exchangeRate5.KNDY4__rate_start_datetime__c = system.now();
                exchangeRate5.KNDY4__rate_end_datetime__c = system.now() + 2;

                exchangeRateList.add(exchangeRate5);
                List<KNDY4__Exchange_Rate__c> tmpRates = new List<KNDY4__Exchange_Rate__c>();
                for(KNDY4__Exchange_Rate__c r : exchangeRateList){
                    KNDY4__Exchange_Rate__c iR = r.clone(false, false, false);
                    iR.KNDY4__From_Currency__c = r.KNDY4__To_Currency__c;
                    iR.KNDY4__To_Currency__c = r.KNDY4__From_Currency__c;
                    iR.KNDY4__multiplier_exchange_rate__c = 1/r.KNDY4__multiplier_exchange_rate__c;
                    tmpRates.add(iR);
                }
                exchangeRateList.addAll(tmpRates);
                insert exchangeRateList;
            }
            return exchangeRateList;
        }
        set;
    }
    public datetime effStartDate{
        get{
            if(effStartDate==null)
            {
                //Give the earliest eff date possible - Previous yr used to make sure Transactions created are in effectivity range of accounting rules.
                return datetime.newInstance(system.now().year()-1, 1, 1, 0, 0, 0);
            }
            else
            {
                return effStartDate;
            }
        }set;
    }

    public List<KNDY4__GL_Type__c> GLTypeTestData{
        get{
            if(GLTypeTestData == null){
                string glTypeBody = [SELECT id, Body FROM StaticResource WHERE Name = 'TestData_GLType' LIMIT 1].body.toString();
                GLTypeTestData = (List<KNDY4__GL_Type__c>)CSVParser.parseRecords(KNDY4__GL_Type__c.sObjectType, glTypeBody);
                system.debug('GLTypeTestData:'+GLTypeTestData);
                insert GLTypeTestData;
            }
            return GLTypeTestData;
        }
        set ;

    }

    public Map<String,KNDY4__GL_Type__c> mGLTypes {
        get{
            if(mGLTypes == null){
                mGLTypes = new Map<String,KNDY4__GL_Type__c>();
                for(KNDY4__GL_Type__c glt: GLTypeTestData){
                    mGLTypes.put(String.valueof(glt.get('Name')), glt);
                }
            }
            return mGLTypes;
        }
        set;
    }

    public List<KNDY4__GL_Account__c> GLAccountTestData{
        get{
            system.assert(GLTypeTestData.size() != 0);
            if(GLAccountTestData == null){
                //List<sObject> recs = Test.loadData(KNDY4__GL_Account__c.sObjectType, 'TestData_GLAccount');
                //GLAccountTestData = (List<KNDY4__GL_Account__c>)recs;
                string glAccountBody = [SELECT id, Body FROM StaticResource WHERE Name = 'TestData_GLAccount' LIMIT 1].body.toString();
                GLAccountTestData = (List<KNDY4__GL_Account__c>)CSVParser.parseRecords(KNDY4__GL_Account__c.sObjectType, glAccountBody);
                system.debug(logginglevel.info,'GLAccountTestData:'+GLAccountTestData);
                insert GLAccountTestData;
            }

            return GLAccountTestData;
        }
        set ;

    }

    public Map<String,KNDY4__GL_Account__c> mGLAccounts {
        get{
            if(mGLAccounts == null){
                mGLAccounts = new Map<String,KNDY4__GL_Account__c>();
                for(KNDY4__GL_Account__c gla: GLAccountTestData){
                    String s = String.valueof(gla.get('KNDY4__GL_Account_Number__c'));
                    mGLAccounts.put(s, gla);
                }
            }
            return mGLAccounts;
        }
        set;
    }

    public List<KNDY4__Class__c> classList {
        get {
            if (classList == null){
                classList = new List<KNDY4__Class__c>();
                KNDY4__Class__c itemClass1 = new KNDY4__Class__c();
                itemClass1.KNDY4__Type__c = 'Goods';
                itemClass1.Name = 'Goods';
                itemClass1.KNDY4__Inventory_GL_Account__c = FGInventoryGL.id;
                itemClass1.KNDY4__Revenue_GL_Account__c = revenueGL.id;
                classList.add(itemClass1);

                KNDY4__Class__c itemClass2 = new KNDY4__Class__c();
                itemClass2.KNDY4__Type__c = 'Miscellaneous';
                itemClass2.Name = 'Miscellaneous';
                itemClass2.KNDY4__Inventory_GL_Account__c = FGInventoryGL.id;
                itemClass2.KNDY4__Revenue_GL_Account__c = revenueGL.id;
                classList.add(itemClass2);

                KNDY4__Class__c itemClass3 = new KNDY4__Class__c();
                itemClass3.KNDY4__Type__c = 'Expense';
                itemClass3.Name = 'Expense';
                itemClass3.KNDY4__Inventory_GL_Account__c = FGInventoryGL.id;
                itemClass3.KNDY4__Revenue_GL_Account__c = revenueGL.id;
                classList.add(itemClass3);
                insert classList;
            }
            return classlist;
        }set;
    }



    public KNDY4__Class__c clsObj {
        get {
            if (clsObj == null) {
                clsObj = new KNDY4__Class__c();
                clsObj.Name = string.valueOf(system.now());
                clsObj.KNDY4__Description__c = 'Item Class One';
                clsObj.KNDY4__Type__c = 'Goods';
                clsObj.KNDY4__Revenue_GL_Account__c = cashGL.Id;
                clsObj.KNDY4__Inventory_GL_Account__c = FGInventoryGL.Id;
                clsObj.KNDY4__class_unique__c = clsObj.Name;
                insert clsObj;
            }
            return clsObj;
        } set;
    }
    public KNDY4__Class__c FreightClass {
        get {
            if (FreightClass == null) {
                FreightClass = new KNDY4__Class__c();
                FreightClass.Name = 'Freight Class';
                FreightClass.KNDY4__Description__c = 'Freight Class';
                FreightClass.KNDY4__Type__c = 'Freight';
                FreightClass.KNDY4__class_unique__c = FreightClass.Name;
                insert FreightClass;
            }
            return FreightClass;
        } set;
    }
    public KNDY4__Class__c ItemClassNoType {
        get {
            if (ItemClassNoType == null) {
                ItemClassNoType = new KNDY4__Class__c();
                ItemClassNoType.Name = 'Freight Class - no type';
                ItemClassNoType.KNDY4__Description__c = 'Freight Class';
                ItemClassNoType.KNDY4__class_unique__c = ItemClassNoType.Name;
                ItemClassNoType.KNDY4__Type__c = '';
                insert ItemClassNoType;
            }
            return ItemClassNoType;
        } set;
    }

    public KNDY4__Item_Attribute__c itemAttrObj {
        get {
            if (itemAttrObj == null) {
                itemAttrObj = new KNDY4__Item_Attribute__c(
                        Name = 'No Serials Attribute-1',
                        KNDY4__Lot_Number__c = true,
                        KNDY4__Expiration_Date__c = true
                );
                insert itemAttrObj;
            }
            return itemAttrObj;
        } set;
    }

    public KNDY4__Item_Attribute__c itemAttrObj2 {
        get {
            if (itemAttrObj2 == null) {
                itemAttrObj2 = new KNDY4__Item_Attribute__c(
                        Name = 'Serials Attribute-2',
                        KNDY4__Lot_Number__c = true,
                        KNDY4__Expiration_Date__c = true,
                        KNDY4__Serial_Number__c = true,
                        KNDY4__Minimum_Shelf_Life_In_Days__c = true
                );
                insert itemAttrObj2;
            }
            return itemAttrObj2;
        } set;
    }

    public KNDY4__Item_Attribute__c lpnAttribute {
        get {
            if (lpnAttribute == null) {
                lpnAttribute = new KNDY4__Item_Attribute__c(
                        Name = 'LPN',
                        KNDY4__License_Plate_Number__c = true
                );
                insert lpnAttribute;
            }
            return lpnAttribute;
        } set;
    }

    public KNDY4__UOM__c uomObj {
        get {
            if (uomObj == null) {
                uomObj = uomList[8];
            }
            return uomObj;
        }
        set;
    }

    public KNDY4__UOM__c uomInch {
        get {
            if (uomInch == null) {
                uomInch = uomList[6];
            }
            return uomInch;
        }
        set;
    }

    public KNDY4__UOM__c RENTAL_MONTH {
        get {
            if (RENTAL_MONTH == null) {
                RENTAL_MONTH = new KNDY4__UOM__c(Name = 'Rental Month', KNDY4__Type__c = 'Time', KNDY4__Every__c = 28, KNDY4__Recurrence__c = 'Day(s)');
                insert RENTAL_MONTH;
            }
            return RENTAL_MONTH;
        }
        set;
    }

    public KNDY4__UOM__c WEEK {
        get {
            if (WEEK == null) {
                WEEK = new KNDY4__UOM__c(Name = 'Week', KNDY4__Type__c = 'Time', KNDY4__Every__c = 1, KNDY4__Recurrence__c = 'Week(s)');
                insert WEEK;
            }
            return WEEK;
        }
        set;
    }
    public KNDY4__UOM__c CALENDAR_MONTH {
        get {
            if (CALENDAR_MONTH == null) {
                CALENDAR_MONTH = new KNDY4__UOM__c(Name = 'Calendar Month', KNDY4__Type__c = 'Time', KNDY4__Every__c = 1, KNDY4__Recurrence__c = 'Month(s)');
                insert CALENDAR_MONTH;
            }
            return CALENDAR_MONTH;
        }
        set;
    }
    public KNDY4__UOM__c CALENDAR_QUARTER {
        get {
            if (CALENDAR_QUARTER == null) {
                CALENDAR_QUARTER = new KNDY4__UOM__c(Name= 'Calendar Quarter', KNDY4__Type__c = 'Time', KNDY4__Every__c = 1, KNDY4__Recurrence__c = 'Quarter(s)');
                insert CALENDAR_QUARTER;
            }
            return CALENDAR_QUARTER;
        }
        set;
    }

    public List<KNDY4__Package_Class__c> packageClassList {
        get {
            if (packageClassList == null) {
                KNDY4__Package_Class__c palletClass = new KNDY4__Package_Class__c(Name='Pallet', KNDY4__Level__c = 3);
                KNDY4__Package_Class__c caseClass = new KNDY4__Package_Class__c(Name='Case', KNDY4__Level__c = 2);
                KNDY4__Package_Class__c eachClass = new KNDY4__Package_Class__c(Name='Each', KNDY4__Level__c = 1);
                packageClassList = new List<KNDY4__Package_Class__c>{ palletClass, caseClass, eachClass };

                //DML.systemTime = System.now().addHours(-2);
                List<KNDY4__Configuration__c> configList = new List<KNDY4__Configuration__c>{ new KNDY4__Configuration__c(Name = KNDY4__Package_Class__c.sObjectType.getDescribe().getLocalName() + '-' + KNDY4__Package_Class__c.sObjectType.getDescribe().getKeyPrefix(),KNDY4__Value__c = UserInfo.getUserId()) };
                insert configList;

                insert packageClassList;
                caseClass.KNDY4__Parent_Package_Class__c = palletClass.Id;
                eachClass.KNDY4__Parent_Package_Class__c = caseClass.Id;
                update packageClassList;

                delete configList;
            }
            return packageClassList;
        } set;
    }

    public List<KNDY4__UOM__c> uomList {
        get {
            if (uomList == null) {
                Map<String, KNDY4__UOM__c> existingUoms = new Map<String, KNDY4__UOM__c>();
                for (KNDY4__UOM__c uom:[SELECT Id, name FROM KNDY4__UOM__c]) existingUoms.put(uom.Name, uom);

                List<String> uoms = new List<String>{ 'LB', 'TN', 'DZ', 'OZ', 'MI', 'YD', 'IN', 'FT', 'EA', 'FT3', 'GAL', 'EA2', 'CS', 'PT' };
                List<String> uomDescs = new List<String>{ 'Pound', 'Ton', 'Dozen', 'Ounce', 'Mile', 'Yard', 'Inch', 'Foot', 'Each', 'Cubic', 'Gallon', 'Each2', 'Case', 'Pallet' };

                uomList = new List<KNDY4__UOM__c>();
                for (Integer i = 0; i < uoms.size(); i++){
                    String uom = uoms[i];

                    if(!existingUoms.containsKey(uom)) {
                        uomList.add(new KNDY4__UOM__c(
                                Name = uom,
                                KNDY4__Description__c = uomDescs[i]
                        ));
                    } else {
                        uomList.add(existingUoms.get(uom));
                    }

                    if (uom == 'EA2') {
                        uomList[i].KNDY4__Package_Class__c = packageClassList[2].Id;
                    } else if (uom == 'CS') {
                        uomList[i].KNDY4__Package_Class__c = packageClassList[1].Id;
                    } else if (uom == 'PT') {
                        uomList[i].KNDY4__Package_Class__c = packageClassList[0].Id;
                    }
                }

                upsert uomList;
                System.assert(uomcList != null);
            }
            return uomList;
        } set;
    }

    public List<KNDY4__Stock_Movement_Rule_Settings__c> smrsList {
        get {
            if (smrsList == null) {
                List<String> stockMovementRuleFields = new List<String>{'KNDY4__Class__c','KNDY4__Customer__c','KNDY4__Company__c','KNDY4__Facility__c','KNDY4__Item__c'};
                List<String> sourceDocuments = new List<String>{'Purchase Order', 'Sales Order', 'Work Order', 'Transfer Order', 'Receiving Document','Transfer'};
                smrsList = new List<KNDY4__Stock_Movement_Rule_Settings__c>();

                for( String sourceDocument : sourceDocuments ){
                    for( String stockMovementRuleField : stockMovementRuleFields ){

                        if( !(stockMovementRuleField == 'KNDY4__Customer__c' && ( sourceDocument != 'Sales Order'))   ){
                            KNDY4__Stock_Movement_Rule_Settings__c smrs = new KNDY4__Stock_Movement_Rule_Settings__c();
                            smrs.Name = sourceDocument+'-'+stockMovementRuleField;
                            smrs.KNDY4__Stock_Movement_Rule_Field__c = stockMovementRuleField;
                            smrs.KNDY4__Source_Document__c = sourceDocument;

                            if( (sourceDocument == 'Purchase Order' || sourceDocument == 'Receiving Document') && stockMovementRuleField == 'KNDY4__Class__c' ){
                                smrs.KNDY4__Source_Document_Path__c = 'KNDY4__Item__r.KNDY4__Class__c';
                            }
                            else if( sourceDocument == 'Purchase Order' && stockMovementRuleField == 'KNDY4__Facility__c' ){
                                smrs.KNDY4__Source_Document_Path__c = 'KNDY4__Delivery_Facility__c';
                            }
                            else if( sourceDocument == 'Sales Order' && stockMovementRuleField == 'KNDY4__Class__c' ){
                                smrs.KNDY4__Source_Document_Path__c = 'KNDY4__Product__r.KNDY4__Item__r.KNDY4__Class__c';
                            }
                            else if( sourceDocument == 'Sales Order' && stockMovementRuleField == 'KNDY4__Customer__c' ){
                                smrs.KNDY4__Source_Document_Path__c = 'KNDY4__Sales_Order__r.KNDY4__Customer__c';
                            }
                            else if( sourceDocument == 'Sales Order' && stockMovementRuleField == 'KNDY4__Facility__c' ){
                                smrs.KNDY4__Source_Document_Path__c = 'KNDY4__Ship_From_Location__r.KNDY4__Facility__c';
                            }
                            else if( sourceDocument == 'Sales Order' && stockMovementRuleField == 'KNDY4__Item__c' ){
                                smrs.KNDY4__Source_Document_Path__c = 'KNDY4__Product__r.KNDY4__Item__c';
                            }
                            else if( sourceDocument == 'Transfer Order' && stockMovementRuleField == 'KNDY4__Company__c' ){
                                smrs.KNDY4__Source_Document_Path__c = 'KNDY4__Order__r.KNDY4__Shipping_Company__c';
                                smrs.KNDY4__Source_Document_Path_Putaway__c ='KNDY4__Order__r.KNDY4__Receiving_Company__c';
                            }
                            else if( sourceDocument == 'Transfer Order' && stockMovementRuleField == 'KNDY4__Class__c' ){
                                smrs.KNDY4__Source_Document_Path__c = 'KNDY4__Shipping_Item__r.KNDY4__Class__c';
                                smrs.KNDY4__Source_Document_Path_Putaway__c ='KNDY4__Receiving_Item__r.KNDY4__Class__c';
                            }
                            else if( sourceDocument == 'Transfer Order' && stockMovementRuleField == 'KNDY4__Facility__c' ){
                                smrs.KNDY4__Source_Document_Path__c = 'KNDY4__Ship_From_Facility__c';
                                smrs.KNDY4__Source_Document_Path_Putaway__c ='KNDY4__Deliver_To_Facility__c';
                            }
                            else if( sourceDocument == 'Transfer Order' && stockMovementRuleField == 'KNDY4__Item__c' ){
                                smrs.KNDY4__Source_Document_Path__c = 'KNDY4__Shipping_Item__c';
                                smrs.KNDY4__Source_Document_Path_Putaway__c ='KNDY4__Receiving_Item__c';
                            }
                            else if( sourceDocument == 'Transfer' && stockMovementRuleField == 'KNDY4__Company__c' ){//custom setting for direct putaway stock movement rule
                                smrs.KNDY4__Source_Document_Path__c = 'KNDY4__Company__c';
                                smrs.KNDY4__Source_Document_Path_Putaway__c ='KNDY4__Company__c';
                            }
                            else if( sourceDocument == 'Transfer' && stockMovementRuleField == 'KNDY4__Class__c' ){
                                smrs.KNDY4__Source_Document_Path__c = 'KNDY4__Class__c';
                                smrs.KNDY4__Source_Document_Path_Putaway__c ='KNDY4__Class__c';
                            }
                            else if( sourceDocument == 'Transfer' && stockMovementRuleField == 'KNDY4__Facility__c' ){
                                smrs.KNDY4__Source_Document_Path__c = 'KNDY4__Facility__c';
                                smrs.KNDY4__Source_Document_Path_Putaway__c ='KNDY4__Facility__c';
                            }
                            else if( sourceDocument == 'Transfer' && stockMovementRuleField == 'KNDY4__Item__c' ){
                                smrs.KNDY4__Source_Document_Path__c = 'KNDY4__Item__c';
                                smrs.KNDY4__Source_Document_Path_Putaway__c ='KNDY4__Item__c';
                            } else if (sourceDocument == 'Work Order' && stockMovementRuleField == 'KNDY4__Class__c') {
                                smrs.KNDY4__Source_Document_Path__c = 'KNDY4__Item__r.KNDY4__Class__c';
                            } else if (sourceDocument == 'Work Order' && stockMovementRuleField == 'KNDY4__Facility__c') {
                                smrs.KNDY4__Source_Document_Path__c = 'KNDY4__Work_Order__r.KNDY4__Facility__c';
                            } else if (sourceDocument == 'Work Order' && stockMovementRuleField == 'KNDY4__Company__c') {
                                smrs.KNDY4__Source_Document_Path__c = 'KNDY4__Work_Order__r.KNDY4__Company__c';
                            } else {
                                smrs.KNDY4__Source_Document_Path__c = stockMovementRuleField;
                            }

                            if (sourceDocument != 'Transfer Order')
                                smrs.KNDY4__Source_Document_Path_Putaway__c = smrs.KNDY4__Source_Document_Path__c;

                            smrsList.add(smrs);
                        }
                    }
                }
                insert smrsList;
            }
            return smrsList;
        }
        set;
    }

    public List<KNDY4__Custom_Tab_Settings__c> csTabSettings {
        get{
            if (csTabSettings == null) {

                csTabSettings= new List<KNDY4__Custom_Tab_Settings__c>();

                List<String> tabNames = new List<String>{'Inventory','Purchasing','Order Management','Specification','Planning', 'Assign Facility'};

                for(String tab:tabNames){

                    KNDY4__Custom_Tab_Settings__c cs = new KNDY4__Custom_Tab_Settings__c();
                    cs.Name = tab+'tab';
                    if(tab == 'Inventory'){
                        cs.KNDY4__Tab_Name__c = tab;
                        cs.KNDY4__Sequence__c = 1;
                        cs.KNDY4__Object_API_Name__c = 'KNDY4__Item__c';
                        cs.KNDY4__Header_Field_Set_Object_API_Name__c = 'KNDY4__Item__c';
                        cs.KNDY4__Header_Field_Set_Name__c = 'Inventory';
                        csTabSettings.add(cs);
                    }
                    if(tab == 'Purchasing'){
                        cs.KNDY4__Tab_Name__c = tab;
                        cs.KNDY4__Sequence__c = 2;
                        cs.KNDY4__Object_API_Name__c = 'KNDY4__Item__c';
                        cs.KNDY4__Header_Field_Set_Object_API_Name__c = 'KNDY4__Item__c';
                        cs.KNDY4__Header_Field_Set_Name__c = 'Purchasing';
                        csTabSettings.add(cs);
                    }
                    if(tab == 'Order Management'){
                        cs.KNDY4__Tab_Name__c = tab;
                        cs.KNDY4__Sequence__c = 3;
                        cs.KNDY4__Object_API_Name__c = 'KNDY4__Item__c';
                        cs.KNDY4__Header_Field_Set_Object_API_Name__c = 'KNDY4__Item__c';
                        cs.KNDY4__Header_Field_Set_Name__c = 'OrderDetail';
                        cs.KNDY4__Detail_Field_Set_Object_API_Name__c = 'KNDY4__Product__c';
                        cs.KNDY4__Detail_Field_Set_Name__c = 'Create_Product';
                        csTabSettings.add(cs);
                    }
                    if(tab == 'Specification'){
                        cs.KNDY4__Tab_Name__c = tab;
                        cs.KNDY4__Sequence__c = 4;
                        cs.KNDY4__Object_API_Name__c = 'KNDY4__Item__c';
                        cs.KNDY4__Header_Field_Set_Object_API_Name__c = 'KNDY4__Item__c';
                        cs.KNDY4__Header_Field_Set_Name__c = 'ItemSpec_Header';
                        cs.KNDY4__Detail_Field_Set_Object_API_Name__c = 'KNDY4__Item_Specification__c';
                        cs.KNDY4__Detail_Field_Set_Name__c = 'Create_ItemSpec';
                        csTabSettings.add(cs);
                    }
                    if(tab == 'Planning'){
                        cs.KNDY4__Tab_Name__c = tab;
                        cs.KNDY4__Sequence__c = 5;
                        cs.KNDY4__Object_API_Name__c = 'KNDY4__Item__c';
                        cs.KNDY4__Header_Field_Set_Object_API_Name__c = 'KNDY4__Item__c';
                        cs.KNDY4__Header_Field_Set_Name__c = 'Planning';
                        csTabSettings.add(cs);
                    }
                    if(tab == 'Assign Facility'){
                        cs.KNDY4__Tab_Name__c = tab;
                        cs.KNDY4__Sequence__c = 6;
                        cs.KNDY4__Object_API_Name__c = 'KNDY4__Item__c';
                        cs.KNDY4__Detail_Field_Set_Object_API_Name__c = 'KNDY4__Facility_Item__c';
                        cs.KNDY4__Detail_Field_Set_Name__c = 'Assign_Facility';
                        csTabSettings.add(cs);
                    }

                }

                insert csTabSettings;
            }
            return csTabSettings;
        }
        set;

    }

    /*
     * Item 22 (Index 12) = Case Item
     * Item 23 (Index 13) = Pallet Item
     * Item 24 (Index 14) = Item with packaging (no container override)
     * Item 25 (Index 15) = Item with packaging (case override)
     * Item 26 (Index 16) = Item with packaging (pallet override)
     */
    public List<KNDY4__Item__c> itemList  {
        get {
            if (itemList == null) {
                itemList = new List<KNDY4__Item__c>();
                for (Integer i = 10; i < 27; i++) {
                    KNDY4__Item__c item = new KNDY4__Item__c(
                            Name = company.Name + ' Item-' + i,
                            KNDY4__Company__c = company.Id,
                            KNDY4__Active__c = true,
                            KNDY4__Non_Inventory__c = false,
                            KNDY4__Description__c = 'Item-' + i,
                            KNDY4__Purchasing_UOM__c = uomList[8].Id,
                            KNDY4__Item_Attribute__c = itemAttrObj.Id,
                            KNDY4__Stocking_UOM__c = uomList[8].Id,
                            KNDY4__Packaging_UOM__c = JSON.serialize(new List<Id>{ uomList[8].Id })
                    );

                    if (i == 10 || i == 15) {
                        item.KNDY4__Source__c = 'Manufactured';
                        item.KNDY4__Class__c = clsObj.ID;
                        item.KNDY4__Lead_Time__c = i / 2;
                        if (i == 10) item.KNDY4__ABC_Code__c = 'A';
                        else item.KNDY4__ABC_Code__c = 'B';
                    } else if (i == 21) {
                        item.KNDY4__Source__c = 'Manufactured';
                        item.KNDY4__Class__c = clsObj.ID;
                        item.KNDY4__Lead_Time__c = i / 3;
                    } else {
                        item.KNDY4__Source__c = 'Purchased';
                        item.KNDY4__Lead_Time__c = i / 5;
                    }

                    if (i == 22) {
                        item.KNDY4__Container__c = true;
                        item.KNDY4__Container_Package_Class__c = packageClassList[1].Id;
                        item.KNDY4__ExtId__c = 'CaseContainer';
                        item.KNDY4__Item_Attribute__c = null;
                    } else if (i == 23) {
                        item.KNDY4__Container__c = true;
                        item.KNDY4__Container_Package_Class__c = packageClassList[0].Id;
                        item.KNDY4__ExtId__c = 'PalletContainer';
                        item.KNDY4__Item_Attribute__c = lpnAttribute.Id;
                    } else if (i == 24 || i == 25 || i == 26) {
                        item.KNDY4__Stocking_UOM__c = uomList[11].Id;
                        item.KNDY4__Purchasing_UOM__c = uomList[11].Id;
                        item.KNDY4__Packaging_UOM__c = JSON.serialize(new List<Id>{ uomList[11].Id, uomList[12].Id, uomList[13].Id });
                    }

                    itemList.add(item);
                }
                insert itemList;

                //DML.systemTime = System.now().addHours(-2);
                List<KNDY4__Configuration__c> configList = new List<KNDY4__Configuration__c>{
                        new KNDY4__Configuration__c(Name = KNDY4__Package_Class__c.sObjectType.getDescribe().getLocalName() + '-' + KNDY4__Package_Class__c.sObjectType.getDescribe().getKeyPrefix(),KNDY4__Value__c = UserInfo.getUserId()),
                        new KNDY4__Configuration__c(Name = KNDY4__Item__c.sObjectType.getDescribe().getLocalName() + '-' + KNDY4__Item__c.sObjectType.getDescribe().getKeyPrefix(),KNDY4__Value__c = UserInfo.getUserId())
                };
                insert configList;

                itemList[9].KNDY4__Container_Item__c = itemList[12].Id;
                itemList[10].KNDY4__Container_Item__c = itemList[13].Id;
                update itemList;

                packageClassList[0].KNDY4__Default_Container_Item__c = itemList[13].Id;
                packageClassList[1].KNDY4__Default_Container_Item__c = itemList[12].Id;
                update packageClassList;

                delete configList;

                List<KNDY4__Item_Cost__c> getCosts = costList;
            }
            return itemList;
        }
        set;
    }
    public KNDY4__Item__c FreightItem  {
        get {
            if (FreightItem == null) {
                FreightItem = new KNDY4__Item__c();
                FreightItem.name = Company.Name + ' Freight Item';
                FreightItem.KNDY4__Description__c = 'Freight Item';
                FreightItem.KNDY4__Source__c = 'Purchased';
                FreightItem.KNDY4__Class__c = FreightClass.id;
                FreightItem.KNDY4__company__c = company.id;
                FreightItem.KNDY4__Active__c = true;
                FreightItem.KNDY4__Packaging_UOM__c = JSON.serialize(new List<Id>{uomList[8].Id});
                insert FreightItem;
            }
            return FreightItem;
        } set;
    }
    public KNDY4__Item__c ItemNoClassType  {
        get {
            if (ItemNoClassType == null) {
                ItemNoClassType = new KNDY4__Item__c();
                ItemNoClassType.name = Company.Name + '-ItemNoClassType';
                ItemNoClassType.KNDY4__Description__c = 'Freight Item';
                ItemNoClassType.KNDY4__Source__c = 'Purchased';
                ItemNoClassType.KNDY4__Class__c = ItemClassNoType.id;
                ItemNoClassType.KNDY4__company__c = company.id;
                ItemNoClassType.KNDY4__Active__c = true;
                ItemNoClassType.KNDY4__Purchasing_UOM__c = uomList[8].Id;
                ItemNoClassType.KNDY4__Packaging_UOM__c = JSON.serialize(new List<Id>{uomList[8].Id});
                insert ItemNoClassType;
            }
            return ItemNoClassType;
        } set;
    }
    public List<KNDY4__UOM_Conversion_Details__c> uomcList {
        get {
            if (uomcList == null) {
                uomcList = new List<KNDY4__UOM_Conversion_Details__c>();

                KNDY4__UOM_Conversion_Details__c Obj = new KNDY4__UOM_Conversion_Details__c();
                //DZ-EA
                Obj.Name = ((String)uomList[2].Id).substring(3, 15) + ((String)uomList[8].Id).substring(3, 15);
                Obj.KNDY4__uom_1__c = uomList[2].Id;
                Obj.KNDY4__uom_1_Quantity__c =1;
                Obj.KNDY4__uom_2__c = uomList[8].Id;
                Obj.KNDY4__uom_2_Quantity__c = 12.0;
                Obj.KNDY4__Key_1__c = string.valueof(uomList[2].Id)+string.valueof(uomList[8].Id);
                Obj.KNDY4__Key_2__c = string.valueof(uomList[8].Id)+string.valueof(uomList[2].Id);
                uomcList.add(Obj);


                KNDY4__UOM_Conversion_Details__c Obj1 = new KNDY4__UOM_Conversion_Details__c();
                //FT-IN
                Obj1.Name = ((String)uomList[7].Id).substring(3, 15) + ((String)uomList[6].Id).substring(3, 15);
                Obj1.KNDY4__uom_1__c = uomList[7].Id;
                Obj1.KNDY4__uom_1_Quantity__c =1;
                Obj1.KNDY4__uom_2__c = uomList[6].Id;
                Obj1.KNDY4__uom_2_Quantity__c = 12.0;
                Obj1.KNDY4__Key_1__c = string.valueof(uomList[7].Id)+string.valueof(uomList[6].Id);
                Obj1.KNDY4__Key_2__c = string.valueof(uomList[6].Id)+string.valueof(uomList[7].Id);
                uomcList.add(Obj1);


                KNDY4__UOM_Conversion_Details__c Obj2 = new KNDY4__UOM_Conversion_Details__c();
                //MI-FT
                Obj2.Name = ((String)uomList[4].Id).substring(3, 15) + ((String)uomList[7].Id).substring(3, 15);
                Obj2.KNDY4__uom_1__c = uomList[4].Id;
                Obj2.KNDY4__uom_1_Quantity__c =1;
                Obj2.KNDY4__uom_2__c = uomList[7].Id;
                Obj2.KNDY4__uom_2_Quantity__c = 5280.0;
                Obj2.KNDY4__Key_1__c = string.valueof(uomList[4].Id)+string.valueof(uomList[7].Id);//string.valueof(itemList[0].Id) +
                Obj2.KNDY4__Key_2__c = string.valueof(uomList[7].Id)+string.valueof(uomList[4].Id);//string.valueof(itemList[0].Id) +
                //Obj.KNDY4__Conversion_Factor__c = uomcnvs[i];
                uomcList.add(Obj2);

                KNDY4__UOM_Conversion_Details__c Obj3 = new KNDY4__UOM_Conversion_Details__c();
                //YD-FT
                Obj3.Name = ((String)uomList[5].Id).substring(3, 15) + ((String)uomList[7].Id).substring(3, 15);
                Obj3.KNDY4__uom_1__c = uomList[5].Id;
                Obj3.KNDY4__uom_1_Quantity__c =1;
                Obj3.KNDY4__uom_2__c = uomList[7].Id;
                Obj3.KNDY4__uom_2_Quantity__c = 3.0;
                Obj3.KNDY4__Key_1__c = string.valueof(uomList[5].Id)+string.valueof(uomList[7].Id);//string.valueof(itemList[0].Id) +
                Obj3.KNDY4__Key_2__c = string.valueof(uomList[7].Id)+string.valueof(uomList[5].Id);//string.valueof(itemList[0].Id) +
                //Obj.KNDY4__Conversion_Factor__c = uomcnvs[i];
                uomcList.add(Obj3);


                KNDY4__UOM_Conversion_Details__c Obj4 = new KNDY4__UOM_Conversion_Details__c();
                //LB-OZ
                Obj4.Name = ((String)uomList[0].Id).substring(3, 15) + ((String)uomList[3].Id).substring(3, 15);
                Obj4.KNDY4__uom_1__c = uomList[0].Id;
                Obj4.KNDY4__uom_1_Quantity__c =1;
                Obj4.KNDY4__uom_2__c = uomList[3].Id;
                Obj4.KNDY4__uom_2_Quantity__c = 16.0;
                Obj4.KNDY4__Key_1__c = string.valueof(uomList[0].Id)+string.valueof(uomList[3].Id);//string.valueof(itemList[0].Id) +
                Obj4.KNDY4__Key_2__c = string.valueof(uomList[3].Id)+string.valueof(uomList[0].Id);//string.valueof(itemList[0].Id) +
                //Obj.KNDY4__Conversion_Factor__c = uomcnvs[i];
                uomcList.add(Obj4);

                KNDY4__UOM_Conversion_Details__c Obj5 = new KNDY4__UOM_Conversion_Details__c();
                //MI-YD
                Obj5.Name = ((String)uomList[4].Id).substring(3, 15) + ((String)uomList[5].Id).substring(3, 15);
                Obj5.KNDY4__uom_1__c = uomList[4].Id;
                Obj5.KNDY4__uom_1_Quantity__c =1;
                Obj5.KNDY4__uom_2__c = uomList[5].Id;
                Obj5.KNDY4__uom_2_Quantity__c = 1760.0;
                Obj5.KNDY4__Key_1__c = string.valueof(uomList[4].Id)+string.valueof(uomList[5].Id);//string.valueof(itemList[0].Id) +
                Obj5.KNDY4__Key_2__c = string.valueof(uomList[5].Id)+string.valueof(uomList[4].Id);//string.valueof(itemList[0].Id) +
                //Obj.KNDY4__Conversion_Factor__c = uomcnvs[i];
                uomcList.add(Obj5);

                KNDY4__UOM_Conversion_Details__c Obj6 = new KNDY4__UOM_Conversion_Details__c();
                //TN-LB
                Obj6.Name = ((String)uomList[1].Id).substring(3, 15) + ((String)uomList[0].Id).substring(3, 15);
                Obj6.KNDY4__uom_1__c = uomList[1].Id;
                Obj6.KNDY4__uom_1_Quantity__c =1;
                Obj6.KNDY4__uom_2__c = uomList[0].Id;
                Obj6.KNDY4__uom_2_Quantity__c = 2000.0;
                Obj6.KNDY4__Key_1__c = string.valueof(uomList[1].Id)+string.valueof(uomList[0].Id);//string.valueof(itemList[0].Id) +
                Obj6.KNDY4__Key_2__c = string.valueof(uomList[0].Id)+string.valueof(uomList[1].Id);//string.valueof(itemList[0].Id) +
                //Obj.KNDY4__Conversion_Factor__c = uomcnvs[i];
                uomcList.add(Obj6);

                KNDY4__UOM_Conversion_Details__c Obj7 = new KNDY4__UOM_Conversion_Details__c();
                //YD-FT3
                Obj7.Name = ((String)uomList[5].Id).substring(3, 15) + ((String)uomList[9].Id).substring(3, 15);
                Obj7.KNDY4__uom_1__c = uomList[5].Id;
                Obj7.KNDY4__uom_1_Quantity__c =1;
                Obj7.KNDY4__uom_2__c = uomList[9].Id;
                Obj7.KNDY4__uom_2_Quantity__c = 0.037040;
                Obj7.KNDY4__Key_1__c = string.valueof(uomList[5].Id)+string.valueof(uomList[9].Id);//string.valueof(itemList[9].Id) +
                Obj7.KNDY4__Key_2__c = string.valueof(uomList[9].Id)+string.valueof(uomList[5].Id);//string.valueof(itemList[0].Id) +
                //Obj.KNDY4__Conversion_Factor__c = uomcnvs[i];
                uomcList.add(Obj7);

                KNDY4__UOM_Conversion_Details__c Obj8 = new KNDY4__UOM_Conversion_Details__c();
                //FT3-GAL
                Obj8.Name = ((String)uomList[10].Id).substring(3, 15) + ((String)uomList[9].Id).substring(3, 15);
                Obj8.KNDY4__uom_1__c = uomList[10].Id;
                Obj8.KNDY4__uom_1_Quantity__c =1;
                Obj8.KNDY4__uom_2__c = uomList[9].Id;
                Obj8.KNDY4__uom_2_Quantity__c = 0.133680;
                Obj8.KNDY4__Key_1__c = string.valueof(uomList[10].Id)+string.valueof(uomList[9].Id);//string.valueof(itemList[0].Id) +
                Obj8.KNDY4__Key_2__c = string.valueof(uomList[9].Id)+string.valueof(uomList[10].Id);//string.valueof(itemList[0].Id) +
                //Obj.KNDY4__Conversion_Factor__c = uomcnvs[i];
                uomcList.add(Obj8);

                KNDY4__UOM_Conversion_Details__c ObjA = new KNDY4__UOM_Conversion_Details__c();
                ObjA.Name = ((String)uomList[2].Id).substring(3, 15) + ((String)uomList[9].Id).substring(3, 15);
                ObjA.KNDY4__uom_1__c = uomList[2].Id;
                ObjA.KNDY4__uom_1_Quantity__c =1;
                ObjA.KNDY4__uom_2__c = uomList[9].Id;
                ObjA.KNDY4__uom_2_Quantity__c = 12.0;
                ObjA.KNDY4__Key_1__c = string.valueof(uomList[2].Id)+string.valueof(uomList[9].Id);
                ObjA.KNDY4__Key_2__c = string.valueof(uomList[9].Id)+string.valueof(uomList[2].Id);
                uomcList.add(ObjA);

                KNDY4__UOM_Conversion_Details__c ObjD = new KNDY4__UOM_Conversion_Details__c();
                //YD-FT3
                ObjD.Name = ((String)uomList[5].Id).substring(3, 15) + ((String)uomList[8].Id).substring(3, 15);
                ObjD.KNDY4__uom_1__c = uomList[5].Id;
                ObjD.KNDY4__uom_1_Quantity__c =1;
                ObjD.KNDY4__uom_2__c = uomList[8].Id;
                ObjD.KNDY4__uom_2_Quantity__c = 0.037040;
                ObjD.KNDY4__Key_1__c = string.valueof(uomList[5].Id)+string.valueof(uomList[8].Id);//string.valueof(itemList[0].Id) +
                ObjD.KNDY4__Key_2__c = string.valueof(uomList[8].Id)+string.valueof(uomList[5].Id);//string.valueof(itemList[0].Id) +
                //Obj.KNDY4__Conversion_Factor__c = uomcnvs[i];
                uomcList.add(ObjD);

                //EA2-CS
                uomcList.add(new KNDY4__UOM_Conversion_Details__c(
                        Name = ((String)uomList[11].Id).substring(3, 15) + ((String)uomList[12].Id).substring(3, 15),
                        KNDY4__UOM_1__c = uomList[11].Id,
                        KNDY4__UOM_1_Quantity__c = 2,
                        KNDY4__UOM_2__c = uomList[12].Id,
                        KNDY4__UOM_2_Quantity__c = 1,
                        KNDY4__Key_1__c = '' + uomList[11].Id + uomList[12].Id,
                        KNDY4__Key_2__c = '' + uomList[12].Id + uomList[11].Id
                ));

                //CS-PT
                uomcList.add(new KNDY4__UOM_Conversion_Details__c(
                        Name = ((String)uomList[12].Id).substring(3, 15) + ((String)uomList[13].Id).substring(3, 15),
                        KNDY4__UOM_1__c = uomList[12].Id,
                        KNDY4__UOM_1_Quantity__c = 3,
                        KNDY4__UOM_2__c = uomList[13].Id,
                        KNDY4__UOM_2_Quantity__c = 1,
                        KNDY4__Key_1__c = '' + uomList[12].Id + uomList[13].Id,
                        KNDY4__Key_2__c = '' + uomList[13].Id + uomList[12].Id
                ));

                insert uomcList;
            }
            return uomcList;
        }
        set;
    }

    public KNDY4__Item_Specification__c assembly {
        get {
            if (assembly == null) {
                assembly = new KNDY4__Item_Specification__c(
                        KNDY4__Facility__c = facility2.Id,
                        KNDY4__Item__c  = itemList[0].Id,
                        KNDY4__Start_Date__c = System.today() - 39,
                        KNDY4__Revision__c = 'A1',
                        KNDY4__Company__c = company.Id,
                        KNDY4__Production__c = true,
                        KNDY4__Costing__c = true,
                        KNDY4__Copy_Phantom_Routings__c = false,
                        KNDY4__Packaging_UOM__c = uomList[8].Id,
                        KNDY4__Default_Work_Order_Packaging_UOM__c = uomList[8].Id
                );
                insert assembly;

                System.assert(assemblyRoutings != null);
                System.assert(assemblyComponents != null);
            }
            return assembly;
        }
        set;
    }

    public List<KNDY4__Routing__c> assemblyRoutings {
        get {
            if (assemblyRoutings == null) {
                if (company.KNDY4__Manufacturing_Calendar__c == null) {
                    company.KNDY4__Manufacturing_Calendar__c = manufacturingCalendar.Id;
                    update company;
                }

                assemblyRoutings = new List<KNDY4__Routing__c>();
                for (Integer i=0;i<3;i++) {
                    assemblyRoutings.add(new KNDY4__Routing__c(
                            KNDY4__Assembly_Item_Specification__c = assembly.Id,
                            KNDY4__Company__c = company.Id,
                            KNDY4__Facility__c = facility2.Id,
                            KNDY4__Work_Center_Resource__c = wcResources[i].Id,
                            KNDY4__Work_Center__c = wcResources[i].KNDY4__Work_Center__c,
                            KNDY4__Resource_Sequence__c = i + 1,
                            KNDY4__Resource_Quantity__c = 1,
                            KNDY4__Standard_Hours__c = 1,
                            KNDY4__Fixed_Hours__c = false,
                            KNDY4__Backflush_Resource__c = false
                    ));
                }
                insert assemblyRoutings;
            }
            return assemblyRoutings;
        } set;
    }

    public List<KNDY4__Component__c> assemblyComponents {
        get {

            if (assemblyComponents == null) {
                assemblyComponents = new List<KNDY4__Component__c>();
                for (Integer i=1;i<6;i++) {
                    KNDY4__Component__c component = new KNDY4__Component__c(
                            KNDY4__Component_Item__c = itemList[i].Id,
                            KNDY4__Assembly_Item_Specification__c = assembly.Id,
                            KNDY4__Quantity_per_Assembly__c = 1,
                            KNDY4__Type__c = TYPE_BACKFLUSH,
                            KNDY4__Company__c = company.Id,
                            KNDY4__Component_Sequence__c = i,
                            KNDY4__Yield__c = 100.00
                    );

                    if (i == 1 || i == 2) {
                        component.KNDY4__Routing__c = assemblyRoutings[0].Id;
                    } else if (i == 3 || i == 4) {
                        component.KNDY4__Routing__c = assemblyRoutings[1].Id;

                        if (i == 3) {
                            component.KNDY4__Quantity_per_Assembly__c = 2;
                        }
                    } else if (i == 5) {
                        component.KNDY4__Routing__c = assemblyRoutings[2].Id;
                    }

                    assemblyComponents.add(component);
                }
                insert assemblyComponents;
            }
            return assemblyComponents;
        } set;
    }

    public KNDY4__Item_Specification__c assembly2 {
        get {
            String ITEM_SOURCE_PHANTOM = 'Phantom';

            if (assembly2 == null) {
                itemList[4].KNDY4__Source__c = ITEM_SOURCE_PHANTOM;
                update itemList[4];

                assembly2 = new KNDY4__Item_Specification__c(
                        KNDY4__Facility__c = facility2.Id,
                        KNDY4__Item__c  = itemList[4].Id,
                        KNDY4__Start_Date__c = System.today() - 39,
                        KNDY4__Revision__c = 'A2',
                        KNDY4__Company__c = company.Id,
                        KNDY4__Production__c = true,
                        KNDY4__Costing__c = true,
                        KNDY4__Copy_Phantom_Routings__c = false,
                        KNDY4__Packaging_UOM__c = uomList[8].Id,
                        KNDY4__Default_Work_Order_Packaging_UOM__c = uomList[8].Id
                );
                insert assembly2;

                System.assert(assembly2Routings != null);
                System.assert(assembly2Components != null);
            }
            return assembly2;
        }
        set;
    }

    public List<KNDY4__Routing__c> assembly2Routings {
        get {
            if (assembly2Routings == null) {
                if (company.KNDY4__Manufacturing_Calendar__c == null) {
                    company.KNDY4__Manufacturing_Calendar__c = manufacturingCalendar.Id;
                    update company;
                }

                assembly2Routings = new List<KNDY4__Routing__c>();
                for (Integer i=0;i<3;i++) {
                    assembly2Routings.add(new KNDY4__Routing__c(
                            KNDY4__Assembly_Item_Specification__c = assembly2.Id,
                            KNDY4__Company__c = company.Id,
                            KNDY4__Facility__c = facility2.Id,
                            KNDY4__Work_Center_Resource__c = wcResources[i].Id,
                            KNDY4__Work_Center__c = wcResources[i].KNDY4__Work_Center__c,
                            KNDY4__Resource_Sequence__c = i + 4,
                            KNDY4__Resource_Quantity__c = 1,
                            KNDY4__Standard_Hours__c = 1,
                            KNDY4__Fixed_Hours__c = false,
                            KNDY4__Backflush_Resource__c = false
                    ));
                }
                insert assembly2Routings;
            }
            return assembly2Routings;
        } set;
    }

    public List<KNDY4__Component__c> assembly2Components {
        get {
            string TYPE_BACKFLUSH = 'Backflush';
            string TYPE_KIT = 'Kit';

            if (assembly2Components == null) {
                assembly2Components = new List<KNDY4__Component__c>();
                for (Integer i=6;i<11;i++) {
                    KNDY4__Component__c component = new KNDY4__Component__c(
                            KNDY4__Component_Item__c = itemList[i].Id,
                            KNDY4__Assembly_Item_Specification__c = assembly2.Id,
                            KNDY4__Quantity_per_Assembly__c = 1,
                            KNDY4__Type__c = TYPE_BACKFLUSH,
                            KNDY4__Company__c = company.Id,
                            KNDY4__Component_Sequence__c = i,
                            KNDY4__Yield__c = 100.00
                    );

                    if (i == 6 || i == 7) {
                        component.KNDY4__Routing__c = assembly2Routings[0].Id;

                        if (i == 6) {
                            component.KNDY4__Quantity_per_Assembly__c = 2.5;
                            component.KNDY4__Type__c = TYPE_KIT;
                        }
                    } else if (i == 8 || i == 9) {
                        component.KNDY4__Routing__c = assembly2Routings[1].Id;
                    } else if (i == 10) {
                        component.KNDY4__Routing__c = assembly2Routings[2].Id;
                    }

                    assembly2Components.add(component);
                }
                insert assembly2Components;
            }
            return assembly2Components;
        } set;
    }

    public KNDY4__Work_Order__c phantomWorkOrder  {
        get {
            if (phantomWorkOrder == null) {
                phantomWorkOrder = new KNDY4__Work_Order__c(
                        KNDY4__Company__c = company.Id,
                        KNDY4__Facility__c = facility2.Id,
                        KNDY4__Assembly_Item_Specification__c = assembly.Id,
                        KNDY4__Item__c = assembly.KNDY4__Item__c,
                        KNDY4__Need_Date2__c = System.today() + 30,
                        KNDY4__Start_Date2__c = System.today().addDays(30 - (Integer)itemList[0].KNDY4__Lead_Time__c),
                        KNDY4__Order_Quantity__c = 10,
                        KNDY4__Status__c = 'Draft',
                        KNDY4__Type__c = 'Regular',
                        KNDY4__Complete_To_Location__c = location6.Id,
                        KNDY4__MRB_Location__c = location2.Id,
                        KNDY4__Default_WIP_Location__c = location7.Id,
                        KNDY4__Notes__c = 'phantomworkorder',
                        KNDY4__Currency__c = TestFuel.currencyUSD.Id,
                        KNDY4__Packaging_UOM__c = uomList[8].Id
                );
                insert phantomWorkOrder;
            }
            return phantomWorkOrder;
        } set;
    }

    public List<KNDY4__Item_Cost__c> costList {
        get{
            if(costList == null) {
                //ItemService.allowItemCostUpdate = true;
                costList = new List<KNDY4__Item_Cost__c>();

                List<KNDY4__Item_Cost__c> tempIcList = new List<KNDY4__Item_Cost__c>();

                if (itemList.size() > 0 ) {

                    for(integer i=0;i<11;i++){
                        KNDY4__Item_Cost__c cost = new KNDY4__Item_Cost__c();
                        cost.Name = itemList[i].Name;
                        cost.KNDY4__Item__c = itemList[i].ID;
                        cost.KNDY4__Material_Cost__c = 1 + i;
                        if (i == 0 || i == 5) {
                            cost.KNDY4__Labor_Cost__c = (i+10) * 1.2;
                            cost.KNDY4__Material_Cost__c = (i+10) * 1.77;
                            cost.KNDY4__Start_Date__c = system.now().addDays(-1);
                            cost.KNDY4__Facility__c = facility.Id;
                        }else{
                            cost.KNDY4__Start_Date__c = system.now().addDays(-1);
                        }
                        cost.KNDY4__Status__c = 'Proposed';
                        cost.KNDY4__Company__c = company.Id;
                        costList.add(cost);
                    }

                    for(integer i=0;i<11;i++){
                        KNDY4__Item_Cost__c cost = new KNDY4__Item_Cost__c();
                        cost.Name = itemList[i].Name;
                        cost.KNDY4__Item__c = itemList[i].ID;
                        cost.KNDY4__Material_Cost__c = i *1.25;
                        if (i == 0 || i == 5) {
                            cost.KNDY4__Labor_Cost__c = (i+10) * 1.4;
                            cost.KNDY4__Material_Cost__c = (i+10) * 1.9;
                            cost.KNDY4__Facility__c = facility.Id;
                        }
                        cost.KNDY4__Status__c = 'Planning - 1';
                        cost.KNDY4__Start_Date__c = system.now().addDays(-1);
                        cost.KNDY4__Company__c = company.Id;
                        costList.add(cost);
                    }

                    insert costList;

                    for(KNDY4__Item_Cost__c ic :costList){
                        //Only for Activate Proposed Item Cost/Revaluate Item Cost
                        if(ic.KNDY4__item__c == itemList[2].id || ic.KNDY4__item__c == itemList[3].id){
                            ic.KNDY4__facility__c = facility2.id;
                        }
                        if(ic.KNDY4__Status__c == 'Proposed'){
                            ic.KNDY4__Status__c = 'Approved';
                            //ic.KNDY4__Date_Approved__c = DateTime.now();
                            //ic.KNDY4__On_hand_Revaluation__c = true;
                        }else if(ic.KNDY4__Status__c == 'Planning - 1'){
                            ic.KNDY4__Status__c = 'Proposed';
                            //ic.KNDY4__On_hand_Revaluation__c = false;
                        }
                        tempIcList.add(ic);
                    }

                    update tempIcList;
                }
            }
            return costList;
        }
        set;
    }
    public static final string PAYMENT_TERM_DUE_DAYS = 'Due Days';
    public static final string PAYMENT_TERM_DUE_DAY_OF_MONTH = 'Due Day Of Month';

    public KNDY4__Payment_Term__c terms  {
        get {
            if (terms == null) {
                terms = new KNDY4__Payment_Term__c();
                terms.name = '2/10 Net 30';
                terms.KNDY4__Description__c = '2% discount in 10 days, due 30 days';
                terms.KNDY4__Type__c = PAYMENT_TERM_DUE_DAYS; //AR-3 need to define type on Payment Terms.
                terms.KNDY4__Discount_Days__c = 10;
                terms.KNDY4__Discount_Percent__c = 2;
                terms.KNDY4__Due_Days__c = 30;
                insert terms;
            }
            return terms;
        }
        set;
    }

    public KNDY4__Product__c product  {
        get {
            if (product == null) {
                product = newProduct();
                insert product;
            }
            return product;
        }
        set;
    }
    public KNDY4__Cross_Reference__c crossRef {
        get {
            if(crossRef == null) {
                crossRef = newCrossRef();
                insert crossRef;
            }
            return crossRef;
        }
        set;
    }

    public KNDY4__Product__c product2  {
        get {
            if (product2 == null) {
                product2 = newProduct2();
                insert product2;
            }
            return product2;
        }
        set;
    }

    public KNDY4__Product__c product3  {
        get {
            if (product3 == null) {
                product3 = new KNDY4__Product__c();
                product3.KNDY4__company__c = this.company.id;
                product3.Name =  ' Product-25';
                product3.KNDY4__Item__c  = this.itemList[5].ID;
                product3.KNDY4__Description__c = 'Product-15';
                product3.KNDY4__Selling_UOM__c = uomList[8].Id;
                product3.KNDY4__Weight__c = 5;
                product3.KNDY4__Weight_UOM__c = this.uomList[0].ID;
                product3.KNDY4__UPC_code__c = '234567891235';
                product3.KNDY4__Dimension_UOM__c = this.uomList[6].ID;
                product3.KNDY4__Length__c = 1;
                product3.KNDY4__Width__c = 1;
                product3.KNDY4__Height__c = 1;
                insert product3;
            }
            return product3;
        }
        set;
    }


    public KNDY4__Product__c product_Misc  {
        get {
            if (product_Misc == null) {
                product_Misc = new KNDY4__Product__c();
                product_Misc.KNDY4__company__c = this.company.id;
                product_Misc.Name =  'Product-Misc';
                itemList[11].KNDY4__Source__c = 'Miscellaneous';
                itemList[11].KNDY4__Non_Inventory__c = true;
                update itemList[11];
                product_Misc.KNDY4__Item__c  = this.itemList[11].ID;
                product_Misc.KNDY4__Description__c = 'Product-15';
                product_Misc.KNDY4__Selling_UOM__c = uomList[8].Id;
                product_Misc.KNDY4__Weight__c = 5;
                product_Misc.KNDY4__Weight_UOM__c = this.uomList[0].ID;
                product_Misc.KNDY4__UPC_code__c = '234567891235';
                product_Misc.KNDY4__Dimension_UOM__c = uomList[6].Id;
                product_Misc.KNDY4__Length__c = 1;
                product_Misc.KNDY4__Width__c = 1;
                product_Misc.KNDY4__Height__c = 1;
                insert product_Misc;
            }
            return product_Misc;
        }
        set;
    }
    public KNDY4__Pricebook__c pricebook  {
        get {
            if (pricebook == null) {
                pricebook = new KNDY4__Pricebook__c();
                pricebook.name = this.company.Name +  ' Orange Pricebook';
                pricebook.KNDY4__company__c = this.company.id;
                pricebook.KNDY4__Primary_Key__c = 'NATBOOK';
                pricebook.KNDY4__Currency__c = TestFuel.currencyUSD.id;
                insert pricebook;
                this.pricebook = pricebook;

                KNDY4__Pricebook_Line__c pl =new KNDY4__Pricebook_Line__c();
                pl.KNDY4__product__c = this.product.id;
                pl.KNDY4__pricebook__c = this.pricebook.id;
                pl.KNDY4__price__c = 11.12;
                pl.KNDY4__start_date__c = system.today();
                pl.KNDY4__end_date__c = system.today().addDays(100);

                KNDY4__Pricebook_Line__c pl2 =new KNDY4__Pricebook_Line__c();
                pl2.KNDY4__product__c = this.product2.id;
                pl2.KNDY4__pricebook__c = this.pricebook.id;
                pl2.KNDY4__price__c = 12.11;
                pl2.KNDY4__start_date__c = system.today();
                pl2.KNDY4__end_date__c = system.today().addDays(100);

                KNDY4__Pricebook_Line__c pl3 = new KNDY4__Pricebook_Line__c(
                        KNDY4__Product__c = packageProduct.Id,
                        KNDY4__Pricebook__c = pricebook.Id,
                        KNDY4__Price__c = 0,
                        KNDY4__Start_Date__c = System.today(),
                        KNDY4__End_Date__c = System.today().addDays(100)
                );

                // note product3 is not in any pricebook
                insert new List<KNDY4__Pricebook_Line__c>{ pl, pl2, pl3 };
            }
            return pricebook;
        } set;
    }

    public KNDY4__Customer__c customerParent {
        get {
            if (customerParent == null) {
                system.assert( this.company!=null && this.terms != null && this.account !=null );
                customerParent = new KNDY4__Customer__c();
                customerParent.name = this.company.Name + ' Customer Corp Parent 1';
                customerParent.recordTypeId = this.CustomerRecordTypes.get('Corporate_Parent');
                customerParent.KNDY4__Company__c = this.company.id;
                customerParent.KNDY4__Payment_Term__c = this.terms.ID;
                //customerParent.KNDY4__Address__c = this.account.ID;
                customerParent.KNDY4__Credit_Limit__c = 100000.0;
                customerParent.KNDY4__Customer_Identifier__c = 'CPTEST123';
                customerParent.KNDY4__Record_Type_Name__c = 'Corporate_Parent';
                customerParent.KNDY4__Status__c = 'Approved';
                customerParent.KNDY4__Currency__c = TestFuel.currencyUSD.ID;
                customerParent.KNDY4__Customer_Street__c = '303 Twin Dolphin Drive, Suite 500';
                customerParent.KNDY4__Customer_City__c = 'Redwood City';
                customerParent.KNDY4__Customer_State__c = 'CA';
                customerParent.KNDY4__Customer_Zip_Code__c = '94065';
                customerParent.KNDY4__Customer_Country__c = 'USA';
                customerParent.KNDY4__Track_Install_Base__c = true;

                insert customerParent;
            }
            return customerParent;
        }
        set;
    }

    public KNDY4__Customer__c customerBillTo  {
        get {
            if (customerBillTo == null) {
                system.assert( this.customerParent !=null );
                customerBillTo = new KNDY4__Customer__c();
                customerBillTo.name = 'Customer Bill To 1';
                customerBillTo.recordTypeId = this.CustomerRecordTypes.get('Bill_To');
                customerBillTo.KNDY4__Company__c = this.company.id;
                customerBillTo.KNDY4__Payment_Term__c = this.terms.ID;
                //ustomerBillTo.KNDY4__Address__c = this.account.ID;
                customerBillTo.KNDY4__Credit_Limit__c = 100000.0;
                customerBillTo.KNDY4__Parent_Customer__c = this.customerParent.id;
                customerBillTo.KNDY4__Top_Parent_Customer__c = this.customerParent.id;
                customerBillTo.KNDY4__Customer_Identifier__c = 'BDTEST123';
                customerBillTo.KNDY4__Status__c = 'Approved';
                customerBillTo.KNDY4__Currency__c = TestFuel.currencyUSD.ID;
                customerBillTo.KNDY4__Customer_Street__c = '303 Twin Dolphin Drive, Suite 500';
                customerBillTo.KNDY4__Customer_City__c = 'Redwood City';
                customerBillTo.KNDY4__Customer_State__c = 'CA';
                customerBillTo.KNDY4__Customer_Zip_Code__c = '94065';
                customerBillTo.KNDY4__Customer_Country__c = 'USA';
                customerBillTo.KNDY4__Track_Install_Base__c = true;
                insert customerBillTo;
            }
            return customerBillTo;
        }
        set;
    }

    public KNDY4__Customer__c customerSoldTo  {
        get {
            if (customerSoldTo == null) {
                system.assert( this.customerBillTo !=null );
                customerSoldTo = new KNDY4__Customer__c();
                customerSoldTo.name = 'Customer Sold To 1';
                customerSoldTo.recordTypeId = this.CustomerRecordTypes.get('Sold_To');
                customerSoldTo.KNDY4__Company__c = this.company.id;
                customerSoldTo.KNDY4__Payment_Term__c = this.terms.ID;
                //customerSoldTo.KNDY4__Address__c = this.account.ID;
                customerSoldTo.KNDY4__Credit_Limit__c = 100000.0;
                customerSoldTo.KNDY4__Parent_Customer__c = this.customerBillTo.id;
                customerSoldTo.KNDY4__Customer_Identifier__c = 'SDTEST123';
                customerSoldTo.KNDY4__Record_type_name__c = 'Sold_To';
                customerSoldTo.KNDY4__pricebook__c = this.pricebook.id;
                customerSoldTo.KNDY4__Top_Parent_Customer__c = this.customerParent.id;
                customerSoldTo.KNDY4__Status__c = 'Approved';
                customerSoldTo.KNDY4__Currency__c = TestFuel.currencyUSD.ID;
                customerSoldTo.KNDY4__Customer_Street__c = '303 Twin Dolphin Drive, Suite 500';
                customerSoldTo.KNDY4__Customer_City__c = 'Redwood City';
                customerSoldTo.KNDY4__Customer_State__c = 'CA';
                customerSoldTo.KNDY4__Customer_Zip_Code__c = '94065';
                customerSoldTo.KNDY4__Customer_Country__c = 'USA';
                customerSoldTo.KNDY4__Track_Install_Base__c = true;
                insert customerSoldTo;
            }
            return customerSoldTo;
        }
        set;
    }

    public KNDY4__Customer__c  customerShipTo  {
        get {
            if (customerShipTo == null) {
                customerShipTo = newCustomerShipTo();
                insert customerShipTo;
            }
            return customerShipTo;
        }
        set;
    }

    public KNDY4__Customer__c  customerSite  {
        get {
            if (customerSite == null) {
                customerSite = newCustomerSite();
                insert customerSite;
            }
            return customerSite;
        }
        set;
    }

    public KNDY4__Payment_Profile__c paymentProfile {
        get {
            if(paymentProfile == null) {
                paymentProfile = new KNDY4__Payment_Profile__c();
                paymentProfile.KNDY4__Customer__c = customerParent.Id;
                paymentProfile.KNDY4__Gateway__c = 'Authorize.net';
                paymentProfile.KNDY4__Payment_Profile_ID__c = 'custId123';
                insert paymentProfile;
            }
            return paymentProfile;
        }
        set;
    }

    public KNDY4__Payment_Method__c paymentMethod {
        get {
            if(paymentMethod == null) {
                paymentMethod = new KNDY4__Payment_Method__c();
                paymentMethod.KNDY4__Payment_Profile__c = paymentProfile.Id;
                paymentMethod.KNDY4__Payment_Method_ID__c = 'abc123';
                insert paymentMethod;
            }
            return paymentMethod;

        }
        set;
    }

    public KNDY4__Facility__c facility {
        get {
            if (facility == null) {
                facility = new KNDY4__Facility__c(
                        Name = company.Name + ' Facility-1',
                        KNDY4__Company__c = company.Id,
                        KNDY4__Primary_Key__c = 'FA01',
                        KNDY4__Description__c = 'Facility-1'
                );
                insert facility;
            }
            return facility;
        }
        set;
    }

    public KNDY4__Facility__c facility2 {
        get {
            if (facility2 == null) {
                facility2 = new KNDY4__Facility__c(
                        Name = company.Name + ' Facility-2',
                        KNDY4__Company__c = company.Id,
                        KNDY4__Address__c = account.Id,
                        KNDY4__Primary_Key__c = 'FA02',
//					KNDY4__Shipping_Calendar__c = [select Id from BusinessHours where isDefault = true limit 1].Id, // used for calculating EST SHIP DATE but default calendar has availability of 24/7 7 days a week so next available day has little meaning. All this does is needlessly add two queries (at least)
                        KNDY4__Description__c = 'Facility-2'
                );
                insert facility2;
            }
            return facility2;
        }
        set;
    }

    public KNDY4__Location__c location {
        get {
            if (location == null) {
                location = new KNDY4__Location__c(
                        KNDY4__Facility__c = facility.id,
                        KNDY4__Description__c = 'location',
                        name = 'Delivery/Shipping Location'  );
                insert location;
            }
            return location;
        }
        set;
    }

    public KNDY4__Location__c location2 {
        get {
            if (location2 == null) {
                location2 = new KNDY4__Location__c(
                        KNDY4__Facility__c = facility2.id,
                        KNDY4__Description__c = 'location2',
                        name = 'Delivery/Shipping/scrap Location'  );
                insert location2;
            }
            return location2;
        }
        set;
    }

    public KNDY4__Location__c location3 {
        get {
            if (location3 == null) {
                location3 = new KNDY4__Location__c(
                        KNDY4__Facility__c = facility2.id,
                        KNDY4__Description__c = 'location3',
                        name = 'Stock'  );
                insert location3;
            }
            return location3;
        }
        set;
    }

    public KNDY4__Location__c location4 {
        get {
            if (location4 == null) {
                location4= new KNDY4__Location__c(
                        KNDY4__Facility__c = facility.id,
                        KNDY4__Description__c = 'location4',
                        name = 'Stock'  );
                insert location4;
            }
            return location4;
        }
        set;
    }

    public KNDY4__Location__c location5 {
        get {
            if (location5 == null) {
                location5 = new KNDY4__Location__c(
                        KNDY4__Facility__c = facility2.id,
                        KNDY4__Description__c = 'location5',
                        name = 'Stock Location2'  );
                insert location5;
            }
            return location5;
        }
        set;
    }

    public KNDY4__Location__c location6 {
        get {
            if (location6 == null) {
                location6 = new KNDY4__Location__c(
                        KNDY4__Facility__c = facility2.id,
                        KNDY4__Description__c = 'location6',
                        name = 'Finished Goods'  );
                insert location6;
            }
            return location6;
        }
        set;
    }

    public KNDY4__Location__c location7 {
        get {
            if (location7 == null) {
                location7 = new KNDY4__Location__c(
                        KNDY4__Facility__c = facility2.id,
                        KNDY4__Description__c = 'location7',
                        name = 'WIP Location'  );
                insert location7;
            }
            return location7;
        }
        set;
    }

    public KNDY4__Bin__c bin {
        get {
            List<KNDY4__Configuration__c> configList = new List<KNDY4__Configuration__c>();
            List<sObjectType> skipTriggers = new List<sObjectType>{KNDY4__Location__c.sObjectType};

            for (sObjectType s:skipTriggers) {
                configList.add(new KNDY4__Configuration__c(Name = s.getDescribe().getLocalName() + '-' + s.getDescribe().getKeyPrefix(),KNDY4__Value__c = UserInfo.getUserId()));
            }
            insert configList;
            update new KNDY4__Location__c(Id = location3.Id, KNDY4__Bin_Tracked__c = true,KNDY4__Mixed_Bins_Allowed__c = true);
            delete configList;
            if (bin == null) {
                bin = new KNDY4__Bin__c(
                        Name = 'Stock-Bin-1',
                        KNDY4__Description__c = 'bin',
                        KNDY4__Location__c = location3.id
                );
                insert bin;
            }
            return bin;
        }
        set;
    }

    public KNDY4__GL_Type__c currentAssets{
        get{
            if(currentAssets == null){
                if(mGLTypes.size() != 0 && mGLTypes.containsKey('Current Assets')){
                    currentAssets = mGLTypes.get('Current Assets');
                }

            }
            return currentAssets;
        }
        set;
    }

    public KNDY4__GL_Type__c longTermAssets{
        get{
            if(longTermAssets == null){
                if(mGLTypes.size() != 0 && mGLTypes.containsKey('Long Term Assets')){
                    longTermAssets = mGLTypes.get('Long Term Assets');
                }
            }
            return longTermAssets;
        }
        set;
    }

    public KNDY4__GL_Type__c currentLiabilities{
        get{
            if(currentLiabilities == null){
                if(mGLTypes.size() != 0 && mGLTypes.containsKey('Current Liabilities')){
                    currentLiabilities = mGLTypes.get('Current Liabilities');
                }
            }
            return currentLiabilities;
        }
        set;
    }

    public KNDY4__GL_Type__c longTermLiabilities{
        get{
            if(longTermLiabilities == null){
                if(mGLTypes.size() != 0 && mGLTypes.containsKey('Long Term Liabilities')){
                    longTermLiabilities = mGLTypes.get('Long Term Liabilities');
                }
            }
            return longTermLiabilities;
        }
        set;
    }

    public KNDY4__GL_Type__c equity{
        get{
            if(equity == null){
                if(mGLTypes.size() != 0 && mGLTypes.containsKey('Equity')){
                    equity = mGLTypes.get('Equity');
                }
            }
            return equity;
        }
        set;
    }

    public KNDY4__GL_Type__c revenue{
        get{
            if(revenue == null){
                if(mGLTypes.size() != 0 && mGLTypes.containsKey('Revenue')){
                    revenue = mGLTypes.get('Revenue');
                }
            }
            return revenue;
        }
        set;
    }

    public KNDY4__GL_Type__c costOfGoodsSold{
        get{
            if(costOfGoodsSold == null){
                if(mGLTypes.size() != 0 && mGLTypes.containsKey('Cost of Goods Sold')){
                    costOfGoodsSold = mGLTypes.get('Cost of Goods Sold');
                }
            }
            return costOfGoodsSold;
        }
        set;
    }

    public KNDY4__GL_Type__c expense{
        get{
            if(expense == null){
                if(mGLTypes.size() != 0 && mGLTypes.containsKey('Expense')){
                    expense = mGLTypes.get('Expense');
                }
            }
            return expense;
        }
        set;
    }

    public KNDY4__GL_Type__c operatingExpense{
        get{
            if(operatingExpense == null){
                if(mGLTypes.size() != 0 && mGLTypes.containsKey('Operating Expense')){
                    operatingExpense = mGLTypes.get('Operating Expense');
                }
            }
            return operatingExpense;
        }
        set;
    }

    public KNDY4__GL_Type__c otherIncome_Expense{
        get{
            if(otherIncome_Expense == null){
                if(mGLTypes.size() != 0 && mGLTypes.containsKey('Other Income')){
                    otherIncome_Expense = mGLTypes.get('Other Income');
                }
            }
            return otherIncome_Expense;
        }
        set;
    }

    public KNDY4__GL_Account__c taxGL {
        get {
            if ( taxGL == null && mGLAccounts.containsKey('24000')) {
                taxGL = mGLAccounts.get('24000');
            }
            return taxGL;
        }
        set;
    }

    public KNDY4__GL_Account__c rfxGL{
        get{
            if(rfxGL == null && mGLAccounts.containsKey('79500')){
                rfxGL = mGLAccounts.get('79500');
            }
            return rfxGL;
        }
        set;
    }

    public KNDY4__GL_Account__c intercompanyInvestmentGL {
        get {
            if ( intercompanyInvestmentGL == null && mGLAccounts.containsKey('14100')) {
                intercompanyInvestmentGL = mGLAccounts.get('14100');
            }
            return intercompanyInvestmentGL;
        }
        set;
    }

    public KNDY4__GL_Account__c intercompanyAPGL {
        get {
            if ( intercompanyAPGL == null && mGLAccounts.containsKey('21500')) {
                intercompanyAPGL = mGLAccounts.get('21500');
            }
            return taxGL;
        }
        set;
    }

    public KNDY4__GL_Account__c intercompanyARGL {
        get {
            if ( intercompanyARGL == null && mGLAccounts.containsKey('11500')) {
                intercompanyARGL = mGLAccounts.get('11500');
            }
            return intercompanyARGL;
        }
        set;
    }

    public KNDY4__GL_Account__c intercompanyAPICGL {
        get {
            if ( intercompanyAPICGL == null && mGLAccounts.containsKey('29000')) {
                intercompanyAPICGL = mGLAccounts.get('29000');
            }
            return intercompanyAPICGL;
        }
        set;
    }

    public KNDY4__GL_Account__c cashCompanyAGL {
        get {
            if ( cashCompanyAGL == null && mGLAccounts.containsKey('12200')) {
                cashCompanyAGL = mGLAccounts.get('12200');
            }
            return cashCompanyAGL;
        }
        set;
    }

    public KNDY4__GL_Account__c cashCompanyBGL {
        get {
            if ( cashCompanyBGL == null && mGLAccounts.containsKey('12300')) {
                cashCompanyBGL = mGLAccounts.get('12300');
            }
            return cashCompanyBGL;
        }
        set;
    }

    public KNDY4__GL_Account__c UnappliedCashGL {
        get {
            if ( UnappliedCashGL == null && mGLAccounts.containsKey('12100')) {
                UnappliedCashGL = mGLAccounts.get('12100');
            }
            return UnappliedCashGL;
        }
        set;
    }

    public KNDY4__GL_Account__c IntercompanyUnappliedCashGL {
        get {
            if ( IntercompanyUnappliedCashGL == null && mGLAccounts.containsKey('12400')) {
                IntercompanyUnappliedCashGL = mGLAccounts.get('12400');
            }
            return IntercompanyUnappliedCashGL;
        }
        set;
    }

    public KNDY4__GL_Account__c overPaymentGL {
        get {
            if ( overPaymentGL == null && mGLAccounts.containsKey('24100')) {
                overPaymentGL = mGLAccounts.get('24100');
            }
            return overPaymentGL;
        }
        set;
    }

    public KNDY4__GL_Account__c allowanceExpGL {
        get {
            if ( allowanceExpGL == null && mGLAccounts.containsKey('65000')) {
                allowanceExpGL = mGLAccounts.get('65000');
            }
            return allowanceExpGL;
        }
        set;
    }

    public KNDY4__GL_Account__c cashGL {
        get {
            if ( cashGL == null && mGLAccounts.containsKey('12000')) {
                cashGL = mGLAccounts.get('12000');
            }
            return cashGL;
        }
        set;
    }
    public KNDY4__GL_Account__c PPVGL {
        get {
            if ( PPVGL == null && mGLAccounts.containsKey('59000')) {
                PPVGL = mGLAccounts.get('59000');
            }
            return PPVGL;
        }
        set;
    }

    public KNDY4__GL_Account__c IPVGL {
        get {
            if ( IPVGL == null && mGLAccounts.containsKey('59100')) {
                IPVGL = mGLAccounts.get('59100');
            }
            return IPVGL;
        }
        set;
    }

    public KNDY4__GL_Account__c propertyGL {
        get {
            if ( propertyGL == null && mGLAccounts.containsKey('17000')) {
                propertyGL = mGLAccounts.get('17000');
            }
            return propertyGL;
        }
        set;
    }

    public KNDY4__GL_Account__c FGInventoryGL{

        get{
            if ( FGInventoryGL == null && mGLAccounts.containsKey('15000')) {
                FGInventoryGL = mGLAccounts.get('15000');
            }
            return FGInventoryGL;
        }
        set;
    }

    public KNDY4__GL_Account__c receivablesGL {
        get {
            if ( receivablesGL == null && mGLAccounts.containsKey('11000')) {
                receivablesGL = mGLAccounts.get('11000');
            }
            return receivablesGL;
        }
        set;
    }

    public KNDY4__GL_Account__c payablesGL {
        get {
            if ( payablesGL == null && mGLAccounts.containsKey('21000')) {
                payablesGL = mGLAccounts.get('21000');
            }
            return payablesGL;
        }
        set;
    }

    public KNDY4__GL_Account__c GRNIGL {
        get {
            if ( GRNIGL == null && mGLAccounts.containsKey('23000')) {
                GRNIGL = mGLAccounts.get('23000');
            }
            return GRNIGL;
        }
        set;
    }

    public KNDY4__GL_Account__c expenseGL {
        get {
            if ( expenseGL == null && mGLAccounts.containsKey('55100')) {
                expenseGL = mGLAccounts.get('55100');
            }
            return expenseGL;
        }
        set;
    }

    public KNDY4__GL_Account__c revenueGL {
        get {
            if ( revenueGL == null && mGLAccounts.containsKey('42000')) {
                revenueGL = mGLAccounts.get('42000');
            }
            return revenueGL;
        }
        set;
    }

    public KNDY4__GL_Account__c retainedEarningsGL {
        get {
            if ( retainedEarningsGL == null && mGLAccounts.containsKey('39000')) {
                retainedEarningsGL = mGLAccounts.get('39000');
            }
            return retainedEarningsGL;
        }
        set;
    }

    public KNDY4__GL_Account__c cogsGL {
        get {
            if ( cogsGL == null && mGLAccounts.containsKey('50000')) {
                cogsGL = mGLAccounts.get('50000');
            }
            return cogsGL;
        }
        set;
    }


    public KNDY4__Bank_Account__c bankAccount {
        get {
            if (bankAccount == null) {
                bankAccount = new KNDY4__Bank_Account__c(
                        Name = 'Test BOFA',
                        KNDY4__account_type__c = 'Checking',
                        KNDY4__GL_Account__c = cashGL.id,
                        KNDY4__Company__c = company.Id,
                        KNDY4__Active__c = true,
                        //KNDY4__Bank_Account_Number_2__c = '12345',
                        KNDY4__Currency__c = TestFuel.currencyUSD.id
                );
                insert bankAccount;
                company.KNDY4__Credit_Card_Bank_Account__c = bankAccount.Id;
                update company;
            }
            return bankAccount;
        }
        set;
    }

    public KNDY4__FOB_Terms__c fobTerm {
        get {
            if ( fobTerm == null  ) {
                fobTerm = new KNDY4__FOB_Terms__c(
                        Name = 'test term destination',
                        KNDY4__FOB_Point__c = 'Destination'
                );
                insert fobTerm;

            }

            return fobTerm;
        }
        set;
    }

    public KNDY4__Supplier__c remitToSupplier {
        get {
            if ( remittosupplier == null ) {
                remittosupplier = new KNDY4__Supplier__c();
                remittosupplier.Name = company.Name + ' Supplier-1';
                remittosupplier.KNDY4__Company__c = company.ID;
                remittosupplier.KNDY4__Tax_ID__c = 'tax ID';
                remittosupplier.KNDY4__Address__c = account.ID;  // remittoaccount ?? TODO
                remittosupplier.KNDY4__Status__c = 'Active';
                remittosupplier.KNDY4__Payment_Term__c = terms.ID;
                remittosupplier.KNDY4__Always_Take_Discount__c = false;
                remittosupplier.KNDY4__Type__c = 'Remit-To';
                remitToSupplier.RecordTypeId = SupplierRecordTypes.get('Remit_To');
                remitToSupplier.KNDY4__Alternate_Name__c = 'Remit to Supplier';
                insert remittosupplier;
            }
            return remittosupplier;
        }
        set;
    }

    public KNDY4__Supplier__c supplier {
        get {
            if ( supplier == null ) {
                supplier = new KNDY4__Supplier__c();
                supplier.Name = company.Name + ' Supplier-1';
                supplier.KNDY4__Company__c = company.ID;
                supplier.KNDY4__Tax_ID__c = 'tax ID';
                supplier.KNDY4__Address__c = account.ID;  // remittoaccount ?? TODO
                supplier.KNDY4__Status__c = 'Active';
                //supplier.KNDY4__Payment_Term__c = terms.ID;
                supplier.KNDY4__FOB_Term__c = fobTerm.id;
                supplier.KNDY4__Type__c = 'Purchasing';
                supplier.RecordTypeId = SupplierRecordTypes.get('Purchase_From');
                supplier.KNDY4__Remit_To__c =  remittosupplier.id;
                supplier.KNDY4__Default_Receiving_Tolerance__c = 3;
                supplier.KNDY4__Create_RTV_Credit_Memo__c = true;
                supplier.KNDY4__Create_RTV_PO__c = true;
                supplier.KNDY4__Alternate_Name__c = 'Test Supplier';
                insert supplier;
            }
            return supplier;
        }
        set;
    }

    public KNDY4__Hierarchy__c hierarchy1 {
        get {
            if (hierarchy1 == null  ) {
                hierarchy1 = new KNDY4__Hierarchy__c(
                        KNDY4__Code__c = 'H1111' ,
                        KNDY4__Primary_Key__c = 'H1111' ,
                        KNDY4__Type__c = 'Product Hierarchy'
                );
                insert hierarchy1;
            }
            return hierarchy1;
        }
        set;
    }

    public KNDY4__Product_Group__c productGroup {
        get {
            if ( productGroup == null  ) {
                productGroup = new KNDY4__Product_Group__c(
                        name ='foo',
                        KNDY4__Primary_Key__c = 'PG23',
                        KNDY4__Hierarchy_Code__c = 'H1111'
                );
                insert productGroup;
            }
            return productGroup;
        }
        set;
    }

    public List<KNDY4__SKID__c> skids {
        get {
            String SKID_TYPE_LOCATION = 'Location' ;


        if (skids == null) {
                skids = new List<KNDY4__SKID__c>();
                for (KNDY4__Item__c item : this.itemList) {
                    KNDY4__SKID__c skid = new KNDY4__SKID__c();
                    skid.KNDY4__location__c = this.location3.id;
                    skid.KNDY4__Facility2__c = this.facility2.Id;
                    skid.KNDY4__Company__c= this.company.id;
                    skid.KNDY4__Quantity__c = 200.0;
                    skid.KNDY4__Item__c= item.Id;
                    skid.KNDY4__Type__c = SKID_TYPE_LOCATION;
                    skid.KNDY4__Quantity_Stocking_UOM__c = 100;
                    skid.KNDY4__Stocking_UOM__c = item.KNDY4__Stocking_UOM__c;
                    skid.KNDY4__Packaging_UOM__c = item.KNDY4__Stocking_UOM__c;
                    skid.KNDY4__Packaging_UOM__r = uomList[8];
                    skid.KNDY4__Container_Item__c = item.id;
                    skid.KNDY4__Expiration_Date__c = System.today() + 365;

                    KNDY4__SKID__c skid1 = skid.clone(false,false);
                    skid1.KNDY4__location__c = this.location5.id;

                    skids.add(skid);
                    skids.add(skid1);
                }
                insert skids;
            }
            return skids;
        }
        set;
    }

    public KNDY4__Sales_Order__c salesOrder {
        get {
            if ( salesOrder == null  ) {
                salesOrder = newSalesOrder();
                salesOrder.KNDY4__Ship_to__c = customerShipTo.Id;
                salesOrder.KNDY4__Bill_To__c = customerBillTo.Id;
                salesOrder.KNDY4__Currency__c = TestFuel.currencyUSD.id;
                salesOrder.KNDY4__Original_Sales_Order__c = 'so123';
                insert salesOrder;
                insert salesOrderLines;
            }
            return salesOrder;
        }
        set;
    }

    public List<KNDY4__Sales_Order_Line__c> salesOrderLines {
        get{
            if(salesOrderLines == null){
                salesOrderLines = new List<KNDY4__Sales_Order_Line__c>();

                KNDY4__Sales_Order_Line__c salesOrderLine = new KNDY4__Sales_Order_Line__c();
                salesOrderLine.KNDY4__Company__c = company.Id;
                salesOrderLine.KNDY4__Description__c = product.KNDY4__Description__c;
                salesOrderLine.KNDY4__Discount_Percent__c = 2;
                salesOrderLine.KNDY4__Product__c = product.Id;
                salesOrderLine.KNDY4__Product_Reference__c = crossRef.id;
                salesOrderLine.KNDY4__Quantity_Ordered__c = 100;
                salesOrderLine.KNDY4__Required_Date__c = System.today()+5;
                salesOrderLine.KNDY4__Sales_Order__c = salesOrder.Id;
                salesOrderLine.KNDY4__Ship_From_Location__c = location2.Id;
                salesOrderLine.KNDY4__Unit_Price__c = 11.12;
                salesOrderLine.KNDY4__Memo__c = 'salesOrderLine';
                SalesOrderLine.KNDY4__Selling_UOM__c = uomList[8].id;
                SalesOrderLine.KNDY4__Packaging_UOM__c = uomList[8].id;
                SalesOrderLine.KNDY4__Line__c = 1;
                salesOrderLines.add(salesOrderLine);

                KNDY4__Sales_Order_Line__c salesOrderLine2 = new KNDY4__Sales_Order_Line__c();
                salesOrderLine2.KNDY4__Company__c = company.id;
                salesOrderLine2.KNDY4__Description__c = product2.KNDY4__Description__c;
                salesOrderLine2.KNDY4__Discount_Percent__c = 2;
                salesOrderLine2.KNDY4__Product__c = product2.Id;
                salesOrderLine2.KNDY4__Quantity_Ordered__c = 15;
                salesOrderLine2.KNDY4__Required_Date__c = System.today()+15;
                salesOrderLine2.KNDY4__Sales_Order__c = salesOrder.Id;
                salesOrderLine2.KNDY4__Ship_From_Location__c = location2.Id;
                SalesOrderLine2.KNDY4__Selling_UOM__c = uomList[8].id;
                SalesOrderLine2.KNDY4__Packaging_UOM__c = uomList[8].id;
                salesOrderLine2.KNDY4__Unit_Price__c = 12.11;
                salesOrderLine2.KNDY4__Sales_Tax__c = 14.686403;
                salesOrderLine2.KNDY4__Memo__c = 'salesOrderLine2';
                SalesOrderLine2.KNDY4__Line__c = 2;
                salesOrderLines.add(salesOrderLine2);
            }
            return salesOrderLines;
        }
        set;
    }

    public KNDY4__Sales_Order__c salesOrder1 {
        get {
            if ( salesOrder1 == null  ) {
                salesOrder1 = new KNDY4__Sales_Order__c();
                salesOrder1.KNDY4__Customer__c=customerSoldTo.id;
                salesOrder1.KNDY4__Currency__c = TestFuel.currencyUSD.id ;
                salesOrder1.KNDY4__Status__c='Open';
                salesOrder1.KNDY4__Type__c = 'Standard';
                salesOrder1.KNDY4__Payment_Term__c = terms.id;
                salesOrder1.KNDY4__Company__c = company.id;
                salesOrder1.KNDY4__Ship_Complete__c = true;
                salesOrder1.KNDY4__Weight_UOM__c = uomList[0].ID;
                salesOrder1.KNDY4__Dimension_UOM__c = uomList[5].ID;
                salesOrder1.KNDY4__Original_Sales_Order__c = 'salesOrder1';
                insert salesOrder1;
                insert salesOrder1Lines;
            }
            return salesOrder1;
        }
        set;
    }

    public List<KNDY4__Sales_Order_Line__c> salesOrder1Lines {
        get{
            if(salesOrder1Lines == null){
                salesOrder1Lines = new List<KNDY4__Sales_Order_Line__c>();

                KNDY4__Sales_Order_Line__c salesOrderLineObj1 = new KNDY4__Sales_Order_Line__c();
                salesOrderLineObj1.KNDY4__Sales_Order__c=salesOrder1.Id;
                salesOrderLineObj1.KNDY4__Quantity_Ordered__c =12;
                salesOrderLineObj1.KNDY4__Unit_Price__c = 480;
                salesOrderLineObj1.KNDY4__Required_Date__c=System.today()+5;
                salesOrderLineObj1.KNDY4__Status__c='Open';
                salesOrderLineObj1.KNDY4__Company__c = company.id;
                salesOrderLineObj1.KNDY4__Product__c = product.id;
                salesOrderLineObj1.KNDY4__Ship_From_Location__c = location.id;
                salesOrderLineObj1.KNDY4__Line_Type__c = 'Standard';
                salesOrderLineObj1.KNDY4__Weight_UOM__c = uomList[0].ID;
                salesOrderLineObj1.KNDY4__Dimension_UOM__c = uomList[5].ID;
                salesOrder1Lines.add(salesOrderLineObj1);

                KNDY4__Sales_Order_Line__c salesOrderLineObj2 = new KNDY4__Sales_Order_Line__c();
                salesOrderLineObj2.KNDY4__Sales_Order__c=salesOrder1.Id;
                salesOrderLineObj2.KNDY4__Quantity_Ordered__c =5;
                salesOrderLineObj2.KNDY4__Unit_Price__c = 480;
                salesOrderLineObj2.KNDY4__Required_Date__c=System.today()+30;
                salesOrderLineObj2.KNDY4__Status__c='Open';
                salesOrderLineObj2.KNDY4__Company__c = company.id;
                salesOrderLineObj2.KNDY4__Product__c = product.id;
                salesOrderLineObj2.KNDY4__Ship_From_Location__c = location.id;
                salesOrderLineObj2.KNDY4__Line_Type__c = 'Standard';
                salesOrderLineObj2.KNDY4__Weight_UOM__c = uomList[0].ID;
                salesOrderLineObj2.KNDY4__Dimension_UOM__c = uomList[5].ID;
                salesOrder1Lines.add(salesOrderLineObj2);
            }
            return salesOrder1Lines;
        }
        set;
    }

    public KNDY4__Sales_Order__c salesOrder2 {
        get {
            if ( salesOrder2 == null  ) {
                salesOrder2 = new KNDY4__Sales_Order__c();
                salesOrder2.KNDY4__Customer__c = customerSoldTo.id;
                salesOrder2.KNDY4__Currency__c = TestFuel.currencyUSD.id ;
                salesOrder2.KNDY4__Status__c='Open';
                salesOrder2.KNDY4__Type__c = 'Special';
                salesOrder2.KNDY4__Payment_Term__c = terms.id;
                salesOrder2.KNDY4__company__c = company.id;
                salesOrder2.KNDY4__Weight_UOM__c = uomList[0].ID;
                salesOrder2.KNDY4__Dimension_UOM__c = uomList[5].ID;
                salesOrder2.KNDY4__Original_Sales_Order__c = 'salesOrder2';
                insert salesOrder2;
                insert salesOrder2Lines;
            }
            return salesOrder2;
        }
        set;
    }

    public List<KNDY4__Sales_Order_Line__c> salesOrder2Lines {
        get{
            if(salesOrder2Lines == null){
                salesOrder2Lines = new List<KNDY4__Sales_Order_Line__c>();

                KNDY4__Sales_Order_Line__c salesOrderLineObj3 = new KNDY4__Sales_Order_Line__c();
                salesOrderLineObj3.KNDY4__Sales_Order__c=salesOrder2.Id;
                salesOrderLineObj3.KNDY4__Quantity_Ordered__c =3;
                salesOrderLineObj3.KNDY4__Unit_Price__c = 480;
                salesOrderLineObj3.KNDY4__Required_Date__c=System.today()+5;
                salesOrderLineObj3.KNDY4__Status__c='Open';
                salesOrderLineObj3.KNDY4__Company__c = company.id;
                salesOrderLineObj3.KNDY4__Product__c = product.id;
                salesOrderLineObj3.KNDY4__Ship_From_Location__c = location.id;
                salesOrderLineObj3.KNDY4__Line_Type__c = 'Standard';
                salesOrderLineObj3.KNDY4__Weight_UOM__c = uomList[0].ID;
                salesOrderLineObj3.KNDY4__Dimension_UOM__c = uomList[5].ID;

                salesOrder2Lines.add(salesOrderLineObj3);

                KNDY4__Sales_Order_Line__c salesOrderLineObj4 = new KNDY4__Sales_Order_Line__c();
                salesOrderLineObj4.KNDY4__Sales_Order__c=salesOrder2.Id;
                salesOrderLineObj4.KNDY4__Quantity_Ordered__c =3;
                salesOrderLineObj4.KNDY4__Unit_Price__c = 480;
                salesOrderLineObj4.KNDY4__Required_Date__c=System.today()+5;
                salesOrderLineObj4.KNDY4__Status__c='Open';
                salesOrderLineObj4.KNDY4__Company__c = company.id;
                salesOrderLineObj4.KNDY4__Product__c = product.id;
                salesOrderLineObj4.KNDY4__Ship_From_Location__c = location.id;
                salesOrderLineObj4.KNDY4__Line_Type__c = 'Distribution Sample';
                salesOrderLineObj4.KNDY4__Weight_UOM__c = uomList[0].ID;
                salesOrderLineObj4.KNDY4__Dimension_UOM__c = uomList[5].ID;
                salesOrder2Lines.add(salesOrderLineObj4);
            }
            return salesOrder2Lines;
        }
        set;
    }


    public KNDY4__Sales_Order__c salesOrder3 {
        get {
            if ( salesOrder3 == null  ) {
                salesOrder3 = new KNDY4__Sales_Order__c();
                salesOrder3.KNDY4__Customer__c = customerSoldTo.id;
                salesOrder3.KNDY4__Currency__c = TestFuel.currencyUSD.id ;
                salesOrder3.KNDY4__Status__c='Open';
                salesOrder3.KNDY4__Type__c = 'Adjustment';
                salesOrder3.KNDY4__Payment_Term__c = terms.id;
                salesOrder3.KNDY4__company__c = company.id;
                salesOrder3.KNDY4__Weight_UOM__c = uomList[0].ID;
                salesOrder3.KNDY4__Dimension_UOM__c = uomList[5].ID;
                salesOrder3.KNDY4__Original_Sales_Order__c = 'salesOrder3';
                insert salesOrder3;
                insert salesOrder3Lines;
            }
            return salesOrder3;
        }
        set;
    }

    public List<KNDY4__Sales_Order_Line__c> salesOrder3Lines {
        get{
            if(salesOrder3Lines == null){
                salesOrder3Lines = new List<KNDY4__Sales_Order_Line__c>();

                KNDY4__Sales_Order_Line__c salesOrderLineObj31 = new KNDY4__Sales_Order_Line__c();
                salesOrderLineObj31.KNDY4__Sales_Order__c=salesOrder3.Id;
                salesOrderLineObj31.KNDY4__Quantity_Ordered__c =-2;
                salesOrderLineObj31.KNDY4__Unit_Price__c = 40;
                salesOrderLineObj31.KNDY4__Required_Date__c=System.today()+5;
                salesOrderLineObj31.KNDY4__Status__c='Open';
                salesOrderLineObj31.KNDY4__Company__c = company.id;
                salesOrderLineObj31.KNDY4__Product__c = product.id;
                salesOrderLineObj31.KNDY4__Ship_From_Location__c = location.id;
                salesOrderLineObj31.KNDY4__Weight_UOM__c = uomList[0].ID;
                salesOrderLineObj31.KNDY4__Dimension_UOM__c = uomList[5].ID;

                salesOrder3Lines.add(salesOrderLineObj31);
            }
            return salesOrder3Lines;
        }
        set;
    }

    public KNDY4__Receiving_Document__c receivingDocumentASN {
        get {
            if ( receivingDocumentASN == null  ) {
                receivingDocumentASN = newreceivingDocumentASN();

                insert receivingDocumentASN;
                insert receivingDocumentASNLines;
            }
            return receivingDocumentASN;
        }
        set;
    }

    public List<KNDY4__Receipt_Line__c> receivingDocumentASNLines {
        get{
            if(receivingDocumentASNLines == null){
                receivingDocumentASNLines = new List<KNDY4__Receipt_Line__c>();

                KNDY4__Receipt_Line__c receivingDocumentASNLine = new KNDY4__Receipt_Line__c();
                receivingDocumentASNLine.KNDY4__Company__c = company.Id;
                receivingDocumentASNLine.KNDY4__Purchase_Order__c = purchaseOrder.Id;
                receivingDocumentASNLine.KNDY4__Purchase_Order_Line__c = purchaseOrderLines[0].Id;
                receivingDocumentASNLine.KNDY4__Item__c = purchaseOrderLines[0].KNDY4__Item__c;
                receivingDocumentASNLine.KNDY4__Quantity_Declared__c = 5;
                receivingDocumentASNLine.KNDY4__Expiration_Date__c = System.today()+5;
                receivingDocumentASNLine.KNDY4__Lot_Number__c = '1234';
                receivingDocumentASNLine.KNDY4__Status__c = 'Draft';
                receivingDocumentASNLine.KNDY4__Supplier__c = supplier.id;
                receivingDocumentASNLine.KNDY4__Receiving_Document__c = receivingDocumentASN.id;
                receivingDocumentASNLines.add(receivingDocumentASNLine);

            }
            return receivingDocumentASNLines;
        }
        set;
    }

    public KNDY4__Receiving_Document__c receivingDocumentMisc {
        get {
            if ( receivingDocumentMisc == null  ) {
                receivingDocumentMisc = newreceivingDocumentASN();
                receivingDocumentMisc.KNDY4__Type__c = 'Miscellaneous Receipt';

                insert receivingDocumentMisc;
                insert receivingDocumentMiscLines;
            }
            return receivingDocumentMisc;
        }
        set;
    }

    public List<KNDY4__Receipt_Line__c> receivingDocumentMiscLines {
        get{
            if(receivingDocumentMiscLines == null){
                receivingDocumentMiscLines = new List<KNDY4__Receipt_Line__c>();

                KNDY4__Receipt_Line__c receivingDocumentMiscLine = new KNDY4__Receipt_Line__c();
                receivingDocumentMiscLine.KNDY4__Company__c = company.Id;
                receivingDocumentMiscLine.KNDY4__Item__c = itemList[0].Id;
                receivingDocumentMiscLine.KNDY4__Quantity_Declared__c = 5;
                receivingDocumentMiscLine.KNDY4__Status__c = 'Draft';
                receivingDocumentMiscLine.KNDY4__Receiving_Document__c = receivingDocumentMisc.id;
                receivingDocumentMiscLines.add(receivingDocumentMiscLine);

            }
            return receivingDocumentMiscLines;
        }
        set;
    }

    public List<KNDY4__Stock_Movement_Rule__c> stockMovementRuleList {
        get{
            if(stockMovementRuleList == null){
                stockMovementRuleList = new List<KNDY4__Stock_Movement_Rule__c>();

                KNDY4__Stock_Movement_Rule__c stockMovement1 = new KNDY4__Stock_Movement_Rule__c();
                stockMovement1.Name = 'Putaway rule1';
                stockMovement1.KNDY4__Rule_Type__c = 'Putaway';
                stockMovement1.KNDY4__Company__c = company.id;
                stockMovement1.KNDY4__Facility__c = facility2.id;
                stockMovement1.KNDY4__Class__c = clsObj.id;
                stockMovement1.KNDY4__Item__c = null;
                stockMovement1.KNDY4__Customer__c = null;
                stockMovement1.KNDY4__Source_Document__c = 'Purchase Order';
                stockMovement1.KNDY4__Priority__c = 4;
                stockMovement1.KNDY4__Location_List__c = JSON.serialize(new List<Id>{location3.id,location5.id});
                stockMovement1.KNDY4__Active__c = true;
                stockMovementRuleList.add( stockMovement1 );

                KNDY4__Stock_Movement_Rule__c stockMovement2 = new KNDY4__Stock_Movement_Rule__c();
                stockMovement2.Name = 'Putaway rule2';
                stockMovement2.KNDY4__Rule_Type__c = 'Putaway';
                stockMovement2.KNDY4__Company__c = company.id;
                stockMovement2.KNDY4__Facility__c = facility2.id;
                stockMovement2.KNDY4__Class__c = null;
                stockMovement2.KNDY4__Item__c = null;
                stockMovement2.KNDY4__Customer__c = null;
                stockMovement2.KNDY4__Source_Document__c = 'Work Order';
                stockMovement2.KNDY4__Priority__c = 5;
                stockMovement2.KNDY4__Location_List__c = JSON.serialize(new List<Id>{location3.id,location5.id});
                stockMovement2.KNDY4__Active__c = true;
                stockMovementRuleList.add( stockMovement2 );

                KNDY4__Stock_Movement_Rule__c stockMovement3 = new KNDY4__Stock_Movement_Rule__c();
                stockMovement3.Name = 'Pick rule1';
                stockMovement3.KNDY4__Rule_Type__c = 'Pick';
                stockMovement3.KNDY4__Company__c = company.id;
                stockMovement3.KNDY4__Facility__c = facility2.id;
                stockMovement3.KNDY4__Class__c = null;
                stockMovement3.KNDY4__Item__c = itemList[0].id;
                stockMovement3.KNDY4__Customer__c = customerSoldTo.id;
                stockMovement3.KNDY4__Source_Document__c = 'Sales Order';
                stockMovement3.KNDY4__Priority__c = 1;
                stockMovement3.KNDY4__Location_List__c = JSON.serialize(new List<Id>{location3.id,location5.id});
                stockMovement3.KNDY4__Active__c = true;
                stockMovementRuleList.add( stockMovement3 );

                KNDY4__Stock_Movement_Rule__c stockMovement4 = new KNDY4__Stock_Movement_Rule__c();
                stockMovement4.Name = 'Pick rule2';
                stockMovement4.KNDY4__Rule_Type__c = 'Pick';
                stockMovement4.KNDY4__Company__c = company.id;
                stockMovement4.KNDY4__Facility__c = facility2.id;
                stockMovement4.KNDY4__Class__c = null;
                stockMovement4.KNDY4__Item__c = null;
                stockMovement4.KNDY4__Customer__c = customerSoldTo.id;
                stockMovement4.KNDY4__Source_Document__c = 'Sales Order';
                stockMovement4.KNDY4__Priority__c = 2;
                stockMovement4.KNDY4__Location_List__c = JSON.serialize(new List<Id>{location3.id,location5.id});
                stockMovement4.KNDY4__Active__c = true;
                stockMovementRuleList.add( stockMovement4 );

                KNDY4__Stock_Movement_Rule__c stockMovement5 = new KNDY4__Stock_Movement_Rule__c();
                stockMovement5.Name = 'Pick rule3';
                stockMovement5.KNDY4__Rule_Type__c = 'Pick';
                stockMovement5.KNDY4__Company__c = company.id;
                stockMovement5.KNDY4__Facility__c = facility2.id;
                stockMovement5.KNDY4__Class__c = null;
                stockMovement5.KNDY4__Item__c = null;
                stockMovement5.KNDY4__Customer__c = null;
                stockMovement5.KNDY4__Source_Document__c = 'Work Order';
                stockMovement5.KNDY4__Priority__c = 3;
                stockMovement5.KNDY4__Location_List__c = JSON.serialize(new List<Id>{location3.id,location5.id});
                stockMovement5.KNDY4__Active__c = true;
                stockMovementRuleList.add( stockMovement5 );

                KNDY4__Stock_Movement_Rule__c stockMovement6 = new KNDY4__Stock_Movement_Rule__c();
                stockMovement6.Name = 'Putaway rule3';
                stockMovement6.KNDY4__Rule_Type__c = 'Putaway';
                stockMovement6.KNDY4__Company__c = company.id;
                stockMovement6.KNDY4__Facility__c = facility2.id;
                stockMovement6.KNDY4__Source_Document__c = 'Purchase Order';
                stockMovement6.KNDY4__Priority__c = 6;
                stockMovement6.KNDY4__Location_List__c = JSON.serialize(new List<Id>{location3.id,location5.id});
                stockMovement6.KNDY4__Active__c = true;
                stockMovementRuleList.add( stockMovement6 );

                KNDY4__Stock_Movement_Rule__c stockMovement7 = new KNDY4__Stock_Movement_Rule__c();
                stockMovement7.Name = 'Transfer Order Pick rule';
                stockMovement7.KNDY4__Rule_Type__c = 'Pick';
                stockMovement7.KNDY4__Company__c = company.id;
                stockMovement7.KNDY4__Facility__c = facility2.id;
                stockMovement7.KNDY4__Source_Document__c = 'Transfer Order';
                stockMovement7.KNDY4__Priority__c = 1;
                stockMovement7.KNDY4__Location_List__c = JSON.serialize(new List<Id>{location3.id,location5.id});
                stockMovement7.KNDY4__Active__c = true;
                stockMovementRuleList.add( stockMovement7 );

                KNDY4__Stock_Movement_Rule__c stockMovement8 = new KNDY4__Stock_Movement_Rule__c();
                stockMovement8.Name = 'Transfer Order Putaway rule';
                stockMovement8.KNDY4__Rule_Type__c = 'Putaway';
                stockMovement8.KNDY4__Company__c = company.id;
                stockMovement8.KNDY4__Facility__c = facility.id;
                stockMovement8.KNDY4__Source_Document__c = 'Transfer Order';
                stockMovement8.KNDY4__Priority__c = 1;
                stockMovement8.KNDY4__Location_List__c = JSON.serialize(new List<Id>{location4.id});
                stockMovement8.KNDY4__Active__c = true;
                stockMovementRuleList.add( stockMovement8 );

                KNDY4__Stock_Movement_Rule__c stockMovement9 = new KNDY4__Stock_Movement_Rule__c();
                stockMovement9.Name = 'Putaway rule3';
                stockMovement9.KNDY4__Rule_Type__c = 'Putaway';
                stockMovement9.KNDY4__Company__c = company.id;
                stockMovement9.KNDY4__Facility__c = facility2.id;
                stockMovement9.KNDY4__Class__c = clsObj.id;
                stockMovement9.KNDY4__Item__c = null;
                stockMovement9.KNDY4__Customer__c = null;
                stockMovement9.KNDY4__Source_Document__c = 'Sales Order';
                stockMovement9.KNDY4__Priority__c = 1;
                stockMovement9.KNDY4__Location_List__c = JSON.serialize(new List<Id>{location3.id,location5.id});
                stockMovement9.KNDY4__Active__c = true;
                stockMovementRuleList.add( stockMovement9 );

                KNDY4__Stock_Movement_Rule__c stockMovement10 = new KNDY4__Stock_Movement_Rule__c();
                stockMovement10.Name = 'Putaway rule10';
                stockMovement10.KNDY4__Rule_Type__c = 'Putaway';
                stockMovement10.KNDY4__Company__c = company.id;
                stockMovement10.KNDY4__Facility__c = facility2.id;
                stockMovement10.KNDY4__Class__c = null;
                stockMovement10.KNDY4__Item__c = null;
                stockMovement10.KNDY4__Customer__c = null;
                stockMovement10.KNDY4__Source_Document__c = 'Receiving Document';
                stockMovement10.KNDY4__Priority__c = 1;
                stockMovement10.KNDY4__Location_List__c = JSON.serialize(new List<Id>{location3.id,location5.id});
                stockMovement10.KNDY4__Active__c = true;
                stockMovementRuleList.add( stockMovement10 );
                //stock Movement rule for direct putaway
                KNDY4__Stock_Movement_Rule__c stockMovement11 = new KNDY4__Stock_Movement_Rule__c();
                stockMovement11.Name = 'Transfer Rule for Direct Putaway';
                stockMovement11.KNDY4__Rule_Type__c = 'Putaway';
                stockMovement11.KNDY4__Company__c = company.id;
                stockMovement11.KNDY4__Facility__c = facility2.id;
                stockMovement11.KNDY4__Class__c = null;
                stockMovement11.KNDY4__Item__c = null;
                stockMovement11.KNDY4__Customer__c = null;
                stockMovement11.KNDY4__Source_Document__c = 'Transfer';
                stockMovement11.KNDY4__Priority__c = 2;
                stockMovement11.KNDY4__Location_List__c = JSON.serialize(new List<Id>{location3.id});
                stockMovement11.KNDY4__Active__c = true;
                stockMovementRuleList.add( stockMovement11 );

                insert stockMovementRuleList;
            }
            return stockMovementRuleList;
        }
        set;
    }

    public KNDY4__Means_of_Transport__c meansOfTransport {
        get{
            if(meansOfTransport == null){
                meansOfTransport = newMeansOfTransport('LAND', 'Land');
                insert meansOfTransport;
            }
            return meansOfTransport;
        }
        set;
    }

    //public KNDY4__Transit_Route__c transitRoute {
    //  get{
    //      if(transitRoute == null){
    //          transitRoute = new KNDY4__Transit_Route__c();
    //          transitRoute.KNDY4__Destination__c = customerShipTo.KNDY4__Address__c;
    //          transitRoute.KNDY4__Origin__c = facility2.KNDY4__Address__c;
    //          transitRoute.KNDY4__Means_of_Transport__c = meansOfTransport.Id;
    //          transitRoute.KNDY4__Transit_Time__c = 2;
    //          transitRoute.KNDY4__Delivery_Method__c = 'Delivery';

    //          insert transitRoute;
    //      }
    //      return transitRoute;
    //  }
    //  set;
    //}

    public List<KNDY4__Period__c> periodList {
        get {
            if (periodList == null) {
                integer year = system.now().year();
                periodList = new List<KNDY4__Period__c>();

                //insert current year
                for(integer i=1; i<=12; i++){
                    KNDY4__Period__c iPeriod = new KNDY4__Period__c();
                    //iPeriod.Name = string.valueOf(i) + '-' + string.valueOf(year);
                    //iPeriod.Name = string.valueOf(i) + '-' + String.ValueOf(Math.random());

                    iPeriod.KNDY4__Year_Start_Date__c = date.newInstance(year, 1, 1);
                    iPeriod.KNDY4__Year_End_Date__c = date.newInstance(year + 1, 1, 1);
                    iPeriod.KNDY4__Period_Start__c = datetime.newInstance(year, i, 1, 0, 0, 0);
                    iPeriod.KNDY4__Period_End__c = datetime.newInstance((i == 12 ? year + 1 : year), (i == 12 ? 1 : i + 1), 1, 0, 0, 0);
                    iPeriod.Name = company.KNDY4__Company_Identifier__c + '_' + iPeriod.KNDY4__Period_Start__c.getTime();
                    iPeriod.KNDY4__Period_Number__c = i;
                    if(i>=1 && i <= 3){
                        iPeriod.KNDY4__Quarter_Number__c = 1;
                    }else if(i>=4 && i <= 6){
                        iPeriod.KNDY4__Quarter_Number__c = 2;
                    }else if(i>=7 && i <= 9){
                        iPeriod.KNDY4__Quarter_Number__c = 3;
                    }else if(i>=10 && i <= 12){
                        iPeriod.KNDY4__Quarter_Number__c = 4;
                    }

                    iPeriod.KNDY4__Fiscal_Year__c = String.valueOf(year);
                    iPeriod.KNDY4__Company__c = company.Id;
                    iPeriod.KNDY4__Adjustment_Period__c = false;
                    iPeriod.KNDY4__Closed__c = false;
                    iPeriod.KNDY4__Open__c = i >= system.now().month();
                    iPeriod.KNDY4__Fiscal__c = true;
                    iPeriod.KNDY4__Corporate__c = false;
                    iPeriod.KNDY4__Tax__c = false;
                    iPeriod.KNDY4__Permanently_Closed__c = false;
                    iPeriod.KNDY4__Adjustment_Period__c = false;

                    iPeriod.KNDY4__AP_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__AR_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__Shipment_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__Receiving_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__FA_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__Inventory_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__JE_Cutoff__c = iPeriod.KNDY4__Period_End__c;

                    periodList.add(iPeriod);
                }


                //insert next year
                year++;
                for(integer i=1; i<=12; i++){
                    KNDY4__Period__c iPeriod = new KNDY4__Period__c();
                    iPeriod.KNDY4__Year_Start_Date__c = date.newInstance(year, 1, 1);
                    iPeriod.KNDY4__Year_End_Date__c = date.newInstance(year + 1, 1, 1);
                    iPeriod.KNDY4__Period_Start__c = datetime.newInstance(year, i, 1, 0, 0, 0);
                    iPeriod.KNDY4__Period_End__c = datetime.newInstance((i == 12 ? year + 1 : year), (i == 12 ? 1 : i + 1), 1, 0, 0, 0);
                    iPeriod.Name = company.KNDY4__Company_Identifier__c + '_' + iPeriod.KNDY4__Period_Start__c.getTime();
                    iPeriod.KNDY4__Period_Number__c = i;
                    if(i>=1 && i <= 3){
                        iPeriod.KNDY4__Quarter_Number__c = 1;
                    }else if(i>=4 && i <= 6){
                        iPeriod.KNDY4__Quarter_Number__c = 2;
                    }else if(i>=7 && i <= 9){
                        iPeriod.KNDY4__Quarter_Number__c = 3;
                    }else if(i>=10 && i <= 12){
                        iPeriod.KNDY4__Quarter_Number__c = 4;
                    }

                    iPeriod.KNDY4__Fiscal_Year__c = String.valueOf(year);
                    iPeriod.KNDY4__Company__c = company.Id;
                    iPeriod.KNDY4__Adjustment_Period__c = false;
                    iPeriod.KNDY4__Closed__c = false;
                    iPeriod.KNDY4__Open__c = i >= system.now().month();
                    iPeriod.KNDY4__Fiscal__c = true;
                    iPeriod.KNDY4__Corporate__c = false;
                    iPeriod.KNDY4__Tax__c = false;
                    iPeriod.KNDY4__Permanently_Closed__c = false;
                    iPeriod.KNDY4__Adjustment_Period__c = false;

                    iPeriod.KNDY4__AP_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__AR_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__Shipment_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__Receiving_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__FA_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__Inventory_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__JE_Cutoff__c = iPeriod.KNDY4__Period_End__c;

                    periodList.add(iPeriod);
                }

                KNDY4__Fiscal_Year__c fy = new KNDY4__Fiscal_Year__c();
                fy.KNDY4__company__c = company.Id;
                fy.KNDY4__fiscal_year_start_date__c = periodList[0].KNDY4__period_start__c;
                fy.KNDY4__fiscal_year_end_date__c = periodList[periodList.size()-1].KNDY4__period_end__c.addMonths(3);

                insert fy;
                for(KNDY4__Period__c p : periodList){
                    p.KNDY4__fiscalyear__c = fy.Id;
                }

                insert periodList;
            }
            update periodList;

            return periodList;
        }
        set;
    }

    //previous year periods - usually not needed
    public List<KNDY4__Period__c> periodListLastYear {
        get {
            if (periodListLastYear == null) {
                integer year = (system.now().year() - 1);
                periodListLastYear = new List<KNDY4__Period__c>();

                for(integer i=1; i<=12; i++){
                    KNDY4__Period__c iPeriod = new KNDY4__Period__c();
                    iPeriod.KNDY4__Year_Start_Date__c = date.newInstance(year, 1, 1);
                    iPeriod.KNDY4__Year_End_Date__c = date.newInstance(year + 1, 1, 1);
                    iPeriod.KNDY4__Period_Start__c = datetime.newInstance(year, i, 1, 0, 0, 0);
                    iPeriod.KNDY4__Period_End__c = datetime.newInstance((i == 12 ? year + 1 : year), (i == 12 ? 1 : i + 1), 1, 0, 0, 0);
                    iPeriod.KNDY4__Period_Number__c = i;
                    iPeriod.Name = company.KNDY4__Company_Identifier__c + '_' + iPeriod.KNDY4__Period_Start__c.getTime();
                    if(i>=1 && i <= 3){
                        iPeriod.KNDY4__Quarter_Number__c = 1;
                    }else if(i>=4 && i <= 6){
                        iPeriod.KNDY4__Quarter_Number__c = 2;
                    }else if(i>=7 && i <= 9){
                        iPeriod.KNDY4__Quarter_Number__c = 3;
                    }else if(i>=10 && i <= 12){
                        iPeriod.KNDY4__Quarter_Number__c = 4;
                    }

                    iPeriod.KNDY4__Fiscal_Year__c = String.valueOf(year);
                    iPeriod.KNDY4__Company__c = company.Id;
                    iPeriod.KNDY4__Adjustment_Period__c = false;
                    iPeriod.KNDY4__Closed__c = false;
                    iPeriod.KNDY4__Open__c = i >= system.now().month();
                    iPeriod.KNDY4__Fiscal__c = true;
                    iPeriod.KNDY4__Corporate__c = false;
                    iPeriod.KNDY4__Tax__c = false;
                    iPeriod.KNDY4__Permanently_Closed__c = false;
                    iPeriod.KNDY4__Adjustment_Period__c = false;

                    iPeriod.KNDY4__AP_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__AR_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__Shipment_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__Receiving_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__FA_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__Inventory_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__JE_Cutoff__c = iPeriod.KNDY4__Period_End__c;

                    periodListLastYear.add(iPeriod);
                }


                KNDY4__Fiscal_Year__c fy = new KNDY4__Fiscal_Year__c();
                fy.KNDY4__company__c = company.Id;
                fy.KNDY4__fiscal_year_start_date__c = periodListLastYear[0].KNDY4__period_start__c;
                fy.KNDY4__fiscal_year_end_date__c = periodListLastYear[periodListLastYear.size()-1].KNDY4__period_end__c.addMonths(3);
                insert fy;

                for(KNDY4__Period__c p : periodListLastYear){
                    p.KNDY4__fiscalyear__c = fy.Id;
                }
                insert periodListLastYear;
            }

            update periodListLastYear;
            return periodListLastYear;
        }
        set;
    }

    public List<KNDY4__Period__c> altCompanyPeriodList {
        get {
            if (altCompanyPeriodList == null) {
                integer year = system.now().year();
                altCompanyPeriodList = new List<KNDY4__Period__c>();

                //insert current year
                for(integer i=1; i<=12; i++){
                    KNDY4__Period__c iPeriod = new KNDY4__Period__c();
                    iPeriod.KNDY4__Year_Start_Date__c = date.newInstance(year, 1, 1);
                    iPeriod.KNDY4__Year_End_Date__c = date.newInstance(year + 1, 1, 1);
                    iPeriod.KNDY4__Period_Start__c = datetime.newInstance(year, i, 1, 0, 0, 0);
                    iPeriod.KNDY4__Period_End__c = datetime.newInstance((i == 12 ? year + 1 : year), (i == 12 ? 1 : i + 1), 1, 0, 0, 0);
                    iPeriod.Name = altCompany.KNDY4__Company_Identifier__c + '_' + iPeriod.KNDY4__Period_Start__c.getTime();
                    iPeriod.KNDY4__Period_Number__c = i;
                    if(i>=1 && i <= 3){
                        iPeriod.KNDY4__Quarter_Number__c = 1;
                    }else if(i>=4 && i <= 6){
                        iPeriod.KNDY4__Quarter_Number__c = 2;
                    }else if(i>=7 && i <= 9){
                        iPeriod.KNDY4__Quarter_Number__c = 3;
                    }else if(i>=10 && i <= 12){
                        iPeriod.KNDY4__Quarter_Number__c = 4;
                    }

                    iPeriod.KNDY4__Fiscal_Year__c = String.valueOf(year);
                    iPeriod.KNDY4__Company__c = altCompany.Id;
                    iPeriod.KNDY4__Adjustment_Period__c = false;
                    iPeriod.KNDY4__Closed__c = false;
                    iPeriod.KNDY4__Open__c = i >= system.now().month();
                    iPeriod.KNDY4__Fiscal__c = true;
                    iPeriod.KNDY4__Corporate__c = false;
                    iPeriod.KNDY4__Tax__c = false;
                    iPeriod.KNDY4__Permanently_Closed__c = false;
                    iPeriod.KNDY4__Adjustment_Period__c = false;

                    iPeriod.KNDY4__AP_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__AR_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__Shipment_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__Receiving_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__FA_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__Inventory_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__JE_Cutoff__c = iPeriod.KNDY4__Period_End__c;

                    altCompanyPeriodList.add(iPeriod);
                }


                //insert next year
                year++;
                for(integer i=1; i<=12; i++){
                    KNDY4__Period__c iPeriod = new KNDY4__Period__c();
                    iPeriod.KNDY4__Year_Start_Date__c = date.newInstance(year, 1, 1);
                    iPeriod.KNDY4__Year_End_Date__c = date.newInstance(year + 1, 1, 1);
                    iPeriod.KNDY4__Period_Start__c = datetime.newInstance(year, i, 1, 0, 0, 0);
                    iPeriod.KNDY4__Period_End__c = datetime.newInstance((i == 12 ? year + 1 : year), (i == 12 ? 1 : i + 1), 1, 0, 0, 0);
                    iPeriod.KNDY4__Period_Number__c = i;
                    iPeriod.Name = altCompany.KNDY4__Company_Identifier__c + '_' + iPeriod.KNDY4__Period_Start__c.getTime();
                    if(i>=1 && i <= 3){
                        iPeriod.KNDY4__Quarter_Number__c = 1;
                    }else if(i>=4 && i <= 6){
                        iPeriod.KNDY4__Quarter_Number__c = 2;
                    }else if(i>=7 && i <= 9){
                        iPeriod.KNDY4__Quarter_Number__c = 3;
                    }else if(i>=10 && i <= 12){
                        iPeriod.KNDY4__Quarter_Number__c = 4;
                    }

                    iPeriod.KNDY4__Fiscal_Year__c = String.valueOf(year);
                    iPeriod.KNDY4__Company__c = altCompany.Id;
                    iPeriod.KNDY4__Adjustment_Period__c = false;
                    iPeriod.KNDY4__Closed__c = false;
                    iPeriod.KNDY4__Open__c = i >= system.now().month();
                    iPeriod.KNDY4__Fiscal__c = true;
                    iPeriod.KNDY4__Corporate__c = false;
                    iPeriod.KNDY4__Tax__c = false;
                    iPeriod.KNDY4__Permanently_Closed__c = false;
                    iPeriod.KNDY4__Adjustment_Period__c = false;

                    iPeriod.KNDY4__AP_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__AR_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__Shipment_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__Receiving_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__FA_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__Inventory_Subledger_Cutoff__c = iPeriod.KNDY4__Period_End__c;
                    iPeriod.KNDY4__JE_Cutoff__c = iPeriod.KNDY4__Period_End__c;

                    altCompanyPeriodList.add(iPeriod);
                }

                KNDY4__Fiscal_Year__c fy = new KNDY4__Fiscal_Year__c();
                fy.KNDY4__company__c = altCompany.Id;
                fy.KNDY4__fiscal_year_start_date__c = altCompanyPeriodList[0].KNDY4__period_start__c;
                fy.KNDY4__fiscal_year_end_date__c = altCompanyPeriodList[altCompanyPeriodList.size()-1].KNDY4__period_end__c.addMonths(3);

                insert fy;
                for(KNDY4__Period__c p : altCompanyPeriodList){
                    p.KNDY4__fiscalyear__c = fy.Id;
                }

                insert altCompanyPeriodList;
            }
            update altCompanyPeriodList;

            return altCompanyPeriodList;
        }
        set;
    }

    public List<KNDY4__GL_Account__c> GLAccountList {
        get {
            if ( GLAccountList == null ) {

                GLAccountList = new List<KNDY4__GL_Account__c>();

                KNDY4__GL_Account__c cashGL = mGLAccounts.containsKey('12000') ? mGLAccounts.get('12000'):null ;
                GLAccountList.add(cashGL);

                KNDY4__GL_Account__c receivablesGL = mGLAccounts.containsKey('11000') ? mGLAccounts.get('11000'):null;
                GLAccountList.add(receivablesGL);

                KNDY4__GL_Account__c revenueGL = mGLAccounts.containsKey('42000') ? mGLAccounts.get('42000'):null;
                GLAccountList.add(revenueGL);

                KNDY4__GL_Account__c unappliedCashGL = mGLAccounts.containsKey('12100') ? mGLAccounts.get('12100'):null;
                GLAccountList.add(unappliedCashGL);

                KNDY4__GL_Account__c propertyGL = mGLAccounts.containsKey('17000') ? mGLAccounts.get('17000'):null;
                GLAccountList.add(propertyGL);

                KNDY4__GL_Account__c longTermGL = mGLAccounts.containsKey('28000') ? mGLAccounts.get('28000'):null;
                GLAccountList.add(longTermGL);

                KNDY4__GL_Account__c inventoryGL = mGLAccounts.containsKey('12500') ? mGLAccounts.get('12500'):null;
                GLAccountList.add(inventoryGL);

                KNDY4__GL_Account__c cogsGL = mGLAccounts.containsKey('50000') ? mGLAccounts.get('50000'):null;
                GLAccountList.add(cogsGL);

                KNDY4__GL_Account__c salesReturnsGL = mGLAccounts.containsKey('48000') ? mGLAccounts.get('48000'):null;
                GLAccountList.add(salesReturnsGL);

                KNDY4__GL_Account__c taxGL = mGLAccounts.containsKey('24000') ? mGLAccounts.get('24000'):null;
                GLAccountList.add(taxGL);

                KNDY4__GL_Account__c wipInventoryGL = mGLAccounts.containsKey('14000') ? mGLAccounts.get('14000'):null;
                GLAccountList.add(wipInventoryGL);

                KNDY4__GL_Account__c FGInventoryGL = mGLAccounts.containsKey('15000') ? mGLAccounts.get('15000'):null;
                GLAccountList.add(FGInventoryGL);

                KNDY4__GL_Account__c payablesGL = mGLAccounts.containsKey('21000') ? mGLAccounts.get('21000'):null;
                GLAccountList.add(payablesGL);

                KNDY4__GL_Account__c accruedExpGL = mGLAccounts.containsKey('22000') ? mGLAccounts.get('22000'):null;
                GLAccountList.add(accruedExpGL);

                KNDY4__GL_Account__c overpaymentGL = mGLAccounts.containsKey('24100') ? mGLAccounts.get('24100'):null;
                GLAccountList.add(overpaymentGL);

                KNDY4__GL_Account__c GRNIGL = mGLAccounts.containsKey('23000') ? mGLAccounts.get('23000'):null;
                GLAccountList.add(GRNIGL);

                KNDY4__GL_Account__c GoodsInTransit = mGLAccounts.containsKey('23100') ? mGLAccounts.get('23100'):null;
                GLAccountList.add(GoodsInTransit);

                KNDY4__GL_Account__c salesDiscountGL = mGLAccounts.containsKey('49000') ? mGLAccounts.get('49000'):null;
                GLAccountList.add(salesDiscountGL);

                KNDY4__GL_Account__c inventoryScrapGL = mGLAccounts.containsKey('52000') ? mGLAccounts.get('52000'):null;
                GLAccountList.add(inventoryScrapGL);

                KNDY4__GL_Account__c allowanceExpGL = mGLAccounts.containsKey('55000') ? mGLAccounts.get('55000'):null;
                GLAccountList.add(allowanceExpGL);

                KNDY4__GL_Account__c deductionExpGL = mGLAccounts.containsKey('56000') ? mGLAccounts.get('56000'):null;
                GLAccountList.add(deductionExpGL);

                KNDY4__GL_Account__c InventoryAdjustmentGL = mGLAccounts.containsKey('58500') ? mGLAccounts.get('58500'):null;
                GLAccountList.add(InventoryAdjustmentGL);

                KNDY4__GL_Account__c PPVGL = mGLAccounts.containsKey('59000') ? mGLAccounts.get('59000'):null;
                GLAccountList.add(PPVGL);

                KNDY4__GL_Account__c IPVGL = mGLAccounts.containsKey('59100') ? mGLAccounts.get('59100'):null;
                GLAccountList.add(IPVGL);

                KNDY4__GL_Account__c writeoffGL = mGLAccounts.containsKey('61000') ? mGLAccounts.get('61000'):null;
                GLAccountList.add(writeoffGL);

                KNDY4__GL_Account__c officeExpGL = mGLAccounts.containsKey('65000') ? mGLAccounts.get('65000'):null;
                GLAccountList.add(officeExpGL);

                KNDY4__GL_Account__c miscRcptGL = mGLAccounts.containsKey('23500') ? mGLAccounts.get('23500'):null;
                GLAccountList.add(miscRcptGL);

                KNDY4__GL_Account__c miscIssueGL = mGLAccounts.containsKey('51000') ? mGLAccounts.get('51000'):null;
                GLAccountList.add(miscIssueGL);

                KNDY4__GL_Account__c miscInvScrapGL = mGLAccounts.containsKey('52100') ? mGLAccounts.get('52100'):null;
                GLAccountList.add(miscInvScrapGL);

                KNDY4__GL_Account__c marketingGL = mGLAccounts.containsKey('62000') ? mGLAccounts.get('62000'):null;
                GLAccountList.add(marketingGL);

                KNDY4__GL_Account__c cipGL = mGLAccounts.containsKey('15100') ? mGLAccounts.get('15100'):null;
                GLAccountList.add(cipGL);

                KNDY4__GL_Account__c rawMaterialGL = mGLAccounts.containsKey('22500') ? mGLAccounts.get('22500'):null;
                GLAccountList.add(rawMaterialGL);

                KNDY4__GL_Account__c gain_LossOnSaleofAsset = mGLAccounts.containsKey('79000') ? mGLAccounts.get('79000'):null;
                GLAccountList.add(gain_LossOnSaleofAsset);

                KNDY4__GL_Account__c InterestIncome_Expense =mGLAccounts.containsKey('89020') ?  mGLAccounts.get('89020'):null;
                GLAccountList.add(InterestIncome_Expense);

                KNDY4__GL_Account__c RealizedFX = mGLAccounts.containsKey('79500') ?  mGLAccounts.get('79500'):null;
                GLAccountList.add(RealizedFX);

                KNDY4__GL_Account__c provisionForFederalTaxes = mGLAccounts.containsKey('99998') ? mGLAccounts.get('99998'):null;
                GLAccountList.add(provisionForFederalTaxes);

                KNDY4__GL_Account__c shareCapital = mGLAccounts.containsKey('38000') ? mGLAccounts.get('38000'):null;
                GLAccountList.add(shareCapital);

                KNDY4__GL_Account__c retainedEarnings = mGLAccounts.containsKey('39000') ? mGLAccounts.get('39000'):null;
                GLAccountList.add(retainedEarnings);

            }


            return GLAccountList;
        }
        set;
    }



    public List<KNDY4__Accounting_Rule__c> BankTxnGrpAcctRulesList {
        get{
            if(BankTxnGrpAcctRulesList == null){
                BankTxnGrpAcctRulesList = new List<KNDY4__Accounting_Rule__c>();
                KNDY4__Accounting_Rule__c BankTxnGrpCRDT1 = new KNDY4__Accounting_Rule__c();
                BankTxnGrpCRDT1.KNDY4__Object_Name__c = 'KNDY4__Bank_Transaction_Group__c';
                //BankTxnGrpCRDT1.KNDY4__company__c = company.id;
                BankTxnGrpCRDT1.KNDY4__Transaction__c = 'Standard';
                BankTxnGrpCRDT1.KNDY4__SubTransaction_Type__c = 'Credit';
                BankTxnGrpCRDT1.KNDY4__Rule_Type__c = 'CR';
                BankTxnGrpCRDT1.KNDY4__Default_GL_Account__c = true;
                BankTxnGrpCRDT1.KNDY4__GL_Account_Reference_Value__c = null;
                BankTxnGrpCRDT1.KNDY4__GL_Account__c = unappliedCashGL.id;
                BankTxnGrpCRDT1.KNDY4__Line_Type__c = null;
                BankTxnGrpCRDT1.KNDY4__Company_Ledger__c = true;
                BankTxnGrpCRDT1.KNDY4__Effective_Start_Date__c= effStartDate;
                BankTxnGrpAcctRulesList.add(BankTxnGrpCRDT1);

                KNDY4__Accounting_Rule__c BankTxnGrpCRDT2 = new KNDY4__Accounting_Rule__c();
                BankTxnGrpCRDT2.KNDY4__Object_Name__c = 'KNDY4__Bank_Transaction_Group__c';
                //BankTxnGrpCRDT2.KNDY4__company__c = company.id;
                BankTxnGrpCRDT2.KNDY4__Transaction__c = 'Standard';
                BankTxnGrpCRDT2.KNDY4__SubTransaction_Type__c = 'Credit';
                BankTxnGrpCRDT2.KNDY4__Rule_Type__c = 'DR';
                BankTxnGrpCRDT2.KNDY4__Default_GL_Account__c = false;
                BankTxnGrpCRDT2.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__Bank_Account__r.KNDY4__GL_Account__c';
                BankTxnGrpCRDT2.KNDY4__GL_Account__c = null ;
                BankTxnGrpCRDT2.KNDY4__Line_Type__c = null;
                BankTxnGrpCRDT2.KNDY4__Company_Ledger__c = true;
                BankTxnGrpCRDT2.KNDY4__Effective_Start_Date__c= effStartDate;
                BankTxnGrpAcctRulesList.add(BankTxnGrpCRDT2);

                KNDY4__Accounting_Rule__c BankTxnGrpDBT1 = new KNDY4__Accounting_Rule__c();
                BankTxnGrpDBT1.KNDY4__Object_Name__c = 'KNDY4__Bank_Transaction_Group__c';
                //BankTxnGrpDBT1.KNDY4__company__c = company.id;
                BankTxnGrpDBT1.KNDY4__Transaction__c = 'Standard';
                BankTxnGrpDBT1.KNDY4__SubTransaction_Type__c = 'Debit';
                BankTxnGrpDBT1.KNDY4__Rule_Type__c = 'CR';
                BankTxnGrpDBT1.KNDY4__Default_GL_Account__c = false;
                BankTxnGrpDBT1.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__Bank_Account__r.KNDY4__GL_Account__c';
                BankTxnGrpDBT1.KNDY4__GL_Account__c = null;
                BankTxnGrpDBT1.KNDY4__Line_Type__c = null;
                BankTxnGrpDBT1.KNDY4__Company_Ledger__c = true;
                BankTxnGrpDBT1.KNDY4__Effective_Start_Date__c= effStartDate;
                BankTxnGrpAcctRulesList.add(BankTxnGrpDBT1);

                KNDY4__Accounting_Rule__c BankTxnGrpDBT2 = new KNDY4__Accounting_Rule__c();
                BankTxnGrpDBT2.KNDY4__Object_Name__c = 'KNDY4__Bank_Transaction_Group__c';
                //BankTxnGrpDBT2.KNDY4__company__c = company.id;
                BankTxnGrpDBT2.KNDY4__Transaction__c = 'Standard';
                BankTxnGrpDBT2.KNDY4__SubTransaction_Type__c = 'Debit';
                BankTxnGrpDBT2.KNDY4__Rule_Type__c = 'DR';
                BankTxnGrpDBT2.KNDY4__Default_GL_Account__c = true;
                BankTxnGrpDBT2.KNDY4__GL_Account_Reference_Value__c = null;
                BankTxnGrpDBT2.KNDY4__GL_Account__c = unappliedCashGL.id;
                BankTxnGrpDBT2.KNDY4__Line_Type__c = null;
                BankTxnGrpDBT2.KNDY4__Company_Ledger__c = true;
                BankTxnGrpDBT2.KNDY4__Effective_Start_Date__c= effStartDate;
                BankTxnGrpAcctRulesList.add(BankTxnGrpDBT2);

                for(KNDY4__Accounting_Rule__c ar : BankTxnGrpAcctRulesList){
                    ar.KNDY4__Accounting_Standard__c = accountingStandard.Id;
                }
                insert BankTxnGrpAcctRulesList;
            }
            update BankTxnGrpAcctRulesList;
            return BankTxnGrpAcctRulesList;
        }
        set;
    }
    public List<KNDY4__Accounting_Rule__c> SuppInvAcctRulesList {
        get {
            if (SuppInvAcctRulesList == null) {
                SuppInvAcctRulesList = new List<KNDY4__Accounting_Rule__c>();

                KNDY4__Accounting_Rule__c sinvacctRule1 = new KNDY4__Accounting_Rule__c();
                sinvacctRule1.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule1.KNDY4__company__c = company.id;
                sinvacctRule1.KNDY4__Transaction__c = 'Supplier Invoice';
                sinvacctRule1.KNDY4__SubTransaction_Type__c = 'Goods';
                sinvacctRule1.KNDY4__Rule_Type__c = 'DR';
                sinvacctRule1.KNDY4__Default_GL_Account__c = true;
                sinvacctRule1.KNDY4__GL_Account_Reference_Value__c = null;
                sinvacctRule1.KNDY4__GL_Account__c = IPVGL.id;
                sinvacctRule1.KNDY4__Line_Type__c = 'Item';
                sinvacctRule1.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule1);

                KNDY4__Accounting_Rule__c sinvacctRule2 = new KNDY4__Accounting_Rule__c();
                sinvacctRule2.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule2.KNDY4__company__c = company.id;
                sinvacctRule2.KNDY4__Transaction__c = 'Supplier Invoice';
                sinvacctRule2.KNDY4__SubTransaction_Type__c = 'Goods';
                sinvacctRule2.KNDY4__Rule_Type__c = 'CR';
                sinvacctRule2.KNDY4__Default_GL_Account__c = true;
                sinvacctRule2.KNDY4__GL_Account_Reference_Value__c = null;
                sinvacctRule2.KNDY4__GL_Account__c = payablesGL.id;
                sinvacctRule2.KNDY4__Line_Type__c = 'Item';
                sinvacctRule2.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule2);

                KNDY4__Accounting_Rule__c sinvacctRule11 = new KNDY4__Accounting_Rule__c();
                sinvacctRule11.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule11.KNDY4__company__c = company.id;
                sinvacctRule11.KNDY4__Transaction__c = 'Supplier Invoice';
                sinvacctRule11.KNDY4__SubTransaction_Type__c = 'Goods';
                sinvacctRule11.KNDY4__Rule_Type__c = 'DR';
                sinvacctRule11.KNDY4__Default_GL_Account__c = true;
                sinvacctRule11.KNDY4__GL_Account_Reference_Value__c = null;
                sinvacctRule11.KNDY4__GL_Account__c = GRNIGL.id;
                sinvacctRule11.KNDY4__Line_Type__c = 'Item';
                sinvacctRule11.KNDY4__Amount_Reference__c = 'KNDY4__Purchase_Price__c';
                sinvacctRule11.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule11);

                KNDY4__Accounting_Rule__c sinvacctRule22 = new KNDY4__Accounting_Rule__c();
                sinvacctRule22.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule22.KNDY4__company__c = company.id;
                sinvacctRule22.KNDY4__Transaction__c = 'Supplier Invoice';
                sinvacctRule22.KNDY4__SubTransaction_Type__c = 'Goods';
                sinvacctRule22.KNDY4__Rule_Type__c = 'CR';
                sinvacctRule22.KNDY4__Default_GL_Account__c = true;
                sinvacctRule22.KNDY4__GL_Account_Reference_Value__c = null;
                sinvacctRule22.KNDY4__GL_Account__c = IPVGL.id;
                sinvacctRule22.KNDY4__Line_Type__c = 'Item';
                sinvacctRule22.KNDY4__Amount_Reference__c = 'KNDY4__Purchase_Price__c';
                sinvacctRule22.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule22);

                KNDY4__Accounting_Rule__c sinvacctRule91 = new KNDY4__Accounting_Rule__c();
                sinvacctRule91.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule91.KNDY4__company__c = company.id;
                sinvacctRule91.KNDY4__Transaction__c = 'Supplier Invoice';
                sinvacctRule91.KNDY4__SubTransaction_Type__c = 'Goods';
                sinvacctRule91.KNDY4__Rule_Type__c = 'DR';
                sinvacctRule91.KNDY4__Default_GL_Account__c = true;
                sinvacctRule91.KNDY4__GL_Account_Reference_Value__c = null;
                sinvacctRule91.KNDY4__GL_Account__c = IPVGL.id;
                sinvacctRule91.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule91);

                KNDY4__Accounting_Rule__c sinvacctRule92 = new KNDY4__Accounting_Rule__c();
                sinvacctRule92.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule92.KNDY4__company__c = company.id;
                sinvacctRule92.KNDY4__Transaction__c = 'Supplier Invoice';
                sinvacctRule92.KNDY4__SubTransaction_Type__c = 'Goods';
                sinvacctRule92.KNDY4__Rule_Type__c = 'CR';
                sinvacctRule92.KNDY4__Default_GL_Account__c = true;
                sinvacctRule92.KNDY4__GL_Account_Reference_Value__c = null;
                sinvacctRule92.KNDY4__GL_Account__c = payablesGL.id;
                sinvacctRule92.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule92);

                KNDY4__Accounting_Rule__c sinvacctRule911 = new KNDY4__Accounting_Rule__c();
                sinvacctRule911.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule911.KNDY4__company__c = company.id;
                sinvacctRule911.KNDY4__Transaction__c = 'Supplier Invoice';
                sinvacctRule911.KNDY4__SubTransaction_Type__c = 'Goods';
                sinvacctRule911.KNDY4__Rule_Type__c = 'DR';
                sinvacctRule911.KNDY4__Default_GL_Account__c = true;
                sinvacctRule911.KNDY4__GL_Account_Reference_Value__c = null;
                sinvacctRule911.KNDY4__GL_Account__c = GRNIGL.id;
                sinvacctRule911.KNDY4__Amount_Reference__c = 'KNDY4__Purchase_Price__c';
                sinvacctRule911.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule911);

                KNDY4__Accounting_Rule__c sinvacctRule922 = new KNDY4__Accounting_Rule__c();
                sinvacctRule922.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule922.KNDY4__company__c = company.id;
                sinvacctRule922.KNDY4__Transaction__c = 'Supplier Invoice';
                sinvacctRule922.KNDY4__SubTransaction_Type__c = 'Goods';
                sinvacctRule922.KNDY4__Rule_Type__c = 'CR';
                sinvacctRule922.KNDY4__Default_GL_Account__c = true;
                sinvacctRule922.KNDY4__GL_Account_Reference_Value__c = null;
                sinvacctRule922.KNDY4__GL_Account__c = IPVGL.id;
                sinvacctRule922.KNDY4__Amount_Reference__c = 'KNDY4__Purchase_Price__c';
                sinvacctRule922.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule922);

                KNDY4__Accounting_Rule__c sinvacctRule7 = new KNDY4__Accounting_Rule__c();
                sinvacctRule7.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule7.KNDY4__company__c = company.id;
                sinvacctRule7.KNDY4__Transaction__c = 'Supplier Invoice';
                sinvacctRule7.KNDY4__SubTransaction_Type__c = 'Expense';
                //sinvacctRule7.KNDY4__Segment_Name__c = 'KNDY4__GL_Account__c';
                sinvacctRule7.KNDY4__Rule_Type__c = 'CR';
                //sinvacctRule7.KNDY4__Criteria__c = 'Item Class';
                sinvacctRule7.KNDY4__Default_GL_Account__c = false;
                sinvacctRule7.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__Item__r.KNDY4__Class__r.KNDY4__Inventory_GL_Account__c';
                sinvacctRule7.KNDY4__GL_Account__c = null;
                sinvacctRule7.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule7);

                KNDY4__Accounting_Rule__c sinvacctRule8 = new KNDY4__Accounting_Rule__c();
                sinvacctRule8.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule8.KNDY4__company__c = company.id;
                sinvacctRule8.KNDY4__Transaction__c = 'Supplier Invoice';
                sinvacctRule8.KNDY4__SubTransaction_Type__c = 'Expense';
                //sinvacctRule8.KNDY4__Segment_Name__c = 'KNDY4__GL_Account__c';
                sinvacctRule8.KNDY4__Rule_Type__c = 'DR';
                //sinvacctRule8.KNDY4__Criteria__c = 'Accounting Default';
                sinvacctRule8.KNDY4__Default_GL_Account__c = true;
                sinvacctRule8.KNDY4__GL_Account_Reference_Value__c = null;
                sinvacctRule8.KNDY4__GL_Account__c = GRNIGL.id;
                sinvacctRule8.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule8);

                KNDY4__Accounting_Rule__c sinvacctRule9 = new KNDY4__Accounting_Rule__c();
                sinvacctRule9.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule9.KNDY4__company__c = company.id;
                sinvacctRule9.KNDY4__Transaction__c = 'Supplier Invoice';
                sinvacctRule9.KNDY4__SubTransaction_Type__c = 'Miscellaneous';
                //sinvacctRule9.KNDY4__Segment_Name__c = 'KNDY4__GL_Account__c';
                sinvacctRule9.KNDY4__Rule_Type__c = 'CR';
                //sinvacctRule9.KNDY4__Criteria__c = 'Item Class';
                sinvacctRule9.KNDY4__Default_GL_Account__c = false;
                sinvacctRule9.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__Item__r.KNDY4__Class__r.KNDY4__Inventory_GL_Account__c';
                sinvacctRule9.KNDY4__GL_Account__c = null;
                sinvacctRule9.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule9);

                KNDY4__Accounting_Rule__c sinvacctRule10 = new KNDY4__Accounting_Rule__c();
                sinvacctRule10.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule10.KNDY4__company__c = company.id;
                sinvacctRule10.KNDY4__Transaction__c = 'Supplier Invoice';
                sinvacctRule10.KNDY4__SubTransaction_Type__c = 'Miscellaneous';
                //sinvacctRule10.KNDY4__Segment_Name__c = 'KNDY4__GL_Account__c';
                sinvacctRule10.KNDY4__Rule_Type__c = 'DR';
                //sinvacctRule10.KNDY4__Criteria__c = 'Accounting Default';
                sinvacctRule10.KNDY4__Default_GL_Account__c = true;
                sinvacctRule10.KNDY4__GL_Account_Reference_Value__c = null;
                sinvacctRule10.KNDY4__GL_Account__c = GRNIGL.id;
                sinvacctRule10.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule10);

                KNDY4__Accounting_Rule__c sinvacctRule31 = new KNDY4__Accounting_Rule__c();
                sinvacctRule31.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule31.KNDY4__company__c = company.id;
                sinvacctRule31.KNDY4__Transaction__c = 'Supplier Invoice';
                sinvacctRule31.KNDY4__SubTransaction_Type__c = null;
                sinvacctRule31.KNDY4__Rule_Type__c = 'CR';
                sinvacctRule31.KNDY4__Default_GL_Account__c = false;
                sinvacctRule31.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__Item__r.KNDY4__Class__r.KNDY4__Inventory_GL_Account__c';
                sinvacctRule31.KNDY4__GL_Account__c = null;
                sinvacctRule31.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule31);

                KNDY4__Accounting_Rule__c sinvacctRule32 = new KNDY4__Accounting_Rule__c();
                sinvacctRule32.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule32.KNDY4__company__c = company.id;
                sinvacctRule32.KNDY4__Transaction__c = 'Supplier Invoice';
                sinvacctRule32.KNDY4__SubTransaction_Type__c = null;
                sinvacctRule32.KNDY4__Rule_Type__c = 'DR';
                sinvacctRule32.KNDY4__Default_GL_Account__c = true;
                sinvacctRule32.KNDY4__GL_Account_Reference_Value__c = null;
                sinvacctRule32.KNDY4__GL_Account__c = GRNIGL.id;
                sinvacctRule32.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule32);

                //KNDY-12704
                KNDY4__Accounting_Rule__c sinvacctRule711 = new KNDY4__Accounting_Rule__c();
                sinvacctRule711.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                sinvacctRule711.KNDY4__Transaction__c = 'Supplier Invoice';
                sinvacctRule711.KNDY4__SubTransaction_Type__c = 'Goods - Purchase Order';
                sinvacctRule711.KNDY4__Rule_Type__c = 'CR';
                sinvacctRule711.KNDY4__Default_GL_Account__c = false;
                sinvacctRule711.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__Item__r.KNDY4__Class__r.KNDY4__Inventory_GL_Account__c';
                sinvacctRule711.KNDY4__GL_Account__c = null;
                sinvacctRule711.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule711);
                //KNDY-12704
                KNDY4__Accounting_Rule__c sinvacctRule712 = new KNDY4__Accounting_Rule__c();
                sinvacctRule712.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                sinvacctRule712.KNDY4__Transaction__c = 'Supplier Invoice';
                sinvacctRule712.KNDY4__SubTransaction_Type__c = 'Goods - Purchase Order';
                sinvacctRule712.KNDY4__Rule_Type__c = 'DR';
                sinvacctRule712.KNDY4__Default_GL_Account__c = true;
                sinvacctRule712.KNDY4__GL_Account_Reference_Value__c = null;
                sinvacctRule712.KNDY4__GL_Account__c = rfxGL.id;
                sinvacctRule712.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule712);

                KNDY4__Accounting_Rule__c sinvacctRule711A = new KNDY4__Accounting_Rule__c();
                sinvacctRule711A.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                sinvacctRule711A.KNDY4__Transaction__c = 'Invoice';
                sinvacctRule711A.KNDY4__SubTransaction_Type__c = 'Goods - Purchase Order';
                sinvacctRule711A.KNDY4__Rule_Type__c = 'CR';
                sinvacctRule711A.KNDY4__Default_GL_Account__c = false;
                sinvacctRule711A.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__Item__r.KNDY4__Class__r.KNDY4__Inventory_GL_Account__c';
                sinvacctRule711A.KNDY4__GL_Account__c = IPVGL.id;
                sinvacctRule711A.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule711A);
                //KNDY-12704
                KNDY4__Accounting_Rule__c sinvacctRule712A = new KNDY4__Accounting_Rule__c();
                sinvacctRule712A.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                sinvacctRule712A.KNDY4__Transaction__c = 'Invoice';
                sinvacctRule712A.KNDY4__SubTransaction_Type__c = 'Goods - Purchase Order';
                sinvacctRule712A.KNDY4__Rule_Type__c = 'DR';
                sinvacctRule712A.KNDY4__Default_GL_Account__c = true;
                sinvacctRule712A.KNDY4__GL_Account_Reference_Value__c = null;
                sinvacctRule712A.KNDY4__GL_Account__c = rfxGL.id;
                sinvacctRule712A.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule712A);

                KNDY4__Accounting_Rule__c sinvacctRule1New = new KNDY4__Accounting_Rule__c();
                sinvacctRule1New.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule1New.KNDY4__company__c = company.id;
                sinvacctRule1New.KNDY4__Transaction__c = 'Invoice';
                sinvacctRule1New.KNDY4__SubTransaction_Type__c = 'Goods';
                sinvacctRule1New.KNDY4__Rule_Type__c = 'DR';
                sinvacctRule1New.KNDY4__Default_GL_Account__c = true;
                sinvacctRule1New.KNDY4__GL_Account_Reference_Value__c = null;
                sinvacctRule1New.KNDY4__GL_Account__c = IPVGL.id;
                sinvacctRule1New.KNDY4__Line_Type__c = 'Item';
                sinvacctRule1New.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule1New);

                KNDY4__Accounting_Rule__c sinvacctRule2New = new KNDY4__Accounting_Rule__c();
                sinvacctRule2New.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule2New.KNDY4__company__c = company.id;
                sinvacctRule2New.KNDY4__Transaction__c = 'Invoice';
                sinvacctRule2New.KNDY4__SubTransaction_Type__c = 'Goods';
                sinvacctRule2New.KNDY4__Rule_Type__c = 'CR';
                sinvacctRule2New.KNDY4__Default_GL_Account__c = true;
                sinvacctRule2New.KNDY4__GL_Account_Reference_Value__c = null;
                sinvacctRule2New.KNDY4__GL_Account__c = payablesGL.id;
                sinvacctRule2New.KNDY4__Line_Type__c = 'Item';
                sinvacctRule2New.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule2New);

                KNDY4__Accounting_Rule__c sinvacctRule11New = new KNDY4__Accounting_Rule__c();
                sinvacctRule11New.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule11New.KNDY4__company__c = company.id;
                sinvacctRule11New.KNDY4__Transaction__c = 'Invoice';
                sinvacctRule11New.KNDY4__SubTransaction_Type__c = 'Goods';
                sinvacctRule11New.KNDY4__Rule_Type__c = 'DR';
                sinvacctRule11New.KNDY4__Default_GL_Account__c = true;
                sinvacctRule11New.KNDY4__GL_Account_Reference_Value__c = null;
                sinvacctRule11New.KNDY4__GL_Account__c = GRNIGL.id;
                sinvacctRule11New.KNDY4__Line_Type__c = 'Item';
                sinvacctRule11New.KNDY4__Amount_Reference__c = 'KNDY4__Purchase_Price__c';
                sinvacctRule11New.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule11New);

                KNDY4__Accounting_Rule__c sinvacctRule22New = new KNDY4__Accounting_Rule__c();
                sinvacctRule22New.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule22New.KNDY4__company__c = company.id;
                sinvacctRule22New.KNDY4__Transaction__c = 'Invoice';
                sinvacctRule22New.KNDY4__SubTransaction_Type__c = 'Goods';
                sinvacctRule22New.KNDY4__Rule_Type__c = 'CR';
                sinvacctRule22New.KNDY4__Default_GL_Account__c = true;
                sinvacctRule22New.KNDY4__GL_Account_Reference_Value__c = null;
                sinvacctRule22New.KNDY4__GL_Account__c = IPVGL.id;
                sinvacctRule22New.KNDY4__Line_Type__c = 'Item';
                sinvacctRule22New.KNDY4__Amount_Reference__c = 'KNDY4__Purchase_Price__c';
                sinvacctRule22New.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule22New);

                KNDY4__Accounting_Rule__c sinvacctRule91New = new KNDY4__Accounting_Rule__c();
                sinvacctRule91New.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule91New.KNDY4__company__c = company.id;
                sinvacctRule91New.KNDY4__Transaction__c = 'Invoice';
                sinvacctRule91New.KNDY4__SubTransaction_Type__c = 'Goods';
                sinvacctRule91New.KNDY4__Rule_Type__c = 'DR';
                sinvacctRule91New.KNDY4__Default_GL_Account__c = true;
                sinvacctRule91New.KNDY4__GL_Account_Reference_Value__c = null;
                sinvacctRule91New.KNDY4__GL_Account__c = IPVGL.id;
                sinvacctRule91New.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule91New);

                KNDY4__Accounting_Rule__c sinvacctRule92New = new KNDY4__Accounting_Rule__c();
                sinvacctRule92New.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule92New.KNDY4__company__c = company.id;
                sinvacctRule92New.KNDY4__Transaction__c = 'Invoice';
                sinvacctRule92New.KNDY4__SubTransaction_Type__c = 'Goods';
                sinvacctRule92New.KNDY4__Rule_Type__c = 'CR';
                sinvacctRule92New.KNDY4__Default_GL_Account__c = true;
                sinvacctRule92New.KNDY4__GL_Account_Reference_Value__c = null;
                sinvacctRule92New.KNDY4__GL_Account__c = payablesGL.id;
                sinvacctRule92New.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule92New);

                KNDY4__Accounting_Rule__c sinvacctRule911New = new KNDY4__Accounting_Rule__c();
                sinvacctRule911New.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule911New.KNDY4__company__c = company.id;
                sinvacctRule911New.KNDY4__Transaction__c = 'Invoice';
                sinvacctRule911New.KNDY4__SubTransaction_Type__c = 'Goods';
                sinvacctRule911New.KNDY4__Rule_Type__c = 'DR';
                sinvacctRule911New.KNDY4__Default_GL_Account__c = true;
                sinvacctRule911New.KNDY4__GL_Account_Reference_Value__c = null;
                sinvacctRule911New.KNDY4__GL_Account__c = GRNIGL.id;
                sinvacctRule911New.KNDY4__Amount_Reference__c = 'KNDY4__Purchase_Price__c';
                sinvacctRule911New.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule911New);

                KNDY4__Accounting_Rule__c sinvacctRule922New = new KNDY4__Accounting_Rule__c();
                sinvacctRule922New.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule922New.KNDY4__company__c = company.id;
                sinvacctRule922New.KNDY4__Transaction__c = 'Invoice';
                sinvacctRule922New.KNDY4__SubTransaction_Type__c = 'Goods';
                sinvacctRule922New.KNDY4__Rule_Type__c = 'CR';
                sinvacctRule922New.KNDY4__Default_GL_Account__c = true;
                sinvacctRule922New.KNDY4__GL_Account_Reference_Value__c = null;
                sinvacctRule922New.KNDY4__GL_Account__c = IPVGL.id;
                sinvacctRule922New.KNDY4__Amount_Reference__c = 'KNDY4__Purchase_Price__c';
                sinvacctRule922New.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule922New);

                KNDY4__Accounting_Rule__c sinvacctRule7New = new KNDY4__Accounting_Rule__c();
                sinvacctRule7New.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule7New.KNDY4__company__c = company.id;
                sinvacctRule7New.KNDY4__Transaction__c = 'Invoice';
                sinvacctRule7New.KNDY4__SubTransaction_Type__c = 'Expense';
                //sinvacctRule7New.KNDY4__Segment_Name__c = 'KNDY4__GL_Account__c';
                sinvacctRule7New.KNDY4__Rule_Type__c = 'CR';
                //sinvacctRule7New.KNDY4__Criteria__c = 'Item Class';
                sinvacctRule7New.KNDY4__Default_GL_Account__c = false;
                sinvacctRule7New.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__Item__r.KNDY4__Class__r.KNDY4__Inventory_GL_Account__c';
                sinvacctRule7New.KNDY4__GL_Account__c = null;
                sinvacctRule7New.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule7New);

                KNDY4__Accounting_Rule__c sinvacctRule8New = new KNDY4__Accounting_Rule__c();
                sinvacctRule8New.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule8New.KNDY4__company__c = company.id;
                sinvacctRule8New.KNDY4__Transaction__c = 'Invoice';
                sinvacctRule8New.KNDY4__SubTransaction_Type__c = 'Expense';
                //sinvacctRule8New.KNDY4__Segment_Name__c = 'KNDY4__GL_Account__c';
                sinvacctRule8New.KNDY4__Rule_Type__c = 'DR';
                //sinvacctRule8New.KNDY4__Criteria__c = 'Accounting Default';
                sinvacctRule8New.KNDY4__Default_GL_Account__c = true;
                sinvacctRule8New.KNDY4__GL_Account_Reference_Value__c = null;
                sinvacctRule8New.KNDY4__GL_Account__c = GRNIGL.id;
                sinvacctRule8New.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule8New);

                KNDY4__Accounting_Rule__c sinvacctRule9New = new KNDY4__Accounting_Rule__c();
                sinvacctRule9New.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule9New.KNDY4__company__c = company.id;
                sinvacctRule9New.KNDY4__Transaction__c = 'Invoice';
                sinvacctRule9New.KNDY4__SubTransaction_Type__c = 'Miscellaneous';
                //sinvacctRule9New.KNDY4__Segment_Name__c = 'KNDY4__GL_Account__c';
                sinvacctRule9New.KNDY4__Rule_Type__c = 'CR';
                //sinvacctRule9New.KNDY4__Criteria__c = 'Item Class';
                sinvacctRule9New.KNDY4__Default_GL_Account__c = false;
                sinvacctRule9New.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__Item__r.KNDY4__Class__r.KNDY4__Inventory_GL_Account__c';
                sinvacctRule9New.KNDY4__GL_Account__c = null;
                sinvacctRule9New.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule9New);

                KNDY4__Accounting_Rule__c sinvacctRule10New = new KNDY4__Accounting_Rule__c();
                sinvacctRule10New.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule10New.KNDY4__company__c = company.id;
                sinvacctRule10New.KNDY4__Transaction__c = 'Invoice';
                sinvacctRule10New.KNDY4__SubTransaction_Type__c = 'Miscellaneous';
                //sinvacctRule10New.KNDY4__Segment_Name__c = 'KNDY4__GL_Account__c';
                sinvacctRule10New.KNDY4__Rule_Type__c = 'DR';
                //sinvacctRule10New.KNDY4__Criteria__c = 'Accounting Default';
                sinvacctRule10New.KNDY4__Default_GL_Account__c = true;
                sinvacctRule10New.KNDY4__GL_Account_Reference_Value__c = null;
                sinvacctRule10New.KNDY4__GL_Account__c = GRNIGL.id;
                sinvacctRule10New.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule10New);

                KNDY4__Accounting_Rule__c sinvacctRule31New = new KNDY4__Accounting_Rule__c();
                sinvacctRule31New.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule31New.KNDY4__company__c = company.id;
                sinvacctRule31New.KNDY4__Transaction__c = 'Invoice';
                sinvacctRule31New.KNDY4__SubTransaction_Type__c = null;
                sinvacctRule31New.KNDY4__Rule_Type__c = 'CR';
                sinvacctRule31New.KNDY4__Default_GL_Account__c = false;
                sinvacctRule31New.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__Item__r.KNDY4__Class__r.KNDY4__Inventory_GL_Account__c';
                sinvacctRule31New.KNDY4__GL_Account__c = null;
                sinvacctRule31New.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule31New);

                KNDY4__Accounting_Rule__c sinvacctRule32New = new KNDY4__Accounting_Rule__c();
                sinvacctRule32New.KNDY4__Object_Name__c = 'KNDY4__Supplier_Invoice__c';
                //sinvacctRule32New.KNDY4__company__c = company.id;
                sinvacctRule32New.KNDY4__Transaction__c = 'Invoice';
                sinvacctRule32New.KNDY4__SubTransaction_Type__c = null;
                sinvacctRule32New.KNDY4__Rule_Type__c = 'DR';
                sinvacctRule32New.KNDY4__Default_GL_Account__c = true;
                sinvacctRule32New.KNDY4__GL_Account_Reference_Value__c = null;
                sinvacctRule32New.KNDY4__GL_Account__c = GRNIGL.id;
                sinvacctRule32New.KNDY4__Company_Ledger__c = true;
                SuppInvAcctRulesList.add(sinvacctRule32New);
                //Adding Effectivity to the accounting rules.
                for(KNDY4__Accounting_rule__c rule:SuppInvAcctRulesList)
                {
                    rule.KNDY4__Effective_Start_Date__c= effStartDate;
                    rule.KNDY4__Accounting_Standard__c = accountingStandard.Id;
                }

                insert SuppInvAcctRulesList;
            }
            update SuppInvAcctRulesList;

            return SuppInvAcctRulesList;
        }
        set;
    }

    public List<KNDY4__Accounting_Rule__c> SuppPaymentAcctRulesList {
        get {
            if (SuppPaymentAcctRulesList == null) {
                SuppPaymentAcctRulesList = new List<KNDY4__Accounting_Rule__c>();

                KNDY4__Accounting_Rule__c suppayacctRule1 = new KNDY4__Accounting_Rule__c();
                suppayacctRule1.KNDY4__Object_Name__c = 'KNDY4__Supplier_Payment__c';
                //suppayacctRule1.KNDY4__company__c = company.id;
                suppayacctRule1.KNDY4__Transaction__c = 'Supplier Payment';
                suppayacctRule1.KNDY4__SubTransaction_Type__c = 'Payment';
                //suppayacctRule1.KNDY4__Segment_Name__c = 'KNDY4__GL_Account__c';
                suppayacctRule1.KNDY4__Rule_Type__c = 'DR';
                //suppayacctRule1.KNDY4__Criteria__c = 'Accounting Default';
                suppayacctRule1.KNDY4__Default_GL_Account__c = true;
                suppayacctRule1.KNDY4__GL_Account_Reference_Value__c = null;
                suppayacctRule1.KNDY4__GL_Account__c = payablesGL.id;
                suppayacctRule1.KNDY4__Amount_Reference__c = null;
                suppayacctRule1.KNDY4__Company_Ledger__c = true;
                SuppPaymentAcctRulesList.add(suppayacctRule1);

                KNDY4__Accounting_Rule__c suppayacctRule2 = new KNDY4__Accounting_Rule__c();
                suppayacctRule2.KNDY4__Object_Name__c = 'KNDY4__Supplier_Payment__c';
                //suppayacctRule2.KNDY4__company__c = company.id;
                suppayacctRule2.KNDY4__Transaction__c = 'Supplier Payment';
                suppayacctRule2.KNDY4__SubTransaction_Type__c = 'Payment';
                //suppayacctRule2.KNDY4__Segment_Name__c = 'KNDY4__GL_Account__c';
                suppayacctRule2.KNDY4__Rule_Type__c = 'CR';
                //suppayacctRule2.KNDY4__Criteria__c = 'Bank Account';
                suppayacctRule2.KNDY4__Default_GL_Account__c = false;
                suppayacctRule2.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__Supplier_Payment__r.KNDY4__Bank_Account__r.KNDY4__GL_Account__c';
                suppayacctRule2.KNDY4__GL_Account__c = null;
                suppayacctRule2.KNDY4__Amount_Reference__c = null;
                suppayacctRule2.KNDY4__Company_Ledger__c = true;
                SuppPaymentAcctRulesList.add(suppayacctRule2);

                KNDY4__Accounting_Rule__c suppayacctRule3 = new KNDY4__Accounting_Rule__c();
                suppayacctRule3.KNDY4__Object_Name__c = 'KNDY4__Supplier_Payment__c';
                //suppayacctRule3.KNDY4__company__c = company.id;
                suppayacctRule3.KNDY4__Transaction__c = 'Supplier Payment';
                suppayacctRule3.KNDY4__SubTransaction_Type__c = 'Earned Terms Discount';
                //suppayacctRule3.KNDY4__Segment_Name__c = 'KNDY4__GL_Account__c';
                suppayacctRule3.KNDY4__Rule_Type__c = 'CR';
                //suppayacctRule3.KNDY4__Criteria__c = 'Accounting Default';
                suppayacctRule3.KNDY4__Default_GL_Account__c = true;
                suppayacctRule3.KNDY4__GL_Account_Reference_Value__c = null;
                suppayacctRule3.KNDY4__GL_Account__c = payablesGL.id;
                suppayacctRule3.KNDY4__Amount_Reference__c = null;
                suppayacctRule3.KNDY4__Company_Ledger__c = true;
                SuppPaymentAcctRulesList.add(suppayacctRule3);

                KNDY4__Accounting_Rule__c suppayacctRule4 = new KNDY4__Accounting_Rule__c();
                suppayacctRule4.KNDY4__Object_Name__c = 'KNDY4__Supplier_Payment__c';
                //suppayacctRule4.KNDY4__company__c = company.id;
                suppayacctRule4.KNDY4__Transaction__c = 'Supplier Payment';
                suppayacctRule4.KNDY4__SubTransaction_Type__c = 'Earned Terms Discount';
                //suppayacctRule4.KNDY4__Segment_Name__c = 'KNDY4__GL_Account__c';
                suppayacctRule4.KNDY4__Rule_Type__c = 'DR';
                //suppayacctRule4.KNDY4__Criteria__c = 'Accounting Default';
                suppayacctRule4.KNDY4__Default_GL_Account__c = true;
                suppayacctRule4.KNDY4__GL_Account_Reference_Value__c = null;
                suppayacctRule4.KNDY4__GL_Account__c = payablesGL.id;
                suppayacctRule4.KNDY4__Amount_Reference__c = null;
                suppayacctRule4.KNDY4__Company_Ledger__c = true;
                SuppPaymentAcctRulesList.add(suppayacctRule4);

                KNDY4__Accounting_Rule__c suppayacctRule5 = new KNDY4__Accounting_Rule__c();
                suppayacctRule5.KNDY4__Object_Name__c = 'KNDY4__Supplier_Payment__c';
                //suppayacctRule1.KNDY4__company__c = company.id;
                suppayacctRule5.KNDY4__Transaction__c = 'Payment';
                suppayacctRule5.KNDY4__SubTransaction_Type__c = 'Payment';
                //suppayacctRule1.KNDY4__Segment_Name__c = 'KNDY4__GL_Account__c';
                suppayacctRule5.KNDY4__Rule_Type__c = 'DR';
                //suppayacctRule1.KNDY4__Criteria__c = 'Accounting Default';
                suppayacctRule5.KNDY4__Default_GL_Account__c = true;
                suppayacctRule5.KNDY4__GL_Account_Reference_Value__c = null;
                suppayacctRule5.KNDY4__GL_Account__c = payablesGL.id;
                suppayacctRule5.KNDY4__Amount_Reference__c = null;
                suppayacctRule5.KNDY4__Company_Ledger__c = true;
                SuppPaymentAcctRulesList.add(suppayacctRule5);

                KNDY4__Accounting_Rule__c suppayacctRule6 = new KNDY4__Accounting_Rule__c();
                suppayacctRule6.KNDY4__Object_Name__c = 'KNDY4__Supplier_Payment__c';
                //suppayacctRule2.KNDY4__company__c = company.id;
                suppayacctRule6.KNDY4__Transaction__c = 'Payment';
                suppayacctRule6.KNDY4__SubTransaction_Type__c = 'Payment';
                //suppayacctRule2.KNDY4__Segment_Name__c = 'KNDY4__GL_Account__c';
                suppayacctRule6.KNDY4__Rule_Type__c = 'CR';
                //suppayacctRule2.KNDY4__Criteria__c = 'Bank Account';
                suppayacctRule6.KNDY4__Default_GL_Account__c = false;
                suppayacctRule6.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__Supplier_Payment__r.KNDY4__Bank_Account__r.KNDY4__GL_Account__c';
                suppayacctRule6.KNDY4__GL_Account__c = null;
                suppayacctRule6.KNDY4__Amount_Reference__c = null;
                suppayacctRule6.KNDY4__Company_Ledger__c = true;
                SuppPaymentAcctRulesList.add(suppayacctRule6);

                KNDY4__Accounting_Rule__c suppayacctRule7 = new KNDY4__Accounting_Rule__c();
                suppayacctRule7.KNDY4__Object_Name__c = 'KNDY4__Supplier_Payment__c';
                //suppayacctRule3.KNDY4__company__c = company.id;
                suppayacctRule7.KNDY4__Transaction__c = 'Payment';
                suppayacctRule7.KNDY4__SubTransaction_Type__c = 'Earned Terms Discount';
                //suppayacctRule3.KNDY4__Segment_Name__c = 'KNDY4__GL_Account__c';
                suppayacctRule7.KNDY4__Rule_Type__c = 'CR';
                //suppayacctRule3.KNDY4__Criteria__c = 'Accounting Default';
                suppayacctRule7.KNDY4__Default_GL_Account__c = true;
                suppayacctRule7.KNDY4__GL_Account_Reference_Value__c = null;
                suppayacctRule7.KNDY4__GL_Account__c = payablesGL.id;
                suppayacctRule7.KNDY4__Amount_Reference__c = null;
                suppayacctRule7.KNDY4__Company_Ledger__c = true;
                SuppPaymentAcctRulesList.add(suppayacctRule7);

                KNDY4__Accounting_Rule__c suppayacctRule8 = new KNDY4__Accounting_Rule__c();
                suppayacctRule8.KNDY4__Object_Name__c = 'KNDY4__Supplier_Payment__c';
                //suppayacctRule4.KNDY4__company__c = company.id;
                suppayacctRule8.KNDY4__Transaction__c = 'Payment';
                suppayacctRule8.KNDY4__SubTransaction_Type__c = 'Earned Terms Discount';
                //suppayacctRule4.KNDY4__Segment_Name__c = 'KNDY4__GL_Account__c';
                suppayacctRule8.KNDY4__Rule_Type__c = 'DR';
                //suppayacctRule4.KNDY4__Criteria__c = 'Accounting Default';
                suppayacctRule8.KNDY4__Default_GL_Account__c = true;
                suppayacctRule8.KNDY4__GL_Account_Reference_Value__c = null;
                suppayacctRule8.KNDY4__GL_Account__c = payablesGL.id;
                suppayacctRule8.KNDY4__Amount_Reference__c = null;
                suppayacctRule4.KNDY4__Company_Ledger__c = true;
                SuppPaymentAcctRulesList.add(suppayacctRule8);


                //Adding Effectivity to the accounting rules.
                for(KNDY4__Accounting_rule__c rule:SuppPaymentAcctRulesList)
                {
                    rule.KNDY4__Effective_Start_Date__c= effStartDate;
                    rule.KNDY4__Accounting_Standard__c = accountingStandard.Id;
                }
                insert SuppPaymentAcctRulesList;
            }
            update SuppPaymentAcctRulesList;

            return SuppPaymentAcctRulesList;
        }
        set;
    }

    public List<KNDY4__Accounting_Rule__c> rdAccountingRuleList {
        get {
            if (rdAccountingRuleList == null) {
                rdAccountingRuleList = new List<KNDY4__Accounting_Rule__c>();

                KNDY4__Accounting_Rule__c rcptacctRule1 = new KNDY4__Accounting_Rule__c();
                rcptacctRule1.KNDY4__Object_Name__c = 'KNDY4__Receiving_Document__c';
                //rcptacctRule1.KNDY4__company__c = company.id;
                rcptacctRule1.KNDY4__Transaction__c = 'Purchase Order Receipt';
                rcptacctRule1.KNDY4__SubTransaction_Type__c = 'Goods';
                rcptacctRule1.KNDY4__Rule_Type__c = 'CR';
                rcptacctRule1.KNDY4__Default_GL_Account__c = true;
                rcptacctRule1.KNDY4__GL_Account__c = GRNIGL.id;
                rcptacctRule1.KNDY4__Amount_Reference__c = 'KNDY4__Purchase_Price__c';
                rcptacctRule1.KNDY4__Company_Ledger__c = true;
                rdAccountingRuleList.add(rcptacctRule1);

                KNDY4__Accounting_Rule__c rcptacctRule2 = new KNDY4__Accounting_Rule__c();
                rcptacctRule2.KNDY4__Object_Name__c = 'KNDY4__Receiving_Document__c';
                //rcptacctRule2.KNDY4__company__c = company.id;
                //FIN-566 fix -ASN Accounting
                rcptacctRule2.KNDY4__Transaction__c = 'Purchase Order Receipt';
                rcptacctRule2.KNDY4__SubTransaction_Type__c = 'Goods';
                rcptacctRule2.KNDY4__Rule_Type__c = 'DR';
                rcptacctRule2.KNDY4__Default_GL_Account__c = true;
                rcptacctRule2.KNDY4__GL_Account_Reference_Value__c = null;
                rcptacctRule2.KNDY4__GL_Account__c = FGInventoryGL.id;
                rcptacctRule2.KNDY4__Amount_Reference__c = null;
                rcptacctRule2.KNDY4__Company_Ledger__c = true;
                rdAccountingRuleList.add(rcptacctRule2);

                KNDY4__Accounting_Rule__c rcptacctRule10 = new KNDY4__Accounting_Rule__c();
                rcptacctRule10.KNDY4__Object_Name__c = 'KNDY4__Receiving_Document__c';
                //rcptacctRule10.KNDY4__company__c = company.id;
                rcptacctRule10.KNDY4__Transaction__c = 'Advanced Shipment Notice';
                rcptacctRule10.KNDY4__SubTransaction_Type__c = 'Goods';
                rcptacctRule10.KNDY4__Rule_Type__c = 'CR';
                rcptacctRule10.KNDY4__Default_GL_Account__c = true;
                rcptacctRule10.KNDY4__GL_Account__c = GRNIGL.id;
                rcptacctRule10.KNDY4__Amount_Reference__c = 'KNDY4__Purchase_Price__c';
                rcptacctRule10.KNDY4__Company_Ledger__c = true;
                rdAccountingRuleList.add(rcptacctRule10);

                KNDY4__Accounting_Rule__c rcptacctRule20 = new KNDY4__Accounting_Rule__c();
                rcptacctRule20.KNDY4__Object_Name__c = 'KNDY4__Receiving_Document__c';
                //rcptacctRule20.KNDY4__company__c = company.id;
                rcptacctRule20.KNDY4__Transaction__c = 'Advanced Shipment Notice';
                rcptacctRule20.KNDY4__SubTransaction_Type__c = 'Goods';
                rcptacctRule20.KNDY4__Rule_Type__c = 'DR';
                rcptacctRule20.KNDY4__Default_GL_Account__c = true;
                rcptacctRule20.KNDY4__GL_Account_Reference_Value__c = null;
                rcptacctRule20.KNDY4__GL_Account__c = FGInventoryGL.id;
                rcptacctRule20.KNDY4__Amount_Reference__c = null;
                rcptacctRule20.KNDY4__Company_Ledger__c = true;
                rdAccountingRuleList.add(rcptacctRule20);

                KNDY4__Accounting_Rule__c rcptacctRule11 = new KNDY4__Accounting_Rule__c();
                rcptacctRule11.KNDY4__Object_Name__c = 'KNDY4__Receiving_Document__c';
                //rcptacctRule11.KNDY4__company__c = company.id;
                rcptacctRule11.KNDY4__Transaction__c = 'Purchase Order Receipt';
                rcptacctRule11.KNDY4__SubTransaction_Type__c = 'Goods';
                rcptacctRule11.KNDY4__Rule_Type__c = 'CR';
                rcptacctRule11.KNDY4__Default_GL_Account__c = true;
                rcptacctRule11.KNDY4__GL_Account_Reference_Value__c = null;
                rcptacctRule11.KNDY4__GL_Account__c = PPVGL.id;
                rcptacctRule11.KNDY4__Amount_Reference__c = null;
                rcptacctRule11.KNDY4__Company_Ledger__c = true;
                rdAccountingRuleList.add(rcptacctRule11);

                KNDY4__Accounting_Rule__c rcptacctRule12 = new KNDY4__Accounting_Rule__c();
                rcptacctRule12.KNDY4__Object_Name__c = 'KNDY4__Receiving_Document__c';
                //rcptacctRule12.KNDY4__company__c = company.id;
                rcptacctRule12.KNDY4__Transaction__c = 'Advanced Shipment Notice';
                rcptacctRule12.KNDY4__SubTransaction_Type__c = 'Goods';
                rcptacctRule12.KNDY4__Rule_Type__c = 'CR';
                rcptacctRule12.KNDY4__Default_GL_Account__c = true;
                rcptacctRule12.KNDY4__GL_Account_Reference_Value__c = null;
                rcptacctRule12.KNDY4__GL_Account__c = PPVGL.id;
                rcptacctRule12.KNDY4__Amount_Reference__c = null;
                rcptacctRule12.KNDY4__Company_Ledger__c = true;
                rdAccountingRuleList.add(rcptacctRule12);

                KNDY4__Accounting_Rule__c rcptacctRule22 = new KNDY4__Accounting_Rule__c();
                rcptacctRule22.KNDY4__Object_Name__c = 'KNDY4__Receiving_Document__c';
                //rcptacctRule22.KNDY4__company__c = company.id;
                rcptacctRule22.KNDY4__Transaction__c = 'Purchase Order Receipt';
                rcptacctRule22.KNDY4__SubTransaction_Type__c = 'Goods';
                rcptacctRule22.KNDY4__Rule_Type__c = 'DR';
                rcptacctRule22.KNDY4__Default_GL_Account__c = true;
                rcptacctRule22.KNDY4__GL_Account__c = PPVGL.Id;
                rcptacctRule22.KNDY4__Amount_Reference__c = 'KNDY4__Purchase_Price__c';
                rcptacctRule22.KNDY4__Company_Ledger__c = true;
                rdAccountingRuleList.add(rcptacctRule22);

                KNDY4__Accounting_Rule__c rcptacctRule23 = new KNDY4__Accounting_Rule__c();
                rcptacctRule23.KNDY4__Object_Name__c = 'KNDY4__Receiving_Document__c';
                //rcptacctRule23.KNDY4__company__c = company.id;
                rcptacctRule23.KNDY4__Transaction__c = 'Advanced Shipment Notice';
                rcptacctRule23.KNDY4__SubTransaction_Type__c = 'Goods';
                rcptacctRule23.KNDY4__Rule_Type__c = 'DR';
                rcptacctRule23.KNDY4__Default_GL_Account__c = true;
                rcptacctRule23.KNDY4__GL_Account__c = PPVGL.Id;
                rcptacctRule23.KNDY4__Amount_Reference__c = 'KNDY4__Purchase_Price__c';
                rcptacctRule23.KNDY4__Company_Ledger__c = true;
                rdAccountingRuleList.add(rcptacctRule23);

                KNDY4__Accounting_Rule__c rcptacctRule3 = new KNDY4__Accounting_Rule__c();
                rcptacctRule3.KNDY4__Object_Name__c = 'KNDY4__Receiving_Document__c';
                //rcptacctRule3.KNDY4__company__c = company.id;
                rcptacctRule3.KNDY4__Transaction__c = 'Purchase Order Receipt';
                rcptacctRule3.KNDY4__SubTransaction_Type__c = 'Expense';
                rcptacctRule3.KNDY4__Rule_Type__c = 'CR';
                rcptacctRule3.KNDY4__Default_GL_Account__c = false;
                rcptacctRule3.KNDY4__GL_Account_Reference_Value__c = null;
                rcptacctRule3.KNDY4__GL_Account__c = GRNIGL.id;
                rcptacctRule3.KNDY4__Amount_Reference__c = null;
                rcptacctRule3.KNDY4__Company_Ledger__c = true;
                rdAccountingRuleList.add(rcptacctRule3);

                KNDY4__Accounting_Rule__c rcptacctRule30 = new KNDY4__Accounting_Rule__c();
                rcptacctRule30.KNDY4__Object_Name__c = 'KNDY4__Receiving_Document__c';
                //rcptacctRule30.KNDY4__company__c = company.id;
                rcptacctRule30.KNDY4__Transaction__c = 'Advanced Shipment Notice';
                rcptacctRule30.KNDY4__SubTransaction_Type__c = 'Expense';
                rcptacctRule30.KNDY4__Rule_Type__c = 'CR';
                rcptacctRule30.KNDY4__Default_GL_Account__c = false;
                rcptacctRule30.KNDY4__GL_Account_Reference_Value__c = null;
                rcptacctRule30.KNDY4__GL_Account__c = GRNIGL.id;
                rcptacctRule30.KNDY4__Amount_Reference__c = null;
                rcptacctRule30.KNDY4__Company_Ledger__c = true;
                rdAccountingRuleList.add(rcptacctRule30);

                KNDY4__Accounting_Rule__c rcptacctRule4 = new KNDY4__Accounting_Rule__c();
                rcptacctRule4.KNDY4__Object_Name__c = 'KNDY4__Receiving_Document__c';
                //rcptacctRule4.KNDY4__company__c = company.id;
                rcptacctRule4.KNDY4__Transaction__c = 'Purchase Order Receipt';
                rcptacctRule4.KNDY4__SubTransaction_Type__c = 'Expense';
                rcptacctRule4.KNDY4__Rule_Type__c = 'DR';
                rcptacctRule4.KNDY4__Default_GL_Account__c = false;
                rcptacctRule4.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__Item__r.KNDY4__Class__r.KNDY4__Inventory_GL_Account__c';
                rcptacctRule4.KNDY4__GL_Account__c = null;
                rcptacctRule4.KNDY4__Amount_Reference__c = null;
                rcptacctRule4.KNDY4__Company_Ledger__c = true;
                rdAccountingRuleList.add(rcptacctRule4);

                KNDY4__Accounting_Rule__c rcptacctRule40 = new KNDY4__Accounting_Rule__c();
                rcptacctRule40.KNDY4__Object_Name__c = 'KNDY4__Receiving_Document__c';
                //rcptacctRule40.KNDY4__company__c = company.id;
                rcptacctRule40.KNDY4__Transaction__c = 'Advanced Shipment Notice';
                rcptacctRule40.KNDY4__SubTransaction_Type__c = 'Expense';
                rcptacctRule40.KNDY4__Rule_Type__c = 'DR';
                rcptacctRule40.KNDY4__Default_GL_Account__c = false;
                rcptacctRule40.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__Item__r.KNDY4__Class__r.KNDY4__Inventory_GL_Account__c';
                rcptacctRule40.KNDY4__GL_Account__c = null;
                rcptacctRule40.KNDY4__Amount_Reference__c = null;
                rcptacctRule40.KNDY4__Company_Ledger__c = true;
                rdAccountingRuleList.add(rcptacctRule40);

                KNDY4__Accounting_Rule__c rcptacctRule5 = new KNDY4__Accounting_Rule__c();
                rcptacctRule5.KNDY4__Object_Name__c = 'KNDY4__Receiving_Document__c';
                //rcptacctRule5.KNDY4__company__c = company.id;
                rcptacctRule5.KNDY4__Transaction__c = 'Purchase Order Receipt';
                rcptacctRule5.KNDY4__SubTransaction_Type__c = 'Miscellaneous';
                rcptacctRule5.KNDY4__Rule_Type__c = 'CR';
                rcptacctRule5.KNDY4__Default_GL_Account__c = false;
                rcptacctRule5.KNDY4__GL_Account_Reference_Value__c = null;
                rcptacctRule5.KNDY4__GL_Account__c = GRNIGL.id;
                rcptacctRule5.KNDY4__Amount_Reference__c = null;
                rcptacctRule5.KNDY4__Company_Ledger__c = true;
                rdAccountingRuleList.add(rcptacctRule5);

                KNDY4__Accounting_Rule__c rcptacctRule50 = new KNDY4__Accounting_Rule__c();
                rcptacctRule50.KNDY4__Object_Name__c = 'KNDY4__Receiving_Document__c';
                //rcptacctRule50.KNDY4__company__c = company.id;
                rcptacctRule50.KNDY4__Transaction__c = 'Advanced Shipment Notice';
                rcptacctRule50.KNDY4__SubTransaction_Type__c = 'Miscellaneous';
                rcptacctRule50.KNDY4__Rule_Type__c = 'CR';
                rcptacctRule50.KNDY4__Default_GL_Account__c = false;
                rcptacctRule50.KNDY4__GL_Account_Reference_Value__c = null;
                rcptacctRule50.KNDY4__GL_Account__c = GRNIGL.id;
                rcptacctRule50.KNDY4__Amount_Reference__c = null;
                rcptacctRule50.KNDY4__Company_Ledger__c = true;
                rdAccountingRuleList.add(rcptacctRule50);

                KNDY4__Accounting_Rule__c rcptacctRule6 = new KNDY4__Accounting_Rule__c();
                rcptacctRule6.KNDY4__Object_Name__c = 'KNDY4__Receiving_Document__c';
                //rcptacctRule6.KNDY4__company__c = company.id;
                rcptacctRule6.KNDY4__Transaction__c = 'Purchase Order Receipt';
                rcptacctRule6.KNDY4__SubTransaction_Type__c = 'Miscellaneous';
                rcptacctRule6.KNDY4__Rule_Type__c = 'DR';
                rcptacctRule6.KNDY4__Default_GL_Account__c = false;
                rcptacctRule6.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__Item__r.KNDY4__Class__r.KNDY4__Inventory_GL_Account__c';
                rcptacctRule6.KNDY4__GL_Account__c = null;
                rcptacctRule6.KNDY4__Amount_Reference__c = null;
                rcptacctRule6.KNDY4__Company_Ledger__c = true;
                rdAccountingRuleList.add(rcptacctRule6);

                KNDY4__Accounting_Rule__c rcptacctRule60 = new KNDY4__Accounting_Rule__c();
                rcptacctRule60.KNDY4__Object_Name__c = 'KNDY4__Receiving_Document__c';
                //rcptacctRule60.KNDY4__company__c = company.id;
                rcptacctRule60.KNDY4__Transaction__c = 'Advanced Shipment Notice';
                rcptacctRule60.KNDY4__SubTransaction_Type__c = 'Miscellaneous';
                rcptacctRule60.KNDY4__Rule_Type__c = 'DR';
                rcptacctRule60.KNDY4__Default_GL_Account__c = false;
                rcptacctRule60.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__Item__r.KNDY4__Class__r.KNDY4__Inventory_GL_Account__c';
                rcptacctRule60.KNDY4__GL_Account__c = null;
                rcptacctRule60.KNDY4__Amount_Reference__c = null;
                rcptacctRule60.KNDY4__Company_Ledger__c = true;
                rdAccountingRuleList.add(rcptacctRule60);

                KNDY4__Accounting_Rule__c rcptacctRule7 = new KNDY4__Accounting_Rule__c();
                rcptacctRule7.KNDY4__Object_Name__c = 'KNDY4__Receiving_Document__c';
                //rcptacctRule7.KNDY4__company__c = company.id;
                rcptacctRule7.KNDY4__Transaction__c = 'Purchase Order Receipt';
                rcptacctRule7.KNDY4__SubTransaction_Type__c = null;
                rcptacctRule7.KNDY4__Rule_Type__c = 'CR';
                rcptacctRule7.KNDY4__Default_GL_Account__c = false;
                rcptacctRule7.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__Item__r.KNDY4__Class__r.KNDY4__Inventory_GL_Account__c';
                rcptacctRule7.KNDY4__GL_Account__c = null;
                rcptacctRule7.KNDY4__Amount_Reference__c = null;
                rcptacctRule7.KNDY4__Company_Ledger__c = true;
                rdAccountingRuleList.add(rcptacctRule7);

                KNDY4__Accounting_Rule__c rcptacctRule70 = new KNDY4__Accounting_Rule__c();
                rcptacctRule70.KNDY4__Object_Name__c = 'KNDY4__Receiving_Document__c';
                //rcptacctRule70.KNDY4__company__c = company.id;
                rcptacctRule70.KNDY4__Transaction__c = 'Advanced Shipment Notice';
                rcptacctRule70.KNDY4__SubTransaction_Type__c = null;
                rcptacctRule70.KNDY4__Rule_Type__c = 'CR';
                rcptacctRule70.KNDY4__Default_GL_Account__c = false;
                rcptacctRule70.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__Item__r.KNDY4__Class__r.KNDY4__Inventory_GL_Account__c';
                rcptacctRule70.KNDY4__GL_Account__c = null;
                rcptacctRule70.KNDY4__Amount_Reference__c = null;
                rcptacctRule70.KNDY4__Company_Ledger__c = true;
                rdAccountingRuleList.add(rcptacctRule70);

                KNDY4__Accounting_Rule__c rcptacctRule8 = new KNDY4__Accounting_Rule__c();
                rcptacctRule8.KNDY4__Object_Name__c = 'KNDY4__Receiving_Document__c';
                //rcptacctRule8.KNDY4__company__c = company.id;
                rcptacctRule8.KNDY4__Transaction__c = 'Purchase Order Receipt';
                rcptacctRule8.KNDY4__SubTransaction_Type__c = null;
                rcptacctRule8.KNDY4__Rule_Type__c = 'DR';
                rcptacctRule8.KNDY4__Default_GL_Account__c = false;
                rcptacctRule8.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__Item__r.KNDY4__Class__r.KNDY4__Inventory_GL_Account__c';
                rcptacctRule8.KNDY4__GL_Account__c = null;
                rcptacctRule8.KNDY4__Amount_Reference__c = null;
                rcptacctRule8.KNDY4__Company_Ledger__c = true;
                rdAccountingRuleList.add(rcptacctRule8);

                KNDY4__Accounting_Rule__c rcptacctRule80 = new KNDY4__Accounting_Rule__c();
                rcptacctRule80.KNDY4__Object_Name__c = 'KNDY4__Receiving_Document__c';
                //rcptacctRule80.KNDY4__company__c = company.id;
                rcptacctRule80.KNDY4__Transaction__c = 'Advanced Shipment Notice';
                rcptacctRule80.KNDY4__SubTransaction_Type__c = null;
                rcptacctRule80.KNDY4__Rule_Type__c = 'DR';
                rcptacctRule80.KNDY4__Default_GL_Account__c = false;
                rcptacctRule80.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__Item__r.KNDY4__Class__r.KNDY4__Inventory_GL_Account__c';
                rcptacctRule80.KNDY4__GL_Account__c = null;
                rcptacctRule80.KNDY4__Amount_Reference__c = null;
                rcptacctRule80.KNDY4__Company_Ledger__c = true;
                rdAccountingRuleList.add(rcptacctRule80);

                //Adding Effectivity to the accounting rules.
                for(KNDY4__Accounting_rule__c rule:rdAccountingRuleList)
                {
                    rule.KNDY4__Effective_Start_Date__c= effStartDate;
                    rule.KNDY4__Accounting_Standard__c = accountingStandard.Id;
                }
                insert rdAccountingRuleList;
            }
            update rdAccountingRuleList;

            return rdAccountingRuleList;
        }
        set;
    }



    public List<KNDY4__Accounting_Rule__c> ciAccountingRuleList {
        get {
            if (ciAccountingRuleList == null) {
                ciAccountingRuleList = new List<KNDY4__Accounting_Rule__c>();

                KNDY4__Accounting_Rule__c custInvCR = new KNDY4__Accounting_Rule__c();
                custInvCR.KNDY4__Object_Name__c = 'KNDY4__Customer_Invoice__c';
                custInvCR.KNDY4__Transaction__c = 'Ship Invoice';
                custInvCR.KNDY4__SubTransaction_Type__c = 'Goods';
                custInvCR.KNDY4__Rule_Type__c = 'CR';
                custInvCR.KNDY4__Default_GL_Account__c = true;
                custInvCR.KNDY4__GL_Account_Reference_Value__c = null;
                custInvCR.KNDY4__GL_Account__c = cashGL.id;
                ciAccountingRuleList.add(custInvCR);

                KNDY4__Accounting_Rule__c custInvDR = new KNDY4__Accounting_Rule__c();
                custInvDR.KNDY4__Object_Name__c = 'KNDY4__Customer_Invoice__c';
                custInvDR.KNDY4__Transaction__c = 'Ship Invoice';
                custInvDR.KNDY4__SubTransaction_Type__c = 'Goods';
                custInvDR.KNDY4__Rule_Type__c = 'DR';
                custInvDR.KNDY4__Default_GL_Account__c = true;
                custInvDR.KNDY4__GL_Account_Reference_Value__c = null;
                custInvDR.KNDY4__GL_Account__c = receivablesGL.id;
                ciAccountingRuleList.add(custInvDR);

                KNDY4__Accounting_Rule__c shipInvCR = new KNDY4__Accounting_Rule__c();
                shipInvCR.KNDY4__Object_Name__c = 'KNDY4__Customer_Invoice__c';
                shipInvCR.KNDY4__Transaction__c = 'Ship Invoice';
                shipInvCR.KNDY4__Rule_Type__c = 'CR';
                shipInvCR.KNDY4__Default_GL_Account__c = true;
                shipInvCR.KNDY4__GL_Account_Reference_Value__c = null;
                shipInvCR.KNDY4__GL_Account__c = cashGL.id;
                ciAccountingRuleList.add(shipInvCR);

                KNDY4__Accounting_Rule__c shipInvDR = new KNDY4__Accounting_Rule__c();
                shipInvDR.KNDY4__Object_Name__c = 'KNDY4__Customer_Invoice__c';
                shipInvDR.KNDY4__Transaction__c = 'Ship Invoice';
                shipInvDR.KNDY4__Rule_Type__c = 'DR';
                shipInvDR.KNDY4__Default_GL_Account__c = true;
                shipInvDR.KNDY4__GL_Account_Reference_Value__c = null;
                shipInvDR.KNDY4__GL_Account__c = receivablesGL.id;
                ciAccountingRuleList.add(shipInvDR);

                KNDY4__Accounting_Rule__c custInvManualCR = new KNDY4__Accounting_Rule__c();
                custInvManualCR.KNDY4__Object_Name__c = 'KNDY4__Customer_Invoice__c';
                custInvManualCR.KNDY4__Transaction__c = 'Manual';
                custInvManualCR.KNDY4__Rule_Type__c = 'CR';
                custInvManualCR.KNDY4__Default_GL_Account__c = true;
                custInvManualCR.KNDY4__GL_Account_Reference_Value__c = null;
                custInvManualCR.KNDY4__GL_Account__c = receivablesGL.id;
                ciAccountingRuleList.add(custInvManualCR);

                KNDY4__Accounting_Rule__c custInvManualDR = new KNDY4__Accounting_Rule__c();
                custInvManualDR.KNDY4__Object_Name__c = 'KNDY4__Customer_Invoice__c';
                custInvManualDR.KNDY4__Transaction__c = 'Manual';
                custInvManualDR.KNDY4__Rule_Type__c = 'DR';
                custInvManualDR.KNDY4__Default_GL_Account__c = true;
                custInvManualDR.KNDY4__GL_Account_Reference_Value__c = null;
                custInvManualDR.KNDY4__GL_Account__c = receivablesGL.id;
                ciAccountingRuleList.add(custInvManualDR);

                KNDY4__Accounting_Rule__c custInvManualCR1 = new KNDY4__Accounting_Rule__c();
                custInvManualCR1.KNDY4__Object_Name__c = 'KNDY4__Customer_Invoice__c';
                custInvManualCR1.KNDY4__Transaction__c = 'Manual';
                custInvManualCR1.KNDY4__SubTransaction_Type__c = 'Miscellaneous'; //ttt
                custInvManualCR1.KNDY4__Rule_Type__c = 'CR';
                custInvManualCR1.KNDY4__Default_GL_Account__c = true;
                custInvManualCR1.KNDY4__GL_Account_Reference_Value__c = null;
                custInvManualCR1.KNDY4__GL_Account__c = receivablesGL.id;
                ciAccountingRuleList.add(custInvManualCR1);

                KNDY4__Accounting_Rule__c custInvManualDR1 = new KNDY4__Accounting_Rule__c();
                custInvManualDR1.KNDY4__Object_Name__c = 'KNDY4__Customer_Invoice__c';
                custInvManualDR1.KNDY4__Transaction__c = 'Manual';
                custInvManualDR1.KNDY4__SubTransaction_Type__c = 'Miscellaneous';//ttt
                custInvManualDR1.KNDY4__Rule_Type__c = 'DR';
                custInvManualDR1.KNDY4__Default_GL_Account__c = true;
                custInvManualDR1.KNDY4__GL_Account_Reference_Value__c = null;
                custInvManualDR1.KNDY4__GL_Account__c = receivablesGL.id;
                ciAccountingRuleList.add(custInvManualDR1);

                KNDY4__Accounting_Rule__c custInvManualGoodsCR = new KNDY4__Accounting_Rule__c();
                custInvManualGoodsCR.KNDY4__Object_Name__c = 'KNDY4__Customer_Invoice__c';
                custInvManualGoodsCR.KNDY4__Transaction__c = 'Manual';
                custInvManualGoodsCR.KNDY4__SubTransaction_Type__c = 'Goods';
                custInvManualGoodsCR.KNDY4__Rule_Type__c = 'CR';
                custInvManualGoodsCR.KNDY4__Default_GL_Account__c = true;
                custInvManualGoodsCR.KNDY4__GL_Account_Reference_Value__c = null;
                custInvManualGoodsCR.KNDY4__GL_Account__c = cashGL.id;
                ciAccountingRuleList.add(custInvManualGoodsCR);

                KNDY4__Accounting_Rule__c custInvManualGoodsDR = new KNDY4__Accounting_Rule__c();
                custInvManualGoodsDR.KNDY4__Object_Name__c = 'KNDY4__Customer_Invoice__c';
                custInvManualGoodsDR.KNDY4__Transaction__c = 'Manual';
                custInvManualGoodsDR.KNDY4__SubTransaction_Type__c = 'Goods';
                custInvManualGoodsDR.KNDY4__Rule_Type__c = 'DR';
                custInvManualGoodsDR.KNDY4__Default_GL_Account__c = true;
                custInvManualGoodsDR.KNDY4__GL_Account_Reference_Value__c = null;
                custInvManualGoodsDR.KNDY4__GL_Account__c = receivablesGL.id;
                ciAccountingRuleList.add(custInvManualGoodsDR);

                KNDY4__Accounting_Rule__c custInvGoodsCR = new KNDY4__Accounting_Rule__c();
                custInvGoodsCR.KNDY4__Object_Name__c = 'KNDY4__Customer_Invoice__c';
                custInvGoodsCR.KNDY4__Transaction__c = 'Customer Invoice';
                custInvGoodsCR.KNDY4__SubTransaction_Type__c = 'Goods';
                custInvGoodsCR.KNDY4__Rule_Type__c = 'CR';
                custInvGoodsCR.KNDY4__Default_GL_Account__c = true;
                custInvGoodsCR.KNDY4__GL_Account_Reference_Value__c = null;
                custInvGoodsCR.KNDY4__GL_Account__c = cashGL.id;
                custInvGoodsCR.KNDY4__Company_Ledger__c = true;
                ciAccountingRuleList.add(custInvGoodsCR);

                KNDY4__Accounting_Rule__c custInvGoodsDR = new KNDY4__Accounting_Rule__c();
                custInvGoodsDR.KNDY4__Object_Name__c = 'KNDY4__Customer_Invoice__c';
                custInvGoodsDR.KNDY4__Transaction__c = 'Customer Invoice';
                custInvGoodsDR.KNDY4__SubTransaction_Type__c = 'Goods';
                custInvGoodsDR.KNDY4__Rule_Type__c = 'DR';
                custInvGoodsDR.KNDY4__Default_GL_Account__c = true;
                custInvGoodsDR.KNDY4__GL_Account_Reference_Value__c = null;
                custInvGoodsDR.KNDY4__GL_Account__c = receivablesGL.id;
                custInvGoodsDR.KNDY4__Company_Ledger__c = true;
                ciAccountingRuleList.add(custInvGoodsDR);

                KNDY4__Accounting_Rule__c custInvTaxCR = new KNDY4__Accounting_Rule__c();
                custInvTaxCR.KNDY4__Object_Name__c = 'KNDY4__Customer_Invoice__c';
                custInvTaxCR.KNDY4__Transaction__c = 'Customer Invoice';
                custInvTaxCR.KNDY4__SubTransaction_Type__c = 'Sales Tax';
                custInvTaxCR.KNDY4__Rule_Type__c = 'CR';
                custInvTaxCR.KNDY4__Default_GL_Account__c = true;
                custInvTaxCR.KNDY4__GL_Account_Reference_Value__c = null;
                custInvTaxCR.KNDY4__GL_Account__c = taxGL.id;
                ciAccountingRuleList.add(custInvTaxCR);

                KNDY4__Accounting_Rule__c custInvTaxDR = new KNDY4__Accounting_Rule__c();
                custInvTaxDR.KNDY4__Object_Name__c = 'KNDY4__Customer_Invoice__c';
                custInvTaxDR.KNDY4__Transaction__c = 'Customer Invoice';
                custInvTaxDR.KNDY4__SubTransaction_Type__c = 'Sales Tax';
                custInvTaxDR.KNDY4__Rule_Type__c = 'DR';
                custInvTaxDR.KNDY4__Default_GL_Account__c = true;
                custInvTaxDR.KNDY4__GL_Account_Reference_Value__c = null;
                custInvTaxDR.KNDY4__GL_Account__c = receivablesGL.id;
                ciAccountingRuleList.add(custInvTaxDR);

                KNDY4__Accounting_Rule__c custInvMiscCR = new KNDY4__Accounting_Rule__c();
                custInvMiscCR.KNDY4__Object_Name__c = 'KNDY4__Customer_Invoice__c';
                custInvMiscCR.KNDY4__Transaction__c = 'Customer Invoice';
                custInvMiscCR.KNDY4__SubTransaction_Type__c = 'Miscellaneous';
                custInvMiscCR.KNDY4__Rule_Type__c = 'CR';
                custInvMiscCR.KNDY4__Default_GL_Account__c = false;
                custInvMiscCR.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__Product__r.KNDY4__Item__r.KNDY4__class__r.KNDY4__Revenue_GL_Account__c';
                ciAccountingRuleList.add(custInvMiscCR);

                KNDY4__Accounting_Rule__c custInvMiscDR = new KNDY4__Accounting_Rule__c();
                custInvMiscDR.KNDY4__Object_Name__c = 'KNDY4__Customer_Invoice__c';
                custInvMiscDR.KNDY4__Transaction__c = 'Customer Invoice';
                custInvMiscDR.KNDY4__SubTransaction_Type__c = 'Miscellaneous';
                custInvMiscDR.KNDY4__Rule_Type__c = 'DR';
                custInvMiscDR.KNDY4__Default_GL_Account__c = true;
                custInvMiscDR.KNDY4__GL_Account_Reference_Value__c = null;
                custInvMiscDR.KNDY4__GL_Account__c = receivablesGL.id;
                ciAccountingRuleList.add(custInvMiscDR);

                KNDY4__Accounting_Rule__c custInvOffCR = new KNDY4__Accounting_Rule__c();
                custInvOffCR.KNDY4__Object_Name__c = 'KNDY4__Customer_Invoice__c';
                custInvOffCR.KNDY4__Transaction__c = 'Customer Invoice';
                custInvOffCR.KNDY4__SubTransaction_Type__c = 'Off Invoice';
                custInvOffCR.KNDY4__Rule_Type__c = 'CR';
                custInvOffCR.KNDY4__Default_GL_Account__c = true;
                custInvOffCR.KNDY4__GL_Account_Reference_Value__c = null;
                custInvOffCR.KNDY4__GL_Account__c = allowanceExpGL.id;
                ciAccountingRuleList.add(custInvOffCR);

                KNDY4__Accounting_Rule__c custInvOffDR = new KNDY4__Accounting_Rule__c();
                custInvOffDR.KNDY4__Object_Name__c = 'KNDY4__Customer_Invoice__c';
                custInvOffDR.KNDY4__Transaction__c = 'Customer Invoice';
                custInvOffDR.KNDY4__SubTransaction_Type__c = 'Off Invoice';
                custInvOffDR.KNDY4__Rule_Type__c = 'DR';
                custInvOffDR.KNDY4__Default_GL_Account__c = true;
                custInvOffDR.KNDY4__GL_Account_Reference_Value__c = null;
                custInvOffDR.KNDY4__GL_Account__c = receivablesGL.id;
                ciAccountingRuleList.add(custInvOffDR);

                KNDY4__Accounting_Rule__c custInvDedCreditCR = new KNDY4__Accounting_Rule__c();
                custInvDedCreditCR.KNDY4__Object_Name__c = 'KNDY4__Customer_Invoice__c';
                custInvDedCreditCR.KNDY4__Transaction__c = 'Adjustment';
                custInvDedCreditCR.KNDY4__Subtransaction_Type__c = 'Goods';
                custInvDedCreditCR.KNDY4__Line_Type__c = 'Deduction Credit';
                custInvDedCreditCR.KNDY4__Rule_Type__c = 'CR';
                custInvDedCreditCR.KNDY4__Default_GL_Account__c = true;
                custInvDedCreditCR.KNDY4__GL_Account_Reference_Value__c = null;
                custInvDedCreditCR.KNDY4__GL_Account__c = cashGL.id;
                ciAccountingRuleList.add(custInvDedCreditCR);

                KNDY4__Accounting_Rule__c custInvDedCreditDR = new KNDY4__Accounting_Rule__c();
                custInvDedCreditDR.KNDY4__Object_Name__c = 'KNDY4__Customer_Invoice__c';
                custInvDedCreditDR.KNDY4__Transaction__c = 'Adjustment';
                custInvDedCreditDR.KNDY4__Subtransaction_Type__c = 'Goods';
                custInvDedCreditDR.KNDY4__Line_Type__c = 'Deduction Credit';
                custInvDedCreditDR.KNDY4__Rule_Type__c = 'DR';
                custInvDedCreditDR.KNDY4__Default_GL_Account__c = true;
                custInvDedCreditDR.KNDY4__GL_Account_Reference_Value__c = null;
                custInvDedCreditDR.KNDY4__GL_Account__c = receivablesGL.id;
                ciAccountingRuleList.add(custInvDedCreditDR);


                KNDY4__Accounting_Rule__c custInvDedCreditCRCI = new KNDY4__Accounting_Rule__c();
                custInvDedCreditCRCI.KNDY4__Object_Name__c = 'KNDY4__Customer_Invoice__c';
                custInvDedCreditCRCI.KNDY4__Transaction__c = 'Customer Invoice';
                custInvDedCreditCRCI.KNDY4__Subtransaction_Type__c = null;
                custInvDedCreditCRCI.KNDY4__Line_Type__c = null;
                custInvDedCreditCRCI.KNDY4__Rule_Type__c = 'CR';
                custInvDedCreditCRCI.KNDY4__Default_GL_Account__c = true;
                custInvDedCreditCRCI.KNDY4__GL_Account_Reference_Value__c = null;
                custInvDedCreditCRCI.KNDY4__GL_Account__c = cashGL.id;
                ciAccountingRuleList.add(custInvDedCreditCRCI);

                KNDY4__Accounting_Rule__c custInvDedCreditDRCI = new KNDY4__Accounting_Rule__c();
                custInvDedCreditDRCI.KNDY4__Object_Name__c = 'KNDY4__Customer_Invoice__c';
                custInvDedCreditDRCI.KNDY4__Transaction__c = 'Customer Invoice';
                custInvDedCreditDRCI.KNDY4__Subtransaction_Type__c = null;
                custInvDedCreditDRCI.KNDY4__Line_Type__c = null;
                custInvDedCreditDRCI.KNDY4__Rule_Type__c = 'DR';
                custInvDedCreditDRCI.KNDY4__Default_GL_Account__c = true;
                custInvDedCreditDRCI.KNDY4__GL_Account_Reference_Value__c = null;
                custInvDedCreditDRCI.KNDY4__GL_Account__c = receivablesGL.id;
                ciAccountingRuleList.add(custInvDedCreditDRCI);

                //Adding Effectivity to the accounting rules.
                for(KNDY4__Accounting_rule__c rule:ciAccountingRuleList)
                {
                    rule.KNDY4__Effective_Start_Date__c= effStartDate;
                    rule.KNDY4__Accounting_Standard__c = accountingStandard.Id;
                }
                insert ciAccountingRuleList;
            }
            update ciAccountingRuleList;

            return ciAccountingRuleList;
        }
        set;
    }

    public List<KNDY4__Accounting_Rule__c> shipmentRuleList{
        get{
            if(shipmentRuleList == null){
                shipmentRuleList = new List<KNDY4__Accounting_Rule__c>();

                KNDY4__Accounting_Rule__c shipacctRule1 = new KNDY4__Accounting_Rule__c();
                shipacctRule1.KNDY4__Object_Name__c = 'KNDY4__Shipment__c';
                //shipacctRule1.KNDY4__Company__c = company.id;
                shipacctRule1.KNDY4__Transaction__c = 'Shipment';
                shipacctRule1.KNDY4__SubTransaction_Type__c = 'Goods';
                shipacctRule1.KNDY4__Line_Type__c = null;
                shipacctRule1.KNDY4__Rule_Type__c = 'CR';
                shipacctRule1.KNDY4__Default_GL_Account__c = true;
                shipacctRule1.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__Product__r.KNDY4__Item__r.KNDY4__class__r.KNDY4__Inventory_GL_Account__c';
                shipacctRule1.KNDY4__GL_Account__c = FGInventoryGL.id;
                shipacctRule1.KNDY4__Amount_Reference__c = null;
                shipacctRule1.KNDY4__Company_Ledger__c = true;
                shipmentRuleList.add(shipacctRule1);

                KNDY4__Accounting_Rule__c shipacctRule2 = new KNDY4__Accounting_Rule__c();
                shipacctRule2.KNDY4__Object_Name__c = 'KNDY4__Shipment__c';
                //shipacctRule2.KNDY4__Company__c = company.id;
                shipacctRule2.KNDY4__Transaction__c = 'Shipment';
                shipacctRule2.KNDY4__SubTransaction_Type__c = 'Goods';
                shipacctRule2.KNDY4__Line_Type__c = null;
                shipacctRule2.KNDY4__Rule_Type__c = 'DR';
                shipacctRule2.KNDY4__Default_GL_Account__c = true;
                shipacctRule2.KNDY4__GL_Account_Reference_Value__c = null;
                shipacctRule2.KNDY4__GL_Account__c = cogsGL.id;
                shipacctRule2.KNDY4__Amount_Reference__c = null;
                shipacctRule2.KNDY4__Company_Ledger__c = true;
                shipmentRuleList.add(shipacctRule2);



                KNDY4__Accounting_Rule__c transferAccCreditDRCI = new KNDY4__Accounting_Rule__c();
                transferAccCreditDRCI.KNDY4__Object_Name__c = 'KNDY4__Inventory_Change__c';
                transferAccCreditDRCI.KNDY4__Transaction__c = 'Transfer Order Shipment';
                transferAccCreditDRCI.KNDY4__Subtransaction_Type__c = 'Transfer Order Shipment';
                transferAccCreditDRCI.KNDY4__Line_Type__c = null;
                transferAccCreditDRCI.KNDY4__Rule_Type__c = 'DR';
                transferAccCreditDRCI.KNDY4__Default_GL_Account__c = true;
                transferAccCreditDRCI.KNDY4__GL_Account_Reference_Value__c = null;
                transferAccCreditDRCI.KNDY4__GL_Account__c = receivablesGL.id;
                shipmentRuleList.add(transferAccCreditDRCI);

                KNDY4__Accounting_Rule__c transferAccDebitDRCI = new KNDY4__Accounting_Rule__c();
                transferAccDebitDRCI.KNDY4__Object_Name__c = 'KNDY4__Inventory_Change__c';
                transferAccDebitDRCI.KNDY4__Transaction__c = 'Transfer Order Shipment';
                transferAccDebitDRCI.KNDY4__Subtransaction_Type__c = 'Transfer Order Shipment';
                transferAccDebitDRCI.KNDY4__Line_Type__c = null;
                transferAccDebitDRCI.KNDY4__Rule_Type__c = 'CR';
                transferAccDebitDRCI.KNDY4__Default_GL_Account__c = true;
                transferAccDebitDRCI.KNDY4__GL_Account_Reference_Value__c = null;
                transferAccDebitDRCI.KNDY4__GL_Account__c = receivablesGL.id;
                shipmentRuleList.add(transferAccDebitDRCI);


                //Adding Effectivity to the accounting rules.
                for(KNDY4__Accounting_rule__c rule:shipmentRuleList)
                {
                    rule.KNDY4__Effective_Start_Date__c= effStartDate;
                    rule.KNDY4__Accounting_Standard__c = accountingStandard.Id;
                }

                insert shipmentRuleList;
            }
            return shipmentRuleList;
        }
        set;

    }
    //KNDY-10268 - deprecating bank file and bank file line objects
   /*public List<KNDY4__Accounting_Rule__c> BankFileRulesList {
        get {
            if (BankFileRulesList == null) {
                BankFileRulesList = new List<KNDY4__Accounting_Rule__c>();

                KNDY4__Accounting_Rule__c arDebitDR = new KNDY4__Accounting_Rule__c();
                arDebitDR.KNDY4__Object_Name__c = 'KNDY4__Bank_File__c';
	            //arDebitDR.KNDY4__company__c = company.id;
                arDebitDR.KNDY4__Transaction__c = 'Bank File';
                arDebitDR.KNDY4__Subtransaction_Type__c = 'Debit';
                arDebitDR.KNDY4__Line_Type__c = null;
                arDebitDR.KNDY4__Rule_Type__c = 'DR';
                arDebitDR.KNDY4__GL_Account__c = payablesGL.Id;
                arDebitDR.KNDY4__Default_GL_Account__c = true;
                arDebitDR.KNDY4__GL_Account_Reference_Value__c = null;
                BankFileRulesList.add(arDebitDR);

                KNDY4__Accounting_Rule__c arDebitCR = new KNDY4__Accounting_Rule__c();
                arDebitCR.KNDY4__Object_Name__c = 'KNDY4__Bank_File__c';
	            //arDebitCR.KNDY4__company__c = company.id;
                arDebitCR.KNDY4__Transaction__c = 'Bank File';
                arDebitCR.KNDY4__Subtransaction_Type__c = 'Debit';
                arDebitCR.KNDY4__Line_Type__c = null;
                arDebitCR.KNDY4__Rule_Type__c = 'CR';
                arDebitCR.KNDY4__GL_Account__c = cashGL.Id;
                arDebitCR.KNDY4__Default_GL_Account__c = true;
                arDebitCR.KNDY4__GL_Account_Reference_Value__c = null;
                BankFileRulesList.add(arDebitCR);

                KNDY4__Accounting_Rule__c arCreditDR = new KNDY4__Accounting_Rule__c();
                arCreditDR.KNDY4__Object_Name__c = 'KNDY4__Bank_File__c';
	            //arCreditDR.KNDY4__company__c = company.id;
                arCreditDR.KNDY4__Transaction__c = 'Bank File';
                arCreditDR.KNDY4__Subtransaction_Type__c = 'Credit';
                arCreditDR.KNDY4__Line_Type__c = null;
                arCreditDR.KNDY4__Rule_Type__c = 'DR';
                arCreditDR.KNDY4__GL_Account__c = cashGL.Id;
                arCreditDR.KNDY4__Default_GL_Account__c = true;
                arCreditDR.KNDY4__GL_Account_Reference_Value__c = null;
                BankFileRulesList.add(arCreditDR);

                KNDY4__Accounting_Rule__c arCreditCR = new KNDY4__Accounting_Rule__c();
                arCreditCR.KNDY4__Object_Name__c = 'KNDY4__Bank_File__c';
	            //arCreditCR.KNDY4__company__c = company.id;
                arCreditCR.KNDY4__Transaction__c = 'Bank File';
                arCreditCR.KNDY4__Subtransaction_Type__c = 'Credit';
                arCreditCR.KNDY4__Line_Type__c = null;
                arCreditCR.KNDY4__Rule_Type__c = 'CR';
                arCreditCR.KNDY4__GL_Account__c = unappliedCashGL.Id;
                arCreditCR.KNDY4__Default_GL_Account__c = true;
                arCreditCR.KNDY4__GL_Account_Reference_Value__c = null;
                BankFileRulesList.add(arCreditCR);

                //Adding Effectivity to the accounting rules.
                for(KNDY4__Accounting_rule__c rule:BankFileRulesList)
                {
                    rule.KNDY4__Effective_Start_Date__c= effStartDate;
	            	rule.KNDY4__Accounting_Standard__c = accountingStandard.Id;
                }
                insert BankFileRulesList;
            }

            return BankFileRulesList;
        }
        set;
    }*/


    public List<KNDY4__Accounting_Rule__c> crAccountingRuleList {
        get {
            if (crAccountingRuleList == null) {
                crAccountingRuleList = new List<KNDY4__Accounting_Rule__c>();

                KNDY4__Accounting_Rule__c cracctRule1 = new KNDY4__Accounting_Rule__c();
                cracctRule1.KNDY4__Object_Name__c = 'KNDY4__Customer_Receipt__c';
                //cracctRule1.KNDY4__company__c = company.id;
                cracctRule1.KNDY4__Transaction__c = 'Customer Receipt';
                cracctRule1.KNDY4__SubTransaction_Type__c = 'Payment';
                cracctRule1.KNDY4__line_type__c = null;
                cracctRule1.KNDY4__Rule_Type__c = 'CR';
                cracctRule1.KNDY4__Default_GL_Account__c = true;
                cracctRule1.KNDY4__GL_Account_Reference_Value__c = null;
                cracctRule1.KNDY4__GL_Account__c = receivablesGL.id;
                cracctRule1.KNDY4__Amount_Reference__c = null;
                cracctRule1.KNDY4__Company_Ledger__c = true;
                crAccountingRuleList.add(cracctRule1);

                KNDY4__Accounting_Rule__c cracctRule2 = new KNDY4__Accounting_Rule__c();
                cracctRule2.KNDY4__Object_Name__c = 'KNDY4__Customer_Receipt__c';
                //cracctRule2.KNDY4__company__c = company.id;
                cracctRule2.KNDY4__Transaction__c = 'Customer Receipt';
                cracctRule2.KNDY4__SubTransaction_Type__c = 'Payment';
                cracctRule2.KNDY4__line_type__c = null;
                cracctRule2.KNDY4__Rule_Type__c = 'DR';
                cracctRule2.KNDY4__Default_GL_Account__c = true;
                cracctRule2.KNDY4__GL_Account_Reference_Value__c = null;
                cracctRule2.KNDY4__GL_Account__c = cashGL.Id;
                cracctRule2.KNDY4__Amount_Reference__c = null;
                cracctRule2.KNDY4__Company_Ledger__c = true;
                crAccountingRuleList.add(cracctRule2);

                KNDY4__Accounting_Rule__c cracctRule13 = new KNDY4__Accounting_Rule__c();
                cracctRule13.KNDY4__Object_Name__c = 'KNDY4__Customer_Receipt__c';
                cracctRule13.KNDY4__company__c = company.id;
                cracctRule13.KNDY4__Transaction__c = 'Customer Receipt';
                cracctRule13.KNDY4__SubTransaction_Type__c = 'Credit Memo';
                //cracctRule13.KNDY4__Segment_Name__c = 'KNDY4__GL_Account__c';
                cracctRule13.KNDY4__Rule_Type__c = 'CR';
                //cracctRule13.KNDY4__Criteria__c = null;
                cracctRule13.KNDY4__Default_GL_Account__c = true;
                cracctRule13.KNDY4__GL_Account_Reference_Value__c = null;
                cracctRule13.KNDY4__GL_Account__c = cashGL.id;
                cracctRule13.KNDY4__Amount_Reference__c = null;
                crAccountingRuleList.add(cracctRule13);

                KNDY4__Accounting_Rule__c cracctRule14 = new KNDY4__Accounting_Rule__c();
                cracctRule14.KNDY4__Object_Name__c = 'KNDY4__Customer_Receipt__c';
                //cracctRule14.KNDY4__company__c = company.id;
                cracctRule14.KNDY4__Transaction__c = 'Customer Receipt';
                cracctRule14.KNDY4__SubTransaction_Type__c = 'Credit Memo';
                //cracctRule14.KNDY4__Segment_Name__c = 'KNDY4__GL_Account__c';
                cracctRule14.KNDY4__Rule_Type__c = 'DR';
                //cracctRule14.KNDY4__Criteria__c = null;
                cracctRule14.KNDY4__Default_GL_Account__c = true;
                cracctRule14.KNDY4__GL_Account_Reference_Value__c = null;
                cracctRule14.KNDY4__GL_Account__c = receivablesGL.id;
                cracctRule14.KNDY4__Amount_Reference__c = null;
                crAccountingRuleList.add(cracctRule14);

                KNDY4__Accounting_Rule__c cracctRule15 = new KNDY4__Accounting_Rule__c();
                cracctRule15.KNDY4__Object_Name__c = 'KNDY4__Customer_Receipt__c';
                //cracctRule1.KNDY4__company__c = company.id;
                cracctRule15.KNDY4__Transaction__c = 'Receipt';
                cracctRule15.KNDY4__SubTransaction_Type__c = 'Payment';
                cracctRule15.KNDY4__line_type__c = null;
                cracctRule15.KNDY4__Rule_Type__c = 'CR';
                cracctRule15.KNDY4__Default_GL_Account__c = true;
                cracctRule15.KNDY4__GL_Account_Reference_Value__c = null;
                cracctRule15.KNDY4__GL_Account__c = receivablesGL.id;
                cracctRule15.KNDY4__Amount_Reference__c = null;
                cracctRule15.KNDY4__Company_Ledger__c = true;
                crAccountingRuleList.add(cracctRule15);

                KNDY4__Accounting_Rule__c cracctRule21 = new KNDY4__Accounting_Rule__c();
                cracctRule21.KNDY4__Object_Name__c = 'KNDY4__Customer_Receipt__c';
                //cracctRule2.KNDY4__company__c = company.id;
                cracctRule21.KNDY4__Transaction__c = 'Receipt';
                cracctRule21.KNDY4__SubTransaction_Type__c = 'Payment';
                cracctRule21.KNDY4__line_type__c = null;
                cracctRule21.KNDY4__Rule_Type__c = 'DR';
                cracctRule21.KNDY4__Default_GL_Account__c = true;
                cracctRule21.KNDY4__GL_Account_Reference_Value__c = null;
                cracctRule2.KNDY4__GL_Account__c = cashGL.Id;
                cracctRule21.KNDY4__Amount_Reference__c = null;
                cracctRule21.KNDY4__Company_Ledger__c = true;
                crAccountingRuleList.add(cracctRule21);

                KNDY4__Accounting_Rule__c cracctRule16 = new KNDY4__Accounting_Rule__c();
                cracctRule16.KNDY4__Object_Name__c = 'KNDY4__Customer_Receipt__c';
                cracctRule16.KNDY4__company__c = company.id;
                cracctRule16.KNDY4__Transaction__c = 'Receipt';
                cracctRule16.KNDY4__SubTransaction_Type__c = 'Credit Memo';
                //cracctRule13.KNDY4__Segment_Name__c = 'KNDY4__GL_Account__c';
                cracctRule16.KNDY4__Rule_Type__c = 'CR';
                //cracctRule13.KNDY4__Criteria__c = null;
                cracctRule16.KNDY4__Default_GL_Account__c = true;
                cracctRule16.KNDY4__GL_Account_Reference_Value__c = null;
                cracctRule16.KNDY4__GL_Account__c = cashGL.id;
                cracctRule16.KNDY4__Amount_Reference__c = null;
                crAccountingRuleList.add(cracctRule16);

                KNDY4__Accounting_Rule__c cracctRule17 = new KNDY4__Accounting_Rule__c();
                cracctRule17.KNDY4__Object_Name__c = 'KNDY4__Customer_Receipt__c';
                //cracctRule14.KNDY4__company__c = company.id;
                cracctRule17.KNDY4__Transaction__c = 'Receipt';
                cracctRule17.KNDY4__SubTransaction_Type__c = 'Credit Memo';
                //cracctRule14.KNDY4__Segment_Name__c = 'KNDY4__GL_Account__c';
                cracctRule17.KNDY4__Rule_Type__c = 'DR';
                //cracctRule14.KNDY4__Criteria__c = null;
                cracctRule17.KNDY4__Default_GL_Account__c = true;
                cracctRule17.KNDY4__GL_Account_Reference_Value__c = null;
                cracctRule17.KNDY4__GL_Account__c = receivablesGL.id;
                cracctRule17.KNDY4__Amount_Reference__c = null;
                crAccountingRuleList.add(cracctRule17);


                //Adding Effectivity to the accounting rules.
                for(KNDY4__Accounting_rule__c rule:crAccountingRuleList)
                {
                    rule.KNDY4__Effective_Start_Date__c= effStartDate;
                    rule.KNDY4__Accounting_Standard__c = accountingStandard.Id;
                }
                insert crAccountingRuleList;
            }

            return crAccountingRuleList;
        }
        set;
    }

    public List<KNDY4__Accounting_Rule__c> FixedAssetAcctRulesList {
        get {
            if (FixedAssetAcctRulesList == null) {
                FixedAssetAcctRulesList = new List<KNDY4__Accounting_Rule__c>();

                KNDY4__Accounting_Rule__c arStdCR = new KNDY4__Accounting_Rule__c();
                arStdCR.KNDY4__Object_Name__c = 'KNDY4__Fixed_Asset_Depreciation__c';
                //arStdCR.KNDY4__company__c = company.id;
                arStdCR.KNDY4__transaction__c = 'Fixed Asset Depreciation';
                arStdCR.KNDY4__subtransaction_type__c = 'Standard';
                arStdCR.KNDY4__line_type__c = null;
                arStdCR.KNDY4__Rule_Type__c = 'CR';
                arStdCR.KNDY4__Default_GL_Account__c = false;
                arStdCR.KNDY4__GL_Account_reference_value__c = 'KNDY4__Fixed_Asset__r.KNDY4__GL_Account__c';
                arStdCR.KNDY4__GL_Account__c = null;
                arStdCR.KNDY4__Company_Ledger__c = true;
                FixedAssetAcctRulesList.add(arStdCR);

                KNDY4__Accounting_Rule__c arStdDR = new KNDY4__Accounting_Rule__c();
                arStdDR.KNDY4__Object_Name__c = 'KNDY4__Fixed_Asset_Depreciation__c';
                //arStdDR.KNDY4__company__c = company.id;
                arStdDR.KNDY4__transaction__c = 'Fixed Asset Depreciation';
                arStdDR.KNDY4__subtransaction_type__c = 'Standard';
                arStdDR.KNDY4__line_type__c = null;
                arStdDR.KNDY4__Rule_Type__c = 'DR';
                arStdDR.KNDY4__Default_GL_Account__c = true;
                arStdDR.KNDY4__GL_Account_reference_value__c = null;
                arStdDR.KNDY4__gl_account__c = expenseGL.Id;
                arStdDR.KNDY4__Company_Ledger__c = true;
                FixedAssetAcctRulesList.add(arStdDR);

                KNDY4__Accounting_Rule__c arDepCR = new KNDY4__Accounting_Rule__c();
                arDepCR.KNDY4__Object_Name__c = 'KNDY4__Fixed_Asset_Depreciation__c';
                //arDepCR.KNDY4__company__c = company.id;
                arDepCR.KNDY4__transaction__c = 'Fixed Asset Depreciation';
                arDepCR.KNDY4__subtransaction_type__c = 'Depreciation';
                arDepCR.KNDY4__line_type__c = null;
                arDepCR.KNDY4__Rule_Type__c = 'CR';
                arDepCR.KNDY4__Default_GL_Account__c = false;
                arDepCR.KNDY4__GL_Account_reference_value__c = 'KNDY4__Fixed_Asset__r.KNDY4__GL_Account__c';
                arDepCR.KNDY4__GL_Account__c = null;
                arDepCR.KNDY4__Company_Ledger__c = true;
                FixedAssetAcctRulesList.add(arDepCR);

                KNDY4__Accounting_Rule__c arDepDR = new KNDY4__Accounting_Rule__c();
                arDepDR.KNDY4__Object_Name__c = 'KNDY4__Fixed_Asset_Depreciation__c';
                //arDepDR.KNDY4__company__c = company.id;
                arDepDR.KNDY4__transaction__c = 'Fixed Asset Depreciation';
                arDepDR.KNDY4__subtransaction_type__c = 'Depreciation';
                arDepDR.KNDY4__line_type__c = null;
                arDepDR.KNDY4__Rule_Type__c = 'DR';
                arDepDR.KNDY4__Default_GL_Account__c = true;
                arDepDR.KNDY4__GL_Account_reference_value__c = null;
                arDepDR.KNDY4__gl_account__c = expenseGL.Id;
                arDepDR.KNDY4__Company_Ledger__c = true;
                FixedAssetAcctRulesList.add(arDepDR);

                KNDY4__Accounting_Rule__c arCIPCR = new KNDY4__Accounting_Rule__c();
                arCIPCR.KNDY4__Object_Name__c = 'KNDY4__Fixed_Asset_Depreciation__c';
                //arCIPCR.KNDY4__company__c = company.id;
                arCIPCR.KNDY4__transaction__c = 'Fixed Asset Depreciation';
                arCIPCR.KNDY4__subtransaction_type__c = 'Capitalize';
                arCIPCR.KNDY4__Line_Type__c = null;
                arCIPCR.KNDY4__Rule_Type__c = 'CR';
                arCIPCR.KNDY4__GL_Account_reference_value__c = 'KNDY4__Fixed_Asset__r.KNDY4__GL_Account__c';
                arCIPCR.KNDY4__GL_Account__c = null;
                arCIPCR.KNDY4__Company_Ledger__c = true;
                FixedAssetAcctRulesList.add(arCIPCR);

                KNDY4__Accounting_Rule__c arCIPDR = new KNDY4__Accounting_Rule__c();
                arCIPDR.KNDY4__Object_Name__c = 'KNDY4__Fixed_Asset_Depreciation__c';
                arCIPDR.KNDY4__company__c = company.id;
                arCIPDR.KNDY4__transaction__c = 'Fixed Asset Depreciation';
                arCIPDR.KNDY4__subtransaction_type__c = 'Capitalize';
                arCIPDR.KNDY4__Rule_Type__c = 'DR';
                arCIPDR.KNDY4__Default_Gl_Account__c = true;
                arCIPDR.KNDY4__GL_Account_Reference_Value__c = null;
                arCIPDR.KNDY4__GL_Account__c = FGInventoryGL.Id;
                arCIPDR.KNDY4__Company_Ledger__c = true;
                FixedAssetAcctRulesList.add(arCIPDR);

                KNDY4__Accounting_Rule__c arWOCR = new KNDY4__Accounting_Rule__c();
                arWOCR.KNDY4__Object_Name__c = 'KNDY4__Fixed_Asset_Depreciation__c';
                //arWOCR.KNDY4__company__c = company.id;
                arWOCR.KNDY4__transaction__c = 'Fixed Asset Depreciation';
                arWOCR.KNDY4__subtransaction_type__c = 'Write Off';
                arWOCR.KNDY4__Line_Type__c = null;
                arWOCR.KNDY4__Rule_Type__c = 'CR';
                arWOCR.KNDY4__Default_GL_Account__c = false;
                arWOCR.KNDY4__GL_Account_reference_value__c = 'KNDY4__Fixed_Asset__r.KNDY4__GL_Account__c';
                arWOCR.KNDY4__GL_Account__c = null;
                arWOCR.KNDY4__Company_Ledger__c = true;
                FixedAssetAcctRulesList.add(arWOCR);

                KNDY4__Accounting_Rule__c arWODR = new KNDY4__Accounting_Rule__c();
                arWODR.KNDY4__Object_Name__c = 'KNDY4__Fixed_Asset_Depreciation__c';
                //arWODR.KNDY4__company__c = company.id;
                arWODR.KNDY4__transaction__c = 'Fixed Asset Depreciation';
                arWODR.KNDY4__subtransaction_type__c = 'Write Off';
                arWODR.KNDY4__Line_Type__c = null;
                arWODR.KNDY4__Rule_Type__c = 'DR';
                arWODR.KNDY4__Default_GL_Account__c = true;
                arWODR.KNDY4__GL_Account_Reference_Value__c = null;
                arWODR.KNDY4__gl_account__c = expenseGL.Id;
                arWODR.KNDY4__Company_Ledger__c = true;
                FixedAssetAcctRulesList.add(arWODR);

                KNDY4__Accounting_Rule__c arAdjCR = new KNDY4__Accounting_Rule__c();
                arAdjCR.KNDY4__Object_Name__c = 'KNDY4__Fixed_Asset_Adjustment__c';
                //arAdjCR.KNDY4__company__c = company.id;
                arAdjCR.KNDY4__transaction__c = 'Fixed Asset Adjustment';
                arAdjCR.KNDY4__subtransaction_type__c = 'Upgrade';
                arAdjCR.KNDY4__Line_Type__c = null;
                arAdjCR.KNDY4__Rule_Type__c = 'CR';
                arAdjCR.KNDY4__Default_GL_Account__c = false;
                arAdjCR.KNDY4__GL_Account_reference_value__c = 'KNDY4__Fixed_Asset__r.KNDY4__GL_Account__c';
                arAdjCR.KNDY4__GL_Account__c = null;
                arAdjCR.KNDY4__Company_Ledger__c = true;
                FixedAssetAcctRulesList.add(arAdjCR);

                KNDY4__Accounting_Rule__c arAdjDR = new KNDY4__Accounting_Rule__c();
                arAdjDR.KNDY4__Object_Name__c = 'KNDY4__Fixed_Asset_Adjustment__c';
                //arAdjDR.KNDY4__company__c = company.id;
                arAdjDR.KNDY4__transaction__c = 'Fixed Asset Adjustment';
                arAdjDR.KNDY4__subtransaction_type__c = 'Upgrade';
                arAdjDR.KNDY4__Line_Type__c = null;
                arAdjDR.KNDY4__Rule_Type__c = 'DR';
                arAdjDR.KNDY4__Default_GL_Account__c = true;
                arAdjDR.KNDY4__GL_Account_Reference_Value__c = null;
                arAdjDR.KNDY4__GL_Account__c = expenseGL.Id;
                arAdjDR.KNDY4__Company_Ledger__c = true;
                FixedAssetAcctRulesList.add(arAdjDR);

                //Adding Effectivity to the accounting rules.
                for(KNDY4__Accounting_rule__c rule:FixedAssetAcctRulesList)
                {
                    rule.KNDY4__Effective_Start_Date__c= effStartDate;
                    rule.KNDY4__Accounting_Standard__c = accountingStandard.Id;
                }
                insert FixedAssetAcctRulesList;
            }

            return FixedAssetAcctRulesList;
        }
        set;
    }

    public List<KNDY4__Accounting_Rule__c> AccountingRuleList {
        get {
            if (AccountingRuleList == null) {
                AccountingRuleList = new List<KNDY4__Accounting_Rule__c>();
                KNDY4__Accounting_Rule__c jeRule1 = new KNDY4__Accounting_Rule__c();
                jeRule1.KNDY4__Object_Name__c = 'KNDY4__Journal_Entry__c';
                //jeRule1.KNDY4__Company__c = company.id;
                jeRule1.KNDY4__Transaction__c = 'Manual';
                jeRule1.KNDY4__SubTransaction_Type__c = 'Write Off';
                jeRule1.KNDY4__Line_Type__c = null;
                jeRule1.KNDY4__Rule_Type__c = 'CR';
                jeRule1.KNDY4__Default_GL_Account__c = false;
                jeRule1.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__GL_Account__c';
                jeRule1.KNDY4__GL_Account__c = null;
                jeRule1.KNDY4__Amount_Reference__c = null;
                jeRule1.KNDY4__Company_Ledger__c = true;
                AccountingRuleList.add(jeRule1);

                KNDY4__Accounting_Rule__c jeRule2 = new KNDY4__Accounting_Rule__c();
                jeRule2.KNDY4__Object_Name__c = 'KNDY4__Journal_Entry__c';
                //jeRule2.KNDY4__Company__c = company.id;
                jeRule2.KNDY4__Transaction__c = 'Manual';
                jeRule2.KNDY4__SubTransaction_Type__c = 'Write Off';
                jeRule2.KNDY4__Line_Type__c = null;
                jeRule2.KNDY4__Rule_Type__c = 'DR';
                jeRule2.KNDY4__Default_GL_Account__c = false;
                jeRule2.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__GL_Account__c';
                jeRule2.KNDY4__GL_Account__c = null;
                jeRule2.KNDY4__Amount_Reference__c = null;
                jeRule2.KNDY4__Company_Ledger__c = true;
                AccountingRuleList.add(jeRule2);

                KNDY4__Accounting_Rule__c jeRule3 = new KNDY4__Accounting_Rule__c();
                jeRule3.KNDY4__Object_Name__c = 'KNDY4__Journal_Entry__c';
                //jeRule3.KNDY4__Company__c = company.id;
                jeRule3.KNDY4__Transaction__c = 'Accrual - Manual';
                jeRule3.KNDY4__Line_Type__c = null;
                jeRule3.KNDY4__Rule_Type__c = 'CR';
                jeRule3.KNDY4__Default_GL_Account__c = false;
                jeRule3.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__GL_Account__c';
                jeRule3.KNDY4__GL_Account__c = null;
                jeRule3.KNDY4__Amount_Reference__c = null;
                jeRule3.KNDY4__Company_Ledger__c = true;
                AccountingRuleList.add(jeRule3);

                KNDY4__Accounting_Rule__c jeRule4 = new KNDY4__Accounting_Rule__c();
                jeRule4.KNDY4__Object_Name__c = 'KNDY4__Journal_Entry__c';
                //jeRule4.KNDY4__Company__c = company.id;
                jeRule4.KNDY4__Transaction__c = 'Accrual - Manual';
                jeRule4.KNDY4__Line_Type__c = null;
                jeRule4.KNDY4__Rule_Type__c = 'DR';
                jeRule4.KNDY4__Default_GL_Account__c = false;
                jeRule4.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__GL_Account__c';
                jeRule4.KNDY4__GL_Account__c = null;
                jeRule4.KNDY4__Amount_Reference__c = null;
                jeRule4.KNDY4__Company_Ledger__c = true;
                AccountingRuleList.add(jeRule4);

                KNDY4__Accounting_Rule__c jeRule5 = new KNDY4__Accounting_Rule__c();
                jeRule5.KNDY4__Object_Name__c = 'KNDY4__Journal_Entry__c';
                //jeRule5.KNDY4__Company__c = company.id;
                jeRule5.KNDY4__Transaction__c = 'Recurring Journal';
                jeRule5.KNDY4__Line_Type__c = null;
                jeRule5.KNDY4__Rule_Type__c = 'CR';
                jeRule5.KNDY4__Default_GL_Account__c = false;
                jeRule5.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__GL_Account__c';
                jeRule5.KNDY4__GL_Account__c = null;
                jeRule5.KNDY4__Amount_Reference__c = null;
                jeRule5.KNDY4__Company_Ledger__c = true;
                AccountingRuleList.add(jeRule5);

                KNDY4__Accounting_Rule__c jeRule6 = new KNDY4__Accounting_Rule__c();
                jeRule6.KNDY4__Object_Name__c = 'KNDY4__Journal_Entry__c';
                //jeRule6.KNDY4__Company__c = company.id;
                jeRule6.KNDY4__Transaction__c = 'Recurring Journal';
                jeRule6.KNDY4__Line_Type__c = null;
                jeRule6.KNDY4__Rule_Type__c = 'DR';
                jeRule6.KNDY4__Default_GL_Account__c = false;
                jeRule6.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__GL_Account__c';
                jeRule6.KNDY4__GL_Account__c = null;
                jeRule6.KNDY4__Amount_Reference__c = null;
                jeRule6.KNDY4__Company_Ledger__c = true;
                AccountingRuleList.add(jeRule6);


                KNDY4__Accounting_Rule__c jeRule7 = new KNDY4__Accounting_Rule__c();
                jeRule7.KNDY4__Object_Name__c = 'KNDY4__Journal_Entry__c';
                //jeRule7.KNDY4__Company__c = company.id;
                jeRule7.KNDY4__Transaction__c = 'Manual';
                jeRule7.KNDY4__SubTransaction_Type__c = null;
                jeRule7.KNDY4__Line_Type__c = null;
                jeRule7.KNDY4__Rule_Type__c = 'CR';
                jeRule7.KNDY4__Default_GL_Account__c = false;
                jeRule7.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__GL_Account__c';
                jeRule7.KNDY4__GL_Account__c = null;
                jeRule7.KNDY4__Amount_Reference__c = null;
                jeRule7.KNDY4__Company_Ledger__c = true;
                AccountingRuleList.add(jeRule7);

                KNDY4__Accounting_Rule__c jeRule8 = new KNDY4__Accounting_Rule__c();
                jeRule8.KNDY4__Object_Name__c = 'KNDY4__Journal_Entry__c';
                //jeRule8.KNDY4__Company__c = company.id;
                jeRule8.KNDY4__Transaction__c = 'Manual';
                jeRule8.KNDY4__SubTransaction_Type__c = null;
                jeRule8.KNDY4__Line_Type__c = null;
                jeRule8.KNDY4__Rule_Type__c = 'DR';
                jeRule8.KNDY4__Default_GL_Account__c = false;
                jeRule8.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__GL_Account__c';
                jeRule8.KNDY4__GL_Account__c = null;
                jeRule8.KNDY4__Amount_Reference__c = null;
                jeRule8.KNDY4__Company_Ledger__c = true;
                AccountingRuleList.add(jeRule8);

                KNDY4__Accounting_Rule__c jeRule9 = new KNDY4__Accounting_Rule__c();
                jeRule9.KNDY4__Object_Name__c = 'KNDY4__Journal_Entry__c';
                //jeRule7.KNDY4__Company__c = company.id;
                jeRule9.KNDY4__Transaction__c = 'Year End Adjustment';
                jeRule9.KNDY4__SubTransaction_Type__c = null;
                jeRule9.KNDY4__Line_Type__c = null;
                jeRule9.KNDY4__Rule_Type__c = 'CR';
                jeRule9.KNDY4__Default_GL_Account__c = false;
                jeRule9.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__GL_Account__c';
                jeRule9.KNDY4__GL_Account__c = null;
                jeRule9.KNDY4__Amount_Reference__c = null;
                jeRule9.KNDY4__Company_Ledger__c = true;
                AccountingRuleList.add(jeRule9);

                KNDY4__Accounting_Rule__c jeRule10 = new KNDY4__Accounting_Rule__c();
                jeRule10.KNDY4__Object_Name__c = 'KNDY4__Journal_Entry__c';
                //jeRule8.KNDY4__Company__c = company.id;
                jeRule10.KNDY4__Transaction__c = 'Year End Adjustment';
                jeRule10.KNDY4__SubTransaction_Type__c = null;
                jeRule10.KNDY4__Line_Type__c = null;
                jeRule10.KNDY4__Rule_Type__c = 'DR';
                jeRule10.KNDY4__Default_GL_Account__c = false;
                jeRule10.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__GL_Account__c';
                jeRule10.KNDY4__GL_Account__c = null;
                jeRule10.KNDY4__Amount_Reference__c = null;
                jeRule10.KNDY4__Company_Ledger__c = true;
                AccountingRuleList.add(jeRule10);

                //KNDY-16543
                KNDY4__Accounting_Rule__c jeRule11 = new KNDY4__Accounting_Rule__c();
                jeRule11.KNDY4__Object_Name__c = 'KNDY4__Journal_Entry__c';
                //jeRule7.KNDY4__Company__c = company.id;
                jeRule11.KNDY4__Transaction__c = 'Bank Transaction';
                jeRule11.KNDY4__SubTransaction_Type__c = 'Bank Adjustment';
                jeRule11.KNDY4__Line_Type__c = null;
                jeRule11.KNDY4__Rule_Type__c = 'CR';
                jeRule11.KNDY4__Default_GL_Account__c = true;
                jeRule11.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__GL_Account__c';
                jeRule11.KNDY4__GL_Account__c = null;
                jeRule11.KNDY4__Amount_Reference__c = null;
                jeRule11.KNDY4__Company_Ledger__c = true;
                jeRule11.KNDY4__Effective_Start_Date__c = system.now().addYears(-1);
                AccountingRuleList.add(jeRule11);

                KNDY4__Accounting_Rule__c jeRule12 = new KNDY4__Accounting_Rule__c();
                jeRule12.KNDY4__Object_Name__c = 'KNDY4__Journal_Entry__c';
                //jeRule8.KNDY4__Company__c = company.id;
                jeRule12.KNDY4__Transaction__c = 'Bank Transaction';
                jeRule12.KNDY4__SubTransaction_Type__c = 'Bank Adjustment';
                jeRule12.KNDY4__Line_Type__c = null;
                jeRule12.KNDY4__Rule_Type__c = 'DR';
                jeRule12.KNDY4__Default_GL_Account__c = false;
                jeRule12.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__GL_Account__c';
                jeRule12.KNDY4__GL_Account__c = null;
                jeRule12.KNDY4__Amount_Reference__c = null;
                jeRule12.KNDY4__Company_Ledger__c = true;
                jeRule12.KNDY4__Effective_Start_Date__c = system.now().addYears(-1);
                AccountingRuleList.add(jeRule12);

                KNDY4__Accounting_Rule__c jeRule13 = new KNDY4__Accounting_Rule__c();
                jeRule13.KNDY4__Object_Name__c = 'KNDY4__Journal_Entry__c';
                //jeRule7.KNDY4__Company__c = company.id;
                jeRule13.KNDY4__Transaction__c = 'Bank Transaction';
                jeRule13.KNDY4__SubTransaction_Type__c = 'Bank Interest Income';
                jeRule13.KNDY4__Line_Type__c = null;
                jeRule13.KNDY4__Rule_Type__c = 'CR';
                jeRule13.KNDY4__Default_GL_Account__c = true;
                jeRule13.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__GL_Account__c';
                jeRule13.KNDY4__GL_Account__c = null;
                jeRule13.KNDY4__Amount_Reference__c = null;
                jeRule13.KNDY4__Company_Ledger__c = true;
                jeRule13.KNDY4__Effective_Start_Date__c = system.now();
                AccountingRuleList.add(jeRule13);

                KNDY4__Accounting_Rule__c jeRule14 = new KNDY4__Accounting_Rule__c();
                jeRule14.KNDY4__Object_Name__c = 'KNDY4__Journal_Entry__c';
                //jeRule8.KNDY4__Company__c = company.id;
                jeRule14.KNDY4__Transaction__c = 'Bank Transaction';
                jeRule14.KNDY4__SubTransaction_Type__c = 'Bank Interest Income';
                jeRule14.KNDY4__Line_Type__c = null;
                jeRule14.KNDY4__Rule_Type__c = 'DR';
                jeRule14.KNDY4__Default_GL_Account__c = false;
                jeRule14.KNDY4__GL_Account_Reference_Value__c = 'KNDY4__GL_Account__c';
                jeRule14.KNDY4__GL_Account__c = null;
                jeRule14.KNDY4__Amount_Reference__c = null;
                jeRule14.KNDY4__Company_Ledger__c = true;
                jeRule14.KNDY4__Effective_Start_Date__c = system.now();
                AccountingRuleList.add(jeRule14);

                //Adding Effectivity to the accounting rules.
                for(KNDY4__Accounting_rule__c rule:AccountingRuleList)
                {
                    rule.KNDY4__Effective_Start_Date__c= effStartDate;
                    rule.KNDY4__Accounting_Standard__c = accountingStandard.Id;
                    rule.KNDY4__Raise_Exceptions_for_Blank_Amounts__c=false;
                    rule.KNDY4__Suppress_Zero_Amount_Lines__c = true;
                }
                insert AccountingRuleList;
            }
            update AccountingRuleList;

            return AccountingRuleList;
        }
        set;
    }

    public TestFuel() {}

    public KNDY4__Means_of_Transport__c newMeansOfTransport(String code, String modeOfTransport) {
        KNDY4__Means_of_Transport__c mot = new KNDY4__Means_of_Transport__c();
        mot.KNDY4__Code__c = code;
        mot.KNDY4__Mode_of_Transport__c = modeOfTransport;
        // Set max to a high value to avoid exceptions in other test cases
        mot.KNDY4__Maximum_Cube__c = 1000000;
        mot.KNDY4__Maximum_Weight__c = 1000000;
        return mot;
    }

    /* utility functions while creating data */
    public String periodName(Datetime myDT){
        String myDate = myDT.format('MM-yyyy');
        system.assert( myDate != null, 'expected valid date');
        return myDate.toUpperCase();
    }

    public Account newAccount() {
        Account account = new Account();
        account.name = 'Kenandy';
        account.billingstreet = '2055 Woodside Rd. Ste 110';
        account.billingcity = 'Redwood City';
        account.billingstate = 'CA';
        account.billingpostalcode = '94061';
        account.billingcountry = 'USA';
        account.shippingstreet = '2055 Woodside Rd. Ste 110';
        account.shippingcity = 'Redwood City';
        account.shippingstate = 'CA';
        account.shippingpostalcode = '94061';
        account.shippingcountry = 'USA';
        account.phone = '650-468-2000';
        account.fax = '650-468-2010';
        account.website = 'kenandy.com';
        return account;
    }

    public KNDY4__Customer__c newCustomerShipTo() {
        KNDY4__Customer__c cst = new KNDY4__Customer__c();
        cst.name = 'Customer Ship To 1';
        cst.recordTypeId = this.CustomerRecordTypes.get('Ship_To');
        cst.KNDY4__Company__c = this.company.id;
        cst.KNDY4__Payment_Term__c = this.terms.ID;
        cst.KNDY4__Currency__c = TestFuel.currencyUSD.ID;
        //cst.KNDY4__Address__c = this.account.ID;
        cst.KNDY4__Credit_Limit__c = 100000.0;
        cst.KNDY4__Parent_Customer__c = this.customerSoldTo.id;
        cst.KNDY4__Customer_Identifier__c = 'SHTEST123';
        cst.KNDY4__Top_Parent_Customer__c = this.customerParent.id;
        cst.KNDY4__Status__c = 'Approved';
        cst.KNDY4__Business_Hours__c = [select Id from BusinessHours where isDefault = true limit 1].Id;

        cst.KNDY4__Customer_Street__c = '303 Twin Dolphin Drive, Suite 500';
        cst.KNDY4__Customer_City__c = 'Redwood City';
        cst.KNDY4__Customer_State__c = 'CA';
        cst.KNDY4__Customer_Zip_Code__c = '94065';
        cst.KNDY4__Customer_Country__c = 'USA';
        cst.KNDY4__Track_Install_Base__c = true;

        return cst;
    }

    public KNDY4__Customer__c newCustomerSite() {
        KNDY4__Customer__c cst = new KNDY4__Customer__c();
        cst.name = 'Customer Site';
        cst.recordTypeId = this.CustomerRecordTypes.get('Site');
        cst.KNDY4__Company__c = this.company.id;
        cst.KNDY4__Payment_Term__c = this.terms.ID;
        cst.KNDY4__Currency__c = TestFuel.currencyUSD.ID;
        //cst.KNDY4__Address__c = this.account.ID;
        cst.KNDY4__Credit_Limit__c = 100000.0;
        cst.KNDY4__Parent_Customer__c = this.customerShipTo.id;
        cst.KNDY4__Customer_Identifier__c = 'SITETEST123';
        cst.KNDY4__Top_Parent_Customer__c = this.customerParent.id;
        cst.KNDY4__Status__c = 'Approved';
        cst.KNDY4__Business_Hours__c = [select Id from BusinessHours where isDefault = true limit 1].Id;

        cst.KNDY4__Customer_Street__c = '303 Twin Dolphin Drive, Suite 500';
        cst.KNDY4__Customer_City__c = 'Redwood City';
        cst.KNDY4__Customer_State__c = 'CA';
        cst.KNDY4__Customer_Zip_Code__c = '94065';
        cst.KNDY4__Customer_Country__c = 'USA';
        return cst;
    }


    public KNDY4__Sales_Order__c newSalesOrder() {
        KNDY4__Sales_Order__c so = new KNDY4__Sales_Order__c(
                KNDY4__Company__c = this.company.id,
                KNDY4__Customer__c = this.customerSoldTo.id,
                KNDY4__Ship_To__c = this.customerShipTo.Id,
                KNDY4__Payment_Term__c = this.terms.id,
                KNDY4__Currency__c = company.KNDY4__Default_Transaction_Currency__c
        );
        return so;
    }

    public KNDY4__Pricebook__c newPricebook() {
        pricebook = new KNDY4__Pricebook__c(
                Name = this.company.Name +  ' Orange Pricebook',
                KNDY4__Company__c = this.company.Id,
                KNDY4__Primary_Key__c = 'NATBOOK',
                KNDY4__Currency__c = TestFuel.currencyUSD.ID
        );
        return pricebook;
    }

    public KNDY4__Receiving_Document__c newReceivingDocumentASN() {

        KNDY4__Receiving_Document__c rd = new KNDY4__Receiving_Document__c(
                KNDY4__Company__c = this.company.id,
                KNDY4__Supplier__c = this.supplier.id,
                KNDY4__Date_Created__c = system.today(),
                KNDY4__Status__c = 'Draft',
                KNDY4__Type__c = 'Advanced Shipment Notice',
                KNDY4__Currency__c = TestFuel.currencyUSD.id,
                KNDY4__Transaction_Date__C = system.now()
        );
        return rd;
    }


    public KNDY4__Product__c newProduct() {
        KNDY4__Product__c p = new KNDY4__Product__c(
                KNDY4__company__c = this.company.id,
                Name = 'Product 1' ,
                KNDY4__Item__c  = this.itemList[0].ID,
                KNDY4__Description__c = 'Product-10',
                KNDY4__Selling_UOM__c = this.uomList[8].ID,
                KNDY4__Weight__c = 13,
                KNDY4__Weight_UOM__c = this.uomList[3].ID,
                KNDY4__UPC_Code__c = '123456789123',
                KNDY4__Primary_Key__c = '123456',
                KNDY4__Dimension_UOM__c = this.uomList[6].ID,
                KNDY4__Length__c = 1,
                KNDY4__Width__c = 1,
                KNDY4__Height__c = 1
        );
        return p;
    }
    public KNDY4__Cross_Reference__c newCrossRef() {
        KNDY4__Cross_Reference__c  cr = new KNDY4__Cross_Reference__c(
                Name = 'CR01',
                KNDY4__Cross_Reference_Type__c = 'Customer',
                KNDY4__Reference_Object__c = 'Product',
                KNDY4__Active__c = true,
                KNDY4__Customer__c = customerParent.Id,
                KNDY4__Product__c = product.Id
        );
        return cr;
    }

    public KNDY4__Product__c newProduct2() {
        KNDY4__Product__c p = new KNDY4__Product__c(
                KNDY4__company__c = this.company.id,
                Name = 'Product-15' ,
                KNDY4__Item__c  = this.itemList[5].ID,
                KNDY4__Description__c = 'Product-15',
                KNDY4__Selling_UOM__c = this.uomList[8].ID,
                KNDY4__Weight__c = 5,
                KNDY4__Weight_UOM__c = this.uomList[0].ID,
                KNDY4__UPC_Code__c = '234567891234',
                KNDY4__Dimension_UOM__c = this.uomList[6].ID,
                KNDY4__Length__c = 1,
                KNDY4__Width__c = 1,
                KNDY4__Height__c = 1
        );
        return p;
    }

    public KNDY4__Contract__c contractAM {
        get{
            if(contractAM == null){
                contractAM = new KNDY4__Contract__c(
                        Name = 'TestContract',
                        KNDY4__ExtId__c = 'TestContract',
                        KNDY4__Contract_Start__c = Date.today().addDays(-1),
                        KNDY4__Contract_End__c = Date.today().addDays(8),
                        OwnerID = System.Userinfo.getUserId(),
                        KNDY4__Status__c = 'Open',
                        KNDY4__Supplier__c = supplier.id,
                        KNDY4__Company__c = company.Id,
                        KNDY4__Payment_Term__c = terms.id,
                        KNDY4__Ship_to_Facility__c = facility.Id,
                        KNDY4__Transportation_Mode__c = 'RAIL',
                        KNDY4__Currency__c = TestFuel.currencyUSD.id
                );
                insert contractAM;
            }
            return contractAM;
        }
        set;
    }

    public KNDY4__Contract_Line__c contractLine {
        get{
            if(contractLine == null){
                contractLine = new KNDY4__Contract_Line__c(
                        KNDY4__Contract__c = contractAM.Id,
                        KNDY4__ExtId__c = 'TestContractLine',
                        KNDY4__Company__c = company.Id,
                        KNDY4__Item__c = itemlist[0].id,
                        Name = 'Test CTL 1',
                        KNDY4__Contract_Start__c = Date.today().addDays(-1),
                        KNDY4__Contract_End__c = Date.today().addDays(4),
                        KNDY4__Status__c = 'Open',
                        KNDY4__Negotiated_Price__c = 10,
                        KNDY4__Contract_Quantity__c = 100,
                        KNDY4__Consigned__c = true,
                        KNDY4__Purchased_Quantity__c = 0,
                        KNDY4__Quantity_Received__c = 0,
                        KNDY4__Quantity_Still_Due__c = 0,
                        KNDY4__Quantity_Returned__c = 0,
                        KNDY4__Purchase_UOM__c = uomList[8].Id
                );
                insert contractLine;
            }
            return contractLine;
        }
        set;
    }

    public KNDY4__Purchase_Order__c purchaseOrder {
        get {
            if ( purchaseOrder == null  ) {
                purchaseOrder = new KNDY4__Purchase_Order__c(
                        KNDY4__Supplier__c = supplier.id,
                        KNDY4__Company__c = company.id,
                        KNDY4__Payment_Term__c = terms.id,
                        KNDY4__Delivery_Facility__c = facility2.id,
                        KNDY4__Delivery_Location__c = location2.ID,
                        KNDY4__Remit_To_Supplier__c = remitToSupplier.id,
                        KNDY4__Approval_Status__c = 'Approved',
                        KNDY4__fob_term__c = fobTerm.id,
                        KNDY4__Acknowledge_Via__c = 'Email',
                        KNDY4__Status__c = 'Open',
                        KNDY4__Memo__c = 'purchaseOrder',
                        KNDY4__Currency__c = TestFuel.currencyUSD.id
                );
                insert purchaseOrder;

                insert purchaseOrderLines;
                purchaseOrder.KNDY4__Approval_Status__c = 'Approved';
                update purchaseOrder;
            }

            return purchaseOrder;
        }
        set;
    }

    public List<KNDY4__Purchase_Order_Line__c> purchaseOrderLines {
        get {
            if ( purchaseOrderLines == null  ) {
                purchaseOrderLines = new List<KNDY4__Purchase_Order_Line__c>();

                KNDY4__Purchase_Order_Line__c poLine = new KNDY4__Purchase_Order_Line__c();
                poLine.KNDY4__Purchase_Order__c = purchaseOrder.Id;
                poLine.KNDY4__Order_Quantity__c = 10;
                poLine.KNDY4__Unit_Price__c = 12;
                poLine.KNDY4__Item__c = itemList[2].Id;
                poLine.KNDY4__Item__r = itemList[2];
                poLine.KNDY4__Description__c = 'purchaseOrderLine0';
                poLine.KNDY4__Purchase_UOM__c = itemList[2].KNDY4__Purchasing_UOM__c;
                poLine.KNDY4__Stocking_UOM__c = itemList[2].KNDY4__Stocking_UOM__c;
                poLine.KNDY4__Packaging_UOM__c = itemList[2].KNDY4__Stocking_UOM__c;
                poLine.KNDY4__Company__c = company.id;
                poLine.KNDY4__Need_Date__c = system.today() + 7;
                poLine.KNDY4__Delivery_Facility__c = facility2.id;
                poLine.KNDY4__Delivery_Location__c = location2.ID;
                poLine.KNDY4__Supplier__c = supplier.Id;
                poLine.KNDY4__Line__c = 1;
                poLine.KNDY4__Quantity_Matched__c = 0;
                poLine.KNDY4__Amount_Matched__c = 0;
                purchaseOrderLines.add( poLine );
            }

            return purchaseOrderLines;
        }
        set;
    }

    public KNDY4__Purchase_Order__c purchaseOrder1 {
        get {
            if ( purchaseOrder1 == null  ) {
                purchaseOrder1 = new KNDY4__Purchase_Order__c(
                        KNDY4__Supplier__c = supplier.id,
                        KNDY4__Company__c = company.id,
                        KNDY4__Payment_Term__c = terms.id,
                        KNDY4__Delivery_Facility__c = facility2.id,
                        KNDY4__Delivery_Location__c = location2.ID,
                        KNDY4__Remit_To_Supplier__c = remitToSupplier.id,
                        KNDY4__Approval_Status__c = 'Approved',
                        KNDY4__fob_term__c = fobTerm.id,
                        KNDY4__Status__c = 'Open',
                        KNDY4__Memo__c = 'purchaseOrder',
                        KNDY4__Currency__c = TestFuel.currencyUSD.id
                );
                insert purchaseOrder1;

                insert purchaseOrder1Lines;
                purchaseOrder1.KNDY4__Approval_Status__c = 'Approved';
                update purchaseOrder1;
            }

            return purchaseOrder1;
        }
        set;
    }

    public List<KNDY4__Purchase_Order_Line__c> purchaseOrder1Lines {
        get {
            if ( purchaseOrderLines == null  ) {
                purchaseOrderLines = new List<KNDY4__Purchase_Order_Line__c>();

                KNDY4__Purchase_Order_Line__c poLine = new KNDY4__Purchase_Order_Line__c();
                poLine.KNDY4__Purchase_Order__c = purchaseOrder1.Id;
                poLine.KNDY4__Order_Quantity__c = 10;
                poLine.KNDY4__Unit_Price__c = 12;
                poLine.KNDY4__Item__c = itemList[2].Id;
                poLine.KNDY4__Description__c = itemList[2].KNDY4__Description__c;
                poLine.KNDY4__Purchase_UOM__c = itemList[2].KNDY4__Purchasing_UOM__c;
                poLine.KNDY4__Company__c = company.id;
                poLine.KNDY4__Need_Date__c = system.today() + 7;
                poLine.KNDY4__Delivery_Facility__c = facility2.id;
                poLine.KNDY4__Delivery_Location__c = location2.ID;
                poLine.KNDY4__Supplier__c = supplier.Id;
                poLine.KNDY4__Line__c = 1;

                purchaseOrderLines.add( poLine );
            }

            return purchaseOrderLines;
        }
        set;
    }

    public KNDY4__Purchase_Order__c purchaseOrder2 {
        get {
            if ( purchaseOrder2 == null  ) {
                purchaseOrder2 = new KNDY4__Purchase_Order__c(
                        KNDY4__Supplier__c = supplier.id,
                        KNDY4__Company__c = company.id,
                        KNDY4__Payment_Term__c = terms.id,
                        KNDY4__Delivery_Facility__c = facility2.id,
                        KNDY4__Delivery_Location__c = location2.ID,
                        KNDY4__Remit_To_Supplier__c = remitToSupplier.id,
                        KNDY4__Approval_Status__c = 'Approved',
                        KNDY4__fob_term__c = fobTerm.id,
                        KNDY4__Status__c = 'Open',
                        KNDY4__Memo__c = 'purchaseOrder2',
                        KNDY4__Currency__c = TestFuel.currencyUSD.id
                );
                insert purchaseOrder2;

                insert purchaseOrder2Lines;
                purchaseOrder2.KNDY4__Approval_Status__c = 'Approved';
                update purchaseOrder2;
            }

            return purchaseOrder2;
        }
        set;
    }

    public List<KNDY4__Purchase_Order_Line__c> purchaseOrder2Lines {
        get {
            if ( purchaseOrder2Lines == null  ) {
                purchaseOrder2Lines = new List<KNDY4__Purchase_Order_Line__c>();

                KNDY4__Purchase_Order_Line__c poLine = new KNDY4__Purchase_Order_Line__c();
                poLine.KNDY4__Purchase_Order__c = purchaseOrder2.Id;
                poLine.KNDY4__Order_Quantity__c = 10;
                poLine.KNDY4__Unit_Price__c = 25;
                poLine.KNDY4__Item__c = itemList[2].Id;
                poLine.KNDY4__Description__c = itemList[2].KNDY4__Description__c;
                poLine.KNDY4__Purchase_UOM__c = itemList[2].KNDY4__Purchasing_UOM__c;
                poLine.KNDY4__Company__c = company.id;
                poLine.KNDY4__Need_Date__c = system.today() + 7;
                poLine.KNDY4__Delivery_Facility__c = facility2.id;
                poLine.KNDY4__Delivery_Location__c = location2.ID;
                poLine.KNDY4__Supplier__c = supplier.Id;
                poLine.KNDY4__Line__c = 1;
                purchaseOrder2Lines.add( poLine );

                KNDY4__Purchase_Order_Line__c poLine2 = new KNDY4__Purchase_Order_Line__c();
                poLine2.KNDY4__Purchase_Order__c = purchaseOrder2.Id;
                poLine2.KNDY4__Order_Quantity__c = 5;
                poLine2.KNDY4__Unit_Price__c = 15;
                poLine2.KNDY4__Item__c = itemList[2].Id;
                poLine2.KNDY4__Description__c = itemList[2].KNDY4__Description__c;
                poLine2.KNDY4__Purchase_UOM__c = itemList[2].KNDY4__Purchasing_UOM__c;
                poLine2.KNDY4__Company__c = company.id;
                poLine2.KNDY4__Need_Date__c = system.today() + 7;
                poLine2.KNDY4__Delivery_Facility__c = facility2.id;
                poLine2.KNDY4__Delivery_Location__c = location2.ID;
                poLine2.KNDY4__Supplier__c = supplier.Id;
                poLine2.KNDY4__Line__c = 2;
                purchaseOrder2Lines.add( poLine2 );
            }

            return purchaseOrder2Lines;
        }
        set;
    }

    public KNDY4__Purchase_Order__c purchaseOrder3 {
        get {
            if ( purchaseOrder3 == null  ) {
                purchaseOrder3 = new KNDY4__Purchase_Order__c(
                        KNDY4__Supplier__c = supplier.id,
                        KNDY4__Company__c = company.id,
                        KNDY4__Payment_Term__c = terms.id,
                        KNDY4__Delivery_Facility__c = facility2.id,
                        KNDY4__Delivery_Location__c = location2.ID,
                        KNDY4__Remit_To_Supplier__c = remitToSupplier.id,
                        KNDY4__Approval_Status__c = 'Approved',
                        KNDY4__fob_term__c = fobTerm.id,
                        KNDY4__Status__c = 'Open',
                        KNDY4__Memo__c = 'purchaseOrder',
                        KNDY4__currency__c = TestFuel.currencyUSD.id
                );
                insert purchaseOrder3;

                insert purchaseOrder3Lines;
                purchaseOrder3.KNDY4__Approval_Status__c = 'Approved';
                update purchaseOrder3;
            }

            return purchaseOrder3;
        }
        set;
    }

    public List<KNDY4__Purchase_Order_Line__c> purchaseOrder3Lines {
        get {
            if ( purchaseOrder3Lines == null  ) {
                purchaseOrder3Lines = new List<KNDY4__Purchase_Order_Line__c>();

                KNDY4__Purchase_Order_Line__c poLine = new KNDY4__Purchase_Order_Line__c();
                poLine.KNDY4__Purchase_Order__c = purchaseOrder3.Id;
                poLine.KNDY4__Order_Quantity__c = 10;
                poLine.KNDY4__Unit_Price__c = 25;
                poLine.KNDY4__Item__c = itemList[2].Id;
                poLine.KNDY4__Description__c = itemList[2].KNDY4__Description__c;
                poLine.KNDY4__Purchase_UOM__c = itemList[2].KNDY4__Purchasing_UOM__c;
                poLine.KNDY4__Company__c = company.id;
                poLine.KNDY4__Need_Date__c = system.today() + 7;
                poLine.KNDY4__Delivery_Facility__c = facility2.id;
                poLine.KNDY4__Delivery_Location__c = location2.ID;
                poLine.KNDY4__Supplier__c = supplier.Id;
                poLine.KNDY4__Line__c = 1;

                purchaseOrder3Lines.add( poLine );

                KNDY4__Purchase_Order_Line__c poLine2 = new KNDY4__Purchase_Order_Line__c();
                poLine2.KNDY4__Purchase_Order__c = purchaseOrder3.Id;
                poLine2.KNDY4__Order_Quantity__c = 5;
                poLine2.KNDY4__Unit_Price__c = 15;
                poLine2.KNDY4__Item__c = itemList[2].Id;
                poLine2.KNDY4__Description__c = itemList[2].KNDY4__Description__c;
                poLine2.KNDY4__Purchase_UOM__c = itemList[2].KNDY4__Purchasing_UOM__c;
                poLine2.KNDY4__Company__c = company.id;
                poLine2.KNDY4__Need_Date__c = system.today() + 7;
                poLine2.KNDY4__Delivery_Facility__c = facility2.id;
                poLine2.KNDY4__Delivery_Location__c = location2.ID;
                poLine2.KNDY4__Supplier__c = supplier.Id;
                poLine2.KNDY4__Line__c = 1;

                purchaseOrder3Lines.add( poLine2 );
            }

            return purchaseOrder3Lines;
        }
        set;
    }

    public KNDY4__Calendar__c manufacturingCalendar {
        get {
            if (manufacturingCalendar == null) {
                manufacturingCalendar = new KNDY4__Calendar__c(
                        Name = 'MFG Calendar',
                        KNDY4__Company__c = company.Id,
                        KNDY4__Type__c = 'Manufacturing',
                        KNDY4__Start_Date__c = Date.newInstance(Date.today().year(),1,1)
                );
                insert manufacturingCalendar;

                List<KNDY4__Working_Day__c> workingDays = new List<KNDY4__Working_Day__c>();
                Date d = manufacturingCalendar.KNDY4__Start_Date__c;
                while (d < Date.newInstance(Date.today().addYears(2).year(),1,1)) {
                    workingDays.add(new KNDY4__Working_Day__c(
                            KNDY4__Calendar__c = manufacturingCalendar.Id,
                            KNDY4__Start__c = DateTime.newInstance(d,Time.newInstance(9,0,0,0)),
                            KNDY4__End__c = DateTime.newInstance(d,Time.newInstance(17,0,0,0))
                    ));
                    d = d.addDays(1);
                }
                insert workingDays;
            }
            return manufacturingCalendar;
        } set;
    }

    public List<KNDY4__Work_Center__c> workCenters {
        get {
            if (workCenters == null) {
                workCenters = new List<KNDY4__Work_Center__c>();
                for (Integer i=1;i<4;i++) {
                    workCenters.add(new KNDY4__Work_Center__c(
                            Name = 'WC ' + i,
                            KNDY4__Company__c = company.Id,
                            KNDY4__Facility__c = facility2.Id
                    ));
                }
                insert workCenters;
            }
            return workCenters;
        } set;
    }

    public List<KNDY4__Resource__c> resources {
        get {
            if (resources == null) {
                resources = new List<KNDY4__Resource__c>();
                for (Integer i=1;i<4;i++) {
                    resources.add(new KNDY4__Resource__c(
                            Name = 'Resource ' + i,
                            KNDY4__Company__c = company.Id,
                            KNDY4__Facility__c = facility2.Id
                    ));
                }
                insert resources;
            }
            return resources;
        } set;
    }

    public List<KNDY4__Work_Center_Resource__c> wcResources {
        get {
            if (wcResources == null) {
                wcResources = new List<KNDY4__Work_Center_Resource__c>();
                for (Integer i=1;i<4;i++) {
                    wcResources.add(new KNDY4__Work_Center_Resource__c(
                            Name = 'WC Resource ' + i,
                            KNDY4__Company__c = company.Id,
                            KNDY4__Facility__c = facility2.Id,
                            KNDY4__Work_Center__c = workCenters[i-1].Id,
                            KNDY4__Resource__c = resources[i-1].Id
                    ));
                }
                insert wcResources;
            }
            return wcResources;
        } set;
    }

    public KNDY4__Item_Specification__c itemSpec {
        get {
            if (itemSpec == null) {
                itemSpec = new KNDY4__Item_Specification__c(
                        KNDY4__Company__c = company.Id,
                        KNDY4__Facility__c = facility2.Id,
                        KNDY4__Item__c = itemList[5].Id,
                        KNDY4__Revision__c = 'IS',
                        KNDY4__Start_Date__c = System.today() - 1,
                        KNDY4__Costing__c = true,
                        KNDY4__Production__c = true,
                        KNDY4__Copy_Phantom_Routings__c = false,
                        KNDY4__Packaging_UOM__c = uomList[8].Id,
                        KNDY4__Default_Work_Order_Packaging_UOM__c = uomList[8].Id
                );
                insert itemSpec;

                System.assert(routings != null);
                System.assert(components != null);
            }
            return itemSpec;
        } set;
    }

    public List<KNDY4__Routing__c> routings {
        get {
            if (routings == null) {
                if (company.KNDY4__Manufacturing_Calendar__c == null) {
                    company.KNDY4__Manufacturing_Calendar__c = manufacturingCalendar.Id;
                    update company;
                }

                routings = new List<KNDY4__Routing__c>();
                for (Integer i=0;i<3;i++) {
                    routings.add(new KNDY4__Routing__c(
                            KNDY4__Assembly_Item_Specification__c = itemSpec.Id,
                            KNDY4__Company__c = company.Id,
                            KNDY4__Facility__c = facility2.Id,
                            KNDY4__Operation_Sequence__c = 1,
                            KNDY4__Work_Center_Resource__c = wcResources[i].Id,
                            KNDY4__Work_Center__c = wcResources[i].KNDY4__Work_Center__c,
                            KNDY4__Resource_Sequence__c = i + 1,
                            KNDY4__Resource_Quantity__c = 1,
                            KNDY4__Standard_Hours__c = 1,
                            KNDY4__Fixed_Hours__c = false,
                            KNDY4__Backflush_Resource__c = false
                    ));
                }
                insert routings;
            }
            return routings;
        } set;
    }

    public List<KNDY4__Component__c> components {
        get {
            if (components == null) {
                components = new List<KNDY4__Component__c>();
                components.add(new KNDY4__Component__c(
                        KNDY4__Assembly_Item_Specification__c = itemSpec.Id,
                        KNDY4__Quantity_Per_Assembly__c = 1,
                        KNDY4__Component_Item__c = itemList[2].Id,
                        KNDY4__Component_Sequence__c = 1,
                        KNDY4__Company__c = company.Id,
                        KNDY4__Yield__c = 100.00,
                        KNDY4__Type__c = TYPE_BACKFLUSH,
                        KNDY4__Routing__c = routings[0].Id
                ));
                components.add(new KNDY4__Component__c(
                        KNDY4__Assembly_Item_Specification__c = itemSpec.Id,
                        KNDY4__Quantity_Per_Assembly__c = 1,
                        KNDY4__Component_Item__c = itemList[0].Id,
                        KNDY4__Component_Sequence__c = 2,
                        KNDY4__Company__c = company.Id,
                        KNDY4__Yield__c = 100.00,
                        KNDY4__Type__c = TYPE_BACKFLUSH,
                        KNDY4__Routing__c = routings[0].Id
                ));
                insert components;
            }
            return components;
        } set;
    }

    public KNDY4__Item_Specification__c configItemSpec  {
        get {
            if (configItemSpec== null ) {

                configItemSpec = new KNDY4__Item_Specification__c();
                configItemSpec.KNDY4__Company__c = company.id;
                configItemSpec.KNDY4__Item__c = itemList[5].id;
                configItemSpec.KNDY4__Revision__c = 'R1';
                configItemSpec.KNDY4__Start_Date__c = system.today()-1;
                configItemSpec.KNDY4__Configurable__c = true;
                configItemSpec.KNDY4__Costing__c = false;
                configItemSpec.KNDY4__Production__c = false;
                configItemSpec.KNDY4__Packaging_UOM__c = uomList[8].Id;
                configItemSpec.KNDY4__Default_Work_Order_Packaging_UOM__c = uomList[8].Id;

                insert configItemSpec;
                insert configComponents;
            }
            return configItemSpec;
        } set;
    }

    public List<KNDY4__Component__c> configComponents {
        get {
            if ( configComponents == null  ) {
                configComponents = new List<KNDY4__Component__c>();

                KNDY4__Component__c comp1 = new KNDY4__Component__c();
                comp1.KNDY4__Assembly_Item_Specification__c = configItemSpec.Id;
                comp1.KNDY4__Quantity_Per_Assembly__c = 1;
                comp1.KNDY4__Component_Item__c = itemList[2].Id;
                comp1.KNDY4__Company__c = company.id;
                comp1.KNDY4__Yield__c = 100.00;
                comp1.KNDY4__Type__c = 'Backflush';
                comp1.KNDY4__Configuration_Type__c = 'Mandatory';
                configComponents.add( comp1 );

                KNDY4__Component__c comp2 = new KNDY4__Component__c();
                comp2.KNDY4__Assembly_Item_Specification__c = configItemSpec.Id;
                comp2.KNDY4__Quantity_Per_Assembly__c = 1;
                comp2.KNDY4__Component_Item__c = itemList[0].Id;
                comp2.KNDY4__Company__c = company.id;
                comp2.KNDY4__Yield__c = 100.00;
                comp2.KNDY4__Type__c = 'Backflush';
                comp2.KNDY4__Configuration_Type__c = 'Mandatory';
                configComponents.add( comp2 );
            }

            return configComponents;
        }
        set;
    }

    public KNDY4__Work_Order__c workOrder  {
        get {
            if (workOrder== null) {
                workOrder = new KNDY4__Work_Order__c(
                        KNDY4__Company__c = company.Id,
                        KNDY4__Facility__c = facility2.Id,
                        KNDY4__Assembly_Item_Specification__c = itemSpec.Id,
                        KNDY4__Item__c = itemSpec.KNDY4__Item__c,
                        KNDY4__Need_Date2__c = System.today() + 30,
                        KNDY4__Start_Date2__c = DateTime.newInstance(System.today().addDays(1),Time.newInstance(0,0,0,0)),
                        KNDY4__Order_Quantity__c = 10,
                        KNDY4__Status__c = 'Draft',
                        KNDY4__Type__c = 'Regular',
                        KNDY4__Complete_To_Location__c = location6.Id,
                        KNDY4__MRB_Location__c = location2.Id,
                        KNDY4__Default_WIP_Location__c = location7.Id,
                        KNDY4__Notes__c = 'workorder',
                        KNDY4__Currency__c = TestFuel.currencyUSD.ID,
                        KNDY4__Packaging_UOM__c = uomList[8].Id
                );
                insert workOrder;
            }
            return workOrder;
        } set;
    }

    public KNDY4__Customer_Invoice__c custInv1  {
        get {
            if (custInv1== null ) {
                system.assert( company != null && customerBillTo != null && customerSoldTo != null);
                custInv1 = new KNDY4__Customer_Invoice__c();
                custInv1.KNDY4__Company__c = company.id;
                custInv1.KNDY4__Invoice_Type__c = 'Ship Invoice';
                custInv1.KNDY4__Status__c = 'Open';
                custInv1.KNDY4__Bill_To_Customer__c = customerBillTo.id;
                custInv1.KNDY4__Sold_To_Customer__c = customerSoldTo.id;
                insert custInv1;
            }
            return custInv1;
        } set;
    }

    public KNDY4__Tax_Book__c book {
        get{
            if(book == null){
                book = new KNDY4__Tax_Book__c();
                book.Name = 'Corporate';
                book.KNDY4__corporate__c = true;
                book.KNDY4__active__c = true;
                book.KNDY4__Company__c = company.Id;
                insert book;
            }
            return book;
        }
        set;
    }

    public KNDY4__Reason_Code__c deductionCode {
        get{
            if(deductionCode == null){
                deductionCode = new KNDY4__Reason_Code__c();
                deductionCode.KNDY4__Company__c = company.Id;
                deductionCode.KNDY4__Type__c = 'Deductions';
                deductionCode.KNDY4__Code__c = 'D001';
                insert deductionCode;
            }
            return deductionCode;
        }
        set;
    }

    public KNDY4__Reason_Code__c resolutionCode {
        get{
            if(resolutionCode == null){
                resolutionCode = new KNDY4__Reason_Code__c();
                resolutionCode.KNDY4__Company__c = company.Id;
                resolutionCode.KNDY4__Type__c = 'Resolution';
                resolutionCode.KNDY4__Code__c = 'R001';
                insert resolutionCode;
            }
            return resolutionCode;
        }
        set;
    }

    public KNDY4__Asset_Class__c assetClass {
        get{
            if(assetClass == null){
                assetClass = new KNDY4__Asset_Class__c();
                assetClass.name = 'Vehicles';
                assetClass.KNDY4__depreciation_method__c = 'MACRS';
                assetClass.KNDY4__declining_balance__c = '200%';
                assetClass.KNDY4__depreciation_period__c = 'Monthly';
                assetClass.KNDY4__depreciation_convention__c = 'Full Month';
                assetClass.KNDY4__life_in_months__c = 60;
                assetClass.KNDY4__GL_Account__c = cashGL.Id;
                assetClass.KNDY4__Company__c = company.Id;
                insert assetClass;
            }
            return assetClass;
        }
        set;
    }

    public KNDY4__Fixed_Asset__c fixedAsset {
        get{
            if(fixedAsset == null){
                fixedAsset = new KNDY4__Fixed_Asset__c();
                fixedAsset.name = 'Truck';
                fixedAsset.KNDY4__Asset_Class__c = assetClass.Id;
                fixedAsset.KNDY4__company__c = company.Id;
                fixedAsset.KNDY4__tax_book__c = book.Id;
                fixedAsset.KNDY4__Fixed_Asset_Type__c = ASSET_ACCOUNTING;
                fixedAsset.KNDY4__In_Service_Date__c = system.today().addYears(-3);
                fixedAsset.KNDY4__Acquisition_Cost__c = 65000;
                fixedAsset.KNDY4__Residual_Value__c = 5000;
                fixedAsset.KNDY4__Status__c = 'Active';
                fixedAsset.KNDY4__GL_Account__c = cashGL.Id;
                insert fixedAsset;
                fixedAsset = [SELECT Id, name, KNDY4__status__c, KNDY4__company__c, KNDY4__asset_class__c, KNDY4__depreciation_count__c, KNDY4__depreciation_life__c, KNDY4__in_service_date__c,
                        KNDY4__gl_account__c, KNDY4__depreciation_method__c, KNDY4__depreciation_period__c, KNDY4__Estimated_End_of_Life__c, KNDY4__retirement_date__c,
                        KNDY4__acquisition_cost__c, KNDY4__residual_value__c, KNDY4__book_value__c, KNDY4__date_last_depreciated__c, KNDY4__next_depreciation_date__c,
                        KNDY4__asset_tag_number__c, KNDY4__fixed_asset_key__c, KNDY4__Company__r.KNDY4__Default_Transaction_Currency__c, KNDY4__disposition_date__c,
                        KNDY4__depreciation_convention__c, KNDY4__declining_balance__c, KNDY4__Depreciable_Basis__c, KNDY4__Final_Depreciation_Date__c, KNDY4__total_depreciated_value__c
                FROM KNDY4__Fixed_Asset__c WHERE Id = :fixedAsset.Id];
            }
            return fixedAsset;
        }
        set;
    }

    public KNDY4__Order__c transferOrder {
        get {
            if (transferOrder == null) {
                transferOrder = newTransferOrder();
                transferOrder.KNDY4__Order_Date__c = System.today() - 10;
                insert transferOrder;
                insert transferOrderLines;
            }
            return transferOrder;
        } set;
    }

    public KNDY4__Order__c newTransferOrder() {
        KNDY4__Order__c transferOrder = new KNDY4__Order__c(
                KNDY4__Shipping_Company__c = company.id,
                KNDY4__Deliver_To_Facility__c = facility.id,
                KNDY4__Deliver_To_Location__c = location.ID,
                KNDY4__Receiving_Company__c = company.id,
                KNDY4__Ship_From_Facility__c = facility2.id,
                KNDY4__Ship_From_Location__c = location2.ID,
                KNDY4__currency__c = TestFuel.currencyUSD.id,
                KNDY4__Status__c = 'Draft'
        );
        return transferOrder;
    }

    public List<KNDY4__Order_Line__c> transferOrderLines {
        get {
            if ( transferOrderLines == null  ) {
                transferOrderLines = new List<KNDY4__Order_Line__c>();

                KNDY4__Order_Line__c toLine = new KNDY4__Order_Line__c();
                toLine.KNDY4__Order__c = transferOrder.Id;
                toLine.KNDY4__Quantity_Ordered__c = 10;
                toLine.KNDY4__Description__c = itemList[0].KNDY4__Description__c;
                toLine.KNDY4__Receiving_Item__c = itemList[0].Id;
                toLine.KNDY4__Receiving_Company__c = company.id;
                toLine.KNDY4__Required_Date__c = system.today() + 7;
                toLine.KNDY4__Deliver_To_Facility__c = facility.id;
                toLine.KNDY4__Deliver_To_Location__c = location.ID;
                toLine.KNDY4__Shipping_Item__c = itemList[0].Id;
                toLine.KNDY4__Shipping_Company__c = company.id;
                toLine.KNDY4__Required_Date__c = system.today() + 7;
                toLine.KNDY4__Ship_From_Facility__c = facility2.id;
                toLine.KNDY4__Ship_From_Location__c = location2.ID;
                transferOrderLines.add( toLine );

                KNDY4__Order_Line__c toLine1 = new KNDY4__Order_Line__c();
                toLine1.KNDY4__Order__c = transferOrder.Id;
                toLine1.KNDY4__Quantity_Ordered__c = 15;
                toLine1.KNDY4__Description__c = itemList[5].KNDY4__Description__c;
                toLine1.KNDY4__Receiving_Item__c = itemList[5].Id;
                toLine1.KNDY4__Receiving_Company__c = company.id;
                toLine1.KNDY4__Required_Date__c = system.today() + 7;
                toLine1.KNDY4__Deliver_To_Facility__c = facility.id;
                toLine1.KNDY4__Deliver_To_Location__c = location.ID;
                toLine1.KNDY4__Shipping_Item__c = itemList[5].Id;
                toLine1.KNDY4__Shipping_Company__c = company.id;
                toLine1.KNDY4__Required_Date__c = system.today() + 7;
                toLine1.KNDY4__Ship_From_Facility__c = facility2.id;
                toLine1.KNDY4__Ship_From_Location__c = location2.ID;
                transferOrderLines.add( toLine1 );
            }

            return transferOrderLines;
        }
        set;
    }
    //TODO: ADD GET;SET; JW-8-1-2014
    public List<KNDY4__Segment_Definition__c> customsegList = new List<KNDY4__Segment_Definition__c>();{

        List<KNDY4__Segment_Definition__c> existingSegs = KNDY4__Segment_Definition__c.getAll().Values();
        boolean hasCompany = false;
        boolean hasGL = false;
        boolean hasInterco = false;
        for(KNDY4__Segment_Definition__c sd : existingSegs){
            if(sd.Name == 'KNDY4__Company__c'){
                hasCompany = true;
            }else if(sd.Name == 'KNDY4__GL_Account__c'){
                hasGL = true;
            }else if(sd.Name == 'KNDY4__Intercompany__c'){
                hasInterco = true;
            }
        }

        if(!hasCompany){
            KNDY4__Segment_Definition__c custom_seg1 = new KNDY4__Segment_Definition__c();
            custom_seg1.Name = 'KNDY4__Company__c';
            custom_seg1.KNDY4__Accounting_Entry_Field__c = 'KNDY4__Company__c'; // just need a field to stuff into
            custom_seg1.KNDY4__Object_API_Name__c = 'KNDY4__Company__c';
            custom_seg1.KNDY4__Segment_Number__c = 1;
            customsegList.add(custom_seg1);
        }

        if(!hasGL){
            KNDY4__Segment_Definition__c custom_seg2 = new KNDY4__Segment_Definition__c();
            custom_seg2.Name = 'KNDY4__GL_Account__c';
            custom_seg2.KNDY4__Accounting_Entry_Field__c = 'KNDY4__GL_Account__c'; // just need a field to stuff into
            custom_seg2.KNDY4__Object_API_Name__c = 'KNDY4__GL_Account__c';
            custom_seg2.KNDY4__Accounting_Rule_Segment__c = 'KNDY4__GL_Account__c';
            custom_seg2.KNDY4__Accounting_Rule_Reference_Value__c = 'KNDY4__GL_Account_Reference_Value__c';
            custom_seg2.KNDY4__Accounting_Rule_Default__c = 'KNDY4__Default_GL_Account__c';
            custom_seg2.KNDY4__Segment_Number__c = 2;
            customsegList.add(custom_seg2);
        }

        if(!hasInterco){
            KNDY4__Segment_Definition__c custom_seg3 = new KNDY4__Segment_Definition__c();
            custom_seg3.Name = 'KNDY4__Intercompany__c';
            custom_seg3.KNDY4__Accounting_Entry_Field__c = 'KNDY4__Intercompany__c'; // just need a field to stuff into
            custom_seg3.KNDY4__Object_API_Name__c = 'KNDY4__Intercompany__c';
            custom_seg3.KNDY4__Accounting_Rule_Segment__c = 'KNDY4__Intercompany__c';
            custom_seg3.KNDY4__Accounting_Rule_Reference_Value__c = 'KNDY4__Intercompany_Reference_Value__c';
            custom_seg3.KNDY4__Accounting_Rule_Default__c = 'KNDY4__Default_Intercompany__c';
            custom_seg3.KNDY4__Segment_Number__c = 3;
            customsegList.add(custom_seg3);
        }

        insert customsegList;
    }

    public List<KNDY4__Accounting_Default_Segment_Definition__c> customAccountingDefaultSegmentList = new List<KNDY4__Accounting_Default_Segment_Definition__c>();{

        List<KNDY4__Accounting_Default_Segment_Definition__c> existingSegs = KNDY4__Accounting_Default_Segment_Definition__c.getAll().Values();
        boolean hasCompany = false;
        boolean hasGL = false;
        boolean hasinterco = false;
        for(KNDY4__Accounting_Default_Segment_Definition__c sd : existingSegs){
            if(sd.Name == 'KNDY4__Company__c'){
                hasCompany = true;
            }else if(sd.Name == 'KNDY4__GL_Account__c'){
                hasGL = true;
            }else if(sd.Name == 'KNDY4__Intercompany__c'){
                hasinterco = true;
            }
        }

        if(!hasCompany){
            KNDY4__Accounting_Default_Segment_Definition__c custom_seg1 = new KNDY4__Accounting_Default_Segment_Definition__c();
            custom_seg1.Name = 'KNDY4__Company__c';
            custom_seg1.KNDY4__Accounting_Default_Field__c = 'KNDY4__Company__c'; // just need a field to stuff into
            custom_seg1.KNDY4__Object_API_Name__c = 'KNDY4__Company__c';
            custom_seg1.KNDY4__Segment_Number__c = 1;
            customAccountingDefaultSegmentList.add(custom_seg1);
        }

        if(!hasGL){
            KNDY4__Accounting_Default_Segment_Definition__c custom_seg2 = new KNDY4__Accounting_Default_Segment_Definition__c();
            custom_seg2.Name = 'KNDY4__GL_Account__c';
            custom_seg2.KNDY4__Accounting_Default_Field__c = 'KNDY4__GL_Account__c'; // just need a field to stuff into
            custom_seg2.KNDY4__Object_API_Name__c = 'KNDY4__GL_Account__c';
            custom_seg2.KNDY4__Segment_Number__c = 2;
            customAccountingDefaultSegmentList.add(custom_seg2);
        }

        if(!hasinterco){
            KNDY4__Accounting_Default_Segment_Definition__c custom_seg3 = new KNDY4__Accounting_Default_Segment_Definition__c();
            custom_seg3.Name = 'KNDY4__Intercompany__c';
            custom_seg3.KNDY4__Accounting_Default_Field__c = 'KNDY4__Intercompany__c'; // just need a field to stuff into
            custom_seg3.KNDY4__Object_API_Name__c = 'KNDY4__Intercompany__c';
            custom_seg3.KNDY4__Segment_Number__c = 3;
            customAccountingDefaultSegmentList.add(custom_seg3);
        }

        insert customAccountingDefaultSegmentList;
    }

    // create the default wide rule which will allow any combination for the segments
    public List<KNDY4__Segment_Validation__c> svList = new List<KNDY4__Segment_Validation__c>();{
        KNDY4__Segment_Validation__c sv1 = new KNDY4__Segment_Validation__c();
        sv1.KNDY4__segment_1__c = '*';
        sv1.KNDY4__segment_2__c = '*';
        sv1.KNDY4__segment_3__c = '*';
        sv1.KNDY4__active__c = true;
        svList.add(sv1);
        KNDY4__Segment_Validation__c sv2 = new KNDY4__Segment_Validation__c();
        sv2.KNDY4__segment_1__c = '*';
        sv2.KNDY4__segment_2__c = null;
        sv2.KNDY4__segment_3__c = null;
        sv2.KNDY4__active__c = true;
        svList.add(sv2);
        insert svList;

    }



    public KNDY4__Contract__c contract {

        get {
            if ( contract == null  ) {
                contract = newContract();
                insert contract;
                insert contractLines;
            }
            return contract;
        }

        set;
    }

    public KNDY4__Contract__c newContract() {
        KNDY4__Contract__c contract = new KNDY4__Contract__c();
        contract.Name = 'TestContract';
        contract.KNDY4__Contract_Start__c = Date.today().addDays(-1);
        contract.KNDY4__Contract_End__c = Date.today().addDays(4);
        contract.OwnerID = System.Userinfo.getUserId();
        contract.KNDY4__Status__c = 'Open';
        contract.KNDY4__Supplier__c = supplier.id;
        contract.KNDY4__Company__c = company.Id;
        contract.KNDY4__FOB_Term__c = fobTerm.id;
        contract.KNDY4__Payment_Term__c = terms.id;
        contract.KNDY4__Ship_to_Facility__c = facility2.Id;
        contract.KNDY4__Transportation_Mode__c = 'RAIL';
        contract.KNDY4__Currency__c = TestFuel.currencyUSD.id;
        return contract;
    }

    public List<KNDY4__Contract_Line__c> contractLines {
        get {
            if ( contractLines == null ) {
                contractLines = new List<KNDY4__Contract_Line__c>();
                KNDY4__Contract_Line__c contractLine = new KNDY4__Contract_Line__c();
                contractLine.KNDY4__Contract__c = contract.Id;
                contractLine.KNDY4__Company__c = company.Id;
                contractLine.KNDY4__Item__c = itemlist[0].id;
                contractLine.Name = 'Test CTL 1';
                contractLine.KNDY4__Contract_Start__c = Date.today().addDays(-1);
                contractLine.KNDY4__Contract_End__c = Date.today().addDays(4);
                contractLine.KNDY4__Status__c = 'Open';
                contractLine.KNDY4__Negotiated_Price__c = 10;
                contractLine.KNDY4__Contract_Quantity__c = 1000;
                contractLine.KNDY4__Type__c = 'Fixed';
                contractLine.KNDY4__Consigned__c = false;
                contractLine.KNDY4__Purchased_Quantity__c = 0;
                contractLine.KNDY4__Quantity_Received__c = 0;
                contractLine.KNDY4__Quantity_Still_Due__c = 0;
                contractLine.KNDY4__Quantity_Returned__c = 0;
                contractLines.add(contractLine);
            }

            return contractLines;
        }
        set;
    }

    public KNDY4__Category__c categoryBilling{
        get{
            if(categoryBilling == null){
                categoryBilling = new KNDY4__Category__c();
                categoryBilling.Name = 'Billing Category';
                categoryBilling.KNDY4__Type__c = 'Billing';
                insert categoryBilling;

            }
            return categoryBilling;
        }
        set;
    }
    public KNDY4__Category__c categoryFulfillment {
        get{
            if(categoryFulfillment == null){
                categoryFulfillment = new KNDY4__Category__c();
                categoryFulfillment.Name = 'Fulfillment  Category';
                categoryFulfillment.KNDY4__Type__c = 'Fulfillment ';
                insert categoryFulfillment;

            }
            return categoryFulfillment;
        }
        set;
    }

    public KNDY4__Product__c configProduct {
        get{
            if(configProduct == null){
                List<KNDY4__Product__c> prods = new List<KNDY4__Product__c>();
                configProduct = new KNDY4__Product__c();
                configProduct.KNDY4__Product_Type__c = 'Configurable';
                configProduct.KNDY4__Item__c = configItemSpec.KNDY4__Item__c;
                configProduct.KNDY4__Company__c = configItemSpec.KNDY4__Company__c;
                configProduct.KNDY4__Selling_UOM__c = uomObj.Id;
                prods.add(configProduct);
                for(KNDY4__Component__c comp : configComponents){
                    KNDY4__Product__c iProd = new KNDY4__Product__c();
                    iProd.KNDY4__Product_Type__c = 'Product';
                    iProd.KNDY4__Status__c = 'Active';
                    iProd.KNDY4__Used__c = false;
                    iProd.KNDY4__Item__c = comp.KNDY4__Component_Item__c;
                    iProd.KNDY4__Company__c = comp.KNDY4__Company__c;
                    iProd.KNDY4__Selling_UOM__c = uomObj.Id;
                    prods.add(iProd);
                }
                insert prods;
                List<KNDY4__Pricebook_Line__c> pbls = new List<KNDY4__Pricebook_Line__c>();
                integer counter = 0;
                for(KNDY4__Product__c p : prods){
                    KNDY4__Pricebook_Line__c iPL =new KNDY4__Pricebook_Line__c();
                    iPL.KNDY4__product__c = p.Id;
                    iPL.KNDY4__pricebook__c = this.pricebook.id;
                    iPL.KNDY4__price__c = 100 + counter;
                    iPL.KNDY4__start_date__c = system.today().adddays(0);
                    iPL.KNDY4__end_date__c = system.today().adddays(10);
                    pbls.add(iPL);
                    counter++;
                }
                database.insert(pbls, false);
            }
            return configProduct;
        }set;
    }

    public KNDY4__Plan__c plan{
        get{
            if(plan == null){
                plan = new KNDY4__Plan__c();
                plan.Name = 'Sample Plan';
                plan.KNDY4__Parent_Customer__c = customerParent.Id;
                plan.KNDY4__Start_Date__c = system.today();
                insert plan;
            }
            return plan;
        }
        set;
    }

    public KNDY4__Agreement__c agreement{
        get{
            if(agreement == null){
                agreement = new KNDY4__Agreement__c();
                agreement.KNDY4__Company__c = company.Id;
                agreement.Name = 'Sample Agreement';
                agreement.KNDY4__Plan__c = plan.Id;
                agreement.KNDY4__Customer__c = customerParent.Id;
                agreement.KNDY4__Start_Date__c = system.today();
                agreement.KNDY4__Status__c = 'Approved';
                agreement.KNDY4__Customer_Type__c = 'Bill To';
                agreement.KNDY4__Currency__c = TestFuel.currencyGBP.id;
                agreement.KNDY4__Payment_Terms__c = terms.Id;
                insert agreement;
                KNDY4__Agreement_Line__c agl = agreementLine;
            }
            return agreement;
        }
        set;
    }

    public KNDY4__Agreement_Line__c agreementLine {
        get{
            if(agreementLine == null){
                agreementLine = new KNDY4__Agreement_Line__c();
                agreementLine.KNDY4__Agreement__c = agreement.Id;
                agreementLine.KNDY4__Start_Date__c = agreement.KNDY4__Start_Date__c;
                agreementLine.KNDY4__Occurrence__c = 'Monthly';
                agreementLine.KNDY4__Rate_Basis__c = 'Quantity';
                agreementLine.KNDY4__Occurrence_Count__c = 12;
                agreementLine.KNDY4__Product__c = configProduct.Id;
                agreementLine.KNDY4__Product_Type__c = 'Configurable';
                agreementLine.KNDY4__Sales_Agreement_Quantity__c = 10000;
                agreementLine.KNDY4__Agreement_Price__c = 100;
                agreementLine.KNDY4__Description__c = 'Sample Agreement Line 1';
                insert agreementLine;
            }
            return agreementLine;
        }
        set;
    }
    public KNDY4__Agreement_Line__c agreementLine1 {
        get{
            if(agreementLine1 == null){
                agreementLine1= new KNDY4__Agreement_Line__c();
                agreementLine1.KNDY4__Agreement__c = agreement.Id;
                agreementLine1.KNDY4__Start_Date__c = agreement.KNDY4__Start_Date__c;
                agreementLine1.KNDY4__Product__c = Product.Id;
                agreementLine1.KNDY4__Sales_Agreement_Quantity__c = 1000;
                agreementLine1.KNDY4__Agreement_Price__c = 10;
                agreementLine1.KNDY4__Description__c = 'Sample Agreement Line 2';
                insert agreementLine1;
            }
            return agreementLine1;
        }
        set;
    }

    public list<KNDY4__Bank_Transaction__c> bankTransactions{
        get{
            if(bankTransactions == null){
                bankTransactions = new list<KNDY4__Bank_Transaction__c>();

                KNDY4__Bank_Transaction__c bankTransaction = new KNDY4__Bank_Transaction__c();
                bankTransaction.KNDY4__Amount__c = -5000.00;
                bankTransaction.KNDY4__Currency__c = TestFuel.currencyUSD.id;
                bankTransaction.KNDY4__Bank_Account__c = bankAccount.Id;
                bankTransaction.KNDY4__Company__c = company.Id;
                bankTransaction.KNDY4__Transaction_Type__c = 'Credit';
                bankTransaction.KNDY4__Reference_Number__c = '123s44567mnJ';
                bankTransaction.KNDY4__Source__c = 'Yodlee';
                bankTransaction.KNDY4__Transacted_With__c = 'ABCL';
                bankTransaction.KNDY4__Transaction_Date__c = System.now();
                bankTransaction.KNDY4__Payment_Method__c = 'Wire';
                bankTransaction.KNDY4__SubTransaction_Type__c = 'Credit';
                bankTransaction.KNDY4__Bank_Account__c = bankAccount.Id;
                bankTransactions.add(bankTransaction);

                bankTransaction = new KNDY4__Bank_Transaction__c();
                bankTransaction.KNDY4__Amount__c = 3000.00;
                bankTransaction.KNDY4__Currency__c = TestFuel.currencyUSD.id;
                bankTransaction.KNDY4__Bank_Account__c = bankAccount.Id;
                bankTransaction.KNDY4__Company__c = company.Id;
                bankTransaction.KNDY4__Transaction_Type__c = 'Debit';
                bankTransaction.KNDY4__Reference_Number__c = '123s44567mnK';
                bankTransaction.KNDY4__Source__c = 'Yodlee';
                bankTransaction.KNDY4__Transacted_With__c = 'HDFC';
                bankTransaction.KNDY4__Transaction_Date__c = System.now();
                bankTransaction.KNDY4__Payment_Method__c = 'Check';
                bankTransaction.KNDY4__SubTransaction_Type__c = 'Debit';
                bankTransaction.KNDY4__Bank_Account__c = bankAccount.Id;
                bankTransactions.add(bankTransaction);

                bankTransaction = new KNDY4__Bank_Transaction__c();
                bankTransaction.KNDY4__Amount__c = -3000.00;
                bankTransaction.KNDY4__Currency__c = TestFuel.currencyUSD.id;
                bankTransaction.KNDY4__Bank_Account__c = bankAccount.Id;
                bankTransaction.KNDY4__Company__c = company.Id;
                bankTransaction.KNDY4__Transaction_Type__c = 'Credit';
                bankTransaction.KNDY4__Reference_Number__c = '123s44567mnL';
                bankTransaction.KNDY4__Source__c = 'Yodlee';
                bankTransaction.KNDY4__Transacted_With__c = 'KPMG';
                bankTransaction.KNDY4__Transaction_Date__c = System.now();
                bankTransaction.KNDY4__Payment_Method__c = 'Cash';
                bankTransaction.KNDY4__SubTransaction_Type__c = 'Credit';
                bankTransaction.KNDY4__Bank_Account__c = bankAccount.Id;
                bankTransactions.add(bankTransaction);
                insert bankTransactions;
            }
            return bankTransactions;
        }
        set;
    }

    public list<KNDY4__Customer_Receipt__c> customerReceipts{
        get{
            if(customerReceipts == null){
                customerReceipts = new list<KNDY4__Customer_Receipt__c>();

                KNDY4__Customer_Receipt__c customerReceipt = new KNDY4__Customer_Receipt__c();
                customerReceipt.KNDY4__Amount_Received__c = 3000.00;
                customerReceipt.KNDY4__Amount_Unapplied__c = 0;
                //customerReceipt.KNDY4__Payment_Method_G__c = 'Wire';
                customerReceipt.KNDY4__Company__c = company.Id;
                customerReceipt.KNDY4__Customer__c = customerbillto.Id;
                customerReceipt.KNDY4__Date_Received__c = system.now();
                customerReceipt.KNDY4__Currency__c = TestFuel.currencyUSD.id;
                customerReceipt.KNDY4__exception__c = false;
                customerReceipt.KNDY4__Reference_Number__c = '123s44567mnJ';
                customerReceipt.KNDY4__Bank_Account_2__c = bankAccount.Id;
                customerReceipt.KNDY4__Type__c = 'Prepayment';
                customerReceipt.KNDY4__transaction_date__c = system.now();

                //customerReceipt.KNDY4__Deposit_Identifier__c = 'deposit id';

                customerReceipts.add(customerReceipt);

                KNDY4__Customer_Receipt__c customerReceipt2 = new KNDY4__Customer_Receipt__c();
                customerReceipt2.KNDY4__Amount_Received__c = 2000.00;
                customerReceipt2.KNDY4__Amount_Unapplied__c = 0;
                //customerReceipt2.KNDY4__Payment_Method_G__c = 'Credit card';
                customerReceipt2.KNDY4__Company__c = company.Id;
                customerReceipt2.KNDY4__Customer__c = customerbillto.Id;
                customerReceipt2.KNDY4__Date_Received__c = system.now();
                customerReceipt2.KNDY4__Currency__c = TestFuel.currencyUSD.id;
                customerReceipt2.KNDY4__exception__c = false;
                customerReceipt2.KNDY4__Reference_Number__c = '123s44567mnJ';
                customerReceipt2.KNDY4__Bank_Account_2__c = bankAccount.Id;
                customerReceipt.KNDY4__Type__c = 'Prepayment';
                customerReceipt2.KNDY4__transaction_date__c = system.now();

                customerReceipts.add(customerReceipt2);

                insert customerReceipts;
            }
            return customerReceipts;
        }
        set;
    }

    public list<KNDY4__Customer_Receipt_Line__c> customerReceiptLines{
        get{
            if(customerReceiptLines == null){
                customerReceiptLines = new list<KNDY4__Customer_Receipt_Line__c>();
                KNDY4__Customer_Receipt_Line__c additionalPayment = new KNDY4__Customer_Receipt_Line__c();
                additionalPayment.KNDY4__Amount__c = 2000;
                additionalPayment.KNDY4__Customer_Receipt__c = customerReceipts[0].Id;
                additionalPayment.KNDY4__Type__c = TYPE_PREPAYMENT;
                customerReceiptLines.add(additionalPayment);

                KNDY4__Customer_Receipt_Line__c additionalPayment2 = new KNDY4__Customer_Receipt_Line__c();
                additionalPayment2.KNDY4__Amount__c = 1000;
                additionalPayment2.KNDY4__Customer_Receipt__c = customerReceipts[0].Id;
                additionalPayment2.KNDY4__Type__c = TYPE_PREPAYMENT;
                customerReceiptLines.add(additionalPayment2);

                KNDY4__Customer_Receipt_Line__c additionalPayment3 = new KNDY4__Customer_Receipt_Line__c();
                additionalPayment3.KNDY4__Amount__c = 1500;
                additionalPayment3.KNDY4__Customer_Receipt__c = customerReceipts[1].Id;
                additionalPayment3.KNDY4__Type__c = TYPE_PREPAYMENT;
                customerReceiptLines.add(additionalPayment3);

                KNDY4__Customer_Receipt_Line__c additionalPayment4 = new KNDY4__Customer_Receipt_Line__c();
                additionalPayment4.KNDY4__Amount__c = 500;
                additionalPayment4.KNDY4__Customer_Receipt__c = customerReceipts[1].Id;
                additionalPayment4.KNDY4__Type__c = TYPE_PREPAYMENT;
                customerReceiptLines.add(additionalPayment4);

                insert customerReceiptLines;
            }
            return customerReceiptLines;
        }
        set;
    }

    public list<KNDY4__Accounting_Entry__c> accountingEntries{
        get{
            if(accountingEntries == null){
                accountingEntries = new list<KNDY4__Accounting_Entry__c>();
                KNDY4__Accounting_Entry__c accountingEntry = new KNDY4__Accounting_Entry__c();
                accountingEntry.KNDY4__source_document_object_name__c = 'KNDY4__Customer_Receipt__c';
                accountingEntry.KNDY4__Company__c = company.Id;
                accountingEntry.KNDY4__Customer_Receipt__c = customerReceipts[0].Id;
                accountingEntry.name = 'One';
                accountingEntry.KNDY4__Status__c = 'Active';
                accountingEntry.KNDY4__Transaction_Type__c = 'Std';
                accountingEntries.add(accountingEntry);

                KNDY4__Accounting_Entry__c accountingEntry1 = new KNDY4__Accounting_Entry__c();
                accountingEntry1.KNDY4__source_document_object_name__c = 'KNDY4__Customer_Receipt__c';
                accountingEntry1.KNDY4__Company__c = company.Id;
                accountingEntry1.KNDY4__Customer_Receipt__c = customerReceipts[1].Id;
                accountingEntry1.name = 'Two';
                accountingEntry1.KNDY4__Status__c = 'Active';
                accountingEntry1.KNDY4__Transaction_Type__c = 'Std';
                accountingEntries.add(accountingEntry1);

                insert accountingEntries;
            }
            return accountingEntries;
        }
        set;
    }
    public list<KNDY4__Journal_Entry_Line__c> journalEntryLines{
        get{
            if(journalEntryLines == null){
                list<KNDY4__Journal_Entry__c> lstJournalEntry = new list<KNDY4__Journal_Entry__c>();

                KNDY4__Journal_Entry__c journalEntry = new KNDY4__Journal_Entry__c();
                journalEntry.name = 'JE001';
                journalEntry.KNDY4__Company__c = company.id;
                journalEntry.KNDY4__type__c = 'Bank Transaction';
                journalEntry.KNDY4__Transaction_Type__c = 'Manual';
                journalEntry.KNDY4__Transaction_Date__c = system.now();
                journalEntry.KNDY4__Period__c = periodList[0].Id;
                journalEntry.KNDY4__Currency__c = TestFuel.currencyUSD.id;
                lstJournalEntry.add(journalEntry);

                KNDY4__Journal_Entry__c journalEntry2 = new KNDY4__Journal_Entry__c();
                journalEntry2.name = 'JE001';
                journalEntry2.KNDY4__Company__c = company.id;
                journalEntry2.KNDY4__type__c = 'Bank Transaction';
                journalEntry2.KNDY4__Transaction_Type__c = 'Manual';
                journalEntry.KNDY4__Transaction_Date__c = system.now();
                journalEntry2.KNDY4__Currency__c = TestFuel.currencyUSD.id;
                journalEntry2.KNDY4__Period__c = periodList[0].Id;
                lstJournalEntry.add(journalEntry2);

                insert lstJournalEntry;

                journalEntryLines = new List<KNDY4__Journal_Entry_Line__c>();

                KNDY4__Journal_Entry_Line__c jeLine1 = new KNDY4__Journal_Entry_Line__c();
                jeLine1.KNDY4__Journal_Entry__c = lstJournalEntry[0].id;
                jeLine1.KNDY4__Amount_CR__c = 1000.00;
                jeLine1.KNDY4__GL_Account__c = cashGL.id;
                jeLine1.KNDY4__Bank_Transaction__c = bankTransactions[0].Id;
                jeLine1.KNDY4__Subtransaction_Type__c = 'Write Off';
                journalEntryLines.add(jeLine1);

                KNDY4__Journal_Entry_Line__c jeLine2 = new KNDY4__Journal_Entry_Line__c();
                jeLine2.KNDY4__Journal_Entry__c = lstJournalEntry[0].id;
                jeLine2.KNDY4__Amount_DR__c = 1000.00;
                jeLine2.KNDY4__GL_Account__c = cashGL.id;
                jeLine2.KNDY4__Subtransaction_Type__c = 'Write Off';
                journalEntryLines.add(jeLine2);


                KNDY4__Journal_Entry_Line__c jeLine3 = new KNDY4__Journal_Entry_Line__c();
                jeLine3.KNDY4__Journal_Entry__c = lstJournalEntry[1].id;
                jeLine3.KNDY4__Amount_DR__c = 500.00;
                jeLine3.KNDY4__GL_Account__c = cashGL.id;
                jeLine3.KNDY4__Subtransaction_Type__c = 'Write Off';
                journalEntryLines.add(jeLine3);

                KNDY4__Journal_Entry_Line__c jeLine4 = new KNDY4__Journal_Entry_Line__c();
                jeLine4.KNDY4__Journal_Entry__c = lstJournalEntry[1].id;
                jeLine4.KNDY4__Amount_CR__c = 500.00;
                jeLine4.KNDY4__GL_Account__c = cashGL.id;
                jeLine4.KNDY4__Bank_Transaction__c = bankTransactions[1].Id;
                jeLine4.KNDY4__Subtransaction_Type__c = 'Write Off';
                journalEntryLines.add(jeLine4);

                insert journalEntryLines;
                journalEntry.KNDY4__Finalized__c = true;
                journalEntry2.KNDY4__Finalized__c = true;
                update lstJournalEntry;

            }
            return journalEntryLines;
        }
        set;
    }

    public list<KNDY4__Accounting_Entry_Line__c> JEAccountingEntriesLines{
        get{
            if(JEAccountingEntriesLines == null){
                list<KNDY4__Accounting_Entry__c> JEAccountingEntries = new list<KNDY4__Accounting_Entry__c>();
                KNDY4__Accounting_Entry__c accountingEntry = new KNDY4__Accounting_Entry__c();
                accountingEntry.KNDY4__Company__c = company.Id;
                accountingEntry.KNDY4__Journal_Entry__c = journalEntryLines[0].KNDY4__Journal_Entry__c;
                accountingEntry.KNDY4__source_document_object_name__c = 'KNDY4__Journal_Entry__c';
                accountingEntry.name = 'One';
                accountingEntry.KNDY4__Status__c = 'Active';
                accountingEntry.KNDY4__Transaction_Type__c = 'Std';
                JEAccountingEntries.add(accountingEntry);

                KNDY4__Accounting_Entry__c accountingEntry1 = new KNDY4__Accounting_Entry__c();
                accountingEntry1.KNDY4__Company__c = company.Id;
                accountingEntry1.KNDY4__Journal_Entry__c = journalEntryLines[2].KNDY4__Journal_Entry__c;
                accountingEntry1.KNDY4__source_document_object_name__c = 'KNDY4__Journal_Entry__c';
                accountingEntry1.name = 'Two';
                accountingEntry1.KNDY4__Status__c = 'Active';
                accountingEntry1.KNDY4__Transaction_Type__c = 'Std';
                JEAccountingEntries.add(accountingEntry1);

                insert JEAccountingEntries;

                JEAccountingEntriesLines = new list<KNDY4__Accounting_Entry_Line__c>();
                KNDY4__Accounting_Entry_Line__c accountingEntryLine = new KNDY4__Accounting_Entry_Line__c();
                accountingEntryLine.KNDY4__Amount_CR__c = 1000;
                accountingEntryLine.KNDY4__Amount_DR__c = 0;
                accountingEntryLine.KNDY4__GL_Account__c = cashGL.id;
                accountingEntryLine.KNDY4__Transaction_Date__c = system.today();
                accountingEntryLine.KNDY4__Accounting_Entry__c = JEAccountingEntries[0].id;
                accountingEntryLine.KNDY4__Journal_Entry_Line__c = journalEntryLines[0].id;
                accountingEntryLine.KNDY4__Company__c = company.Id;
                JEAccountingEntriesLines.add(accountingEntryLine);

                KNDY4__Accounting_Entry_Line__c accountingEntryLine2 = new KNDY4__Accounting_Entry_Line__c();
                accountingEntryLine2.KNDY4__Amount_DR__c = 1000;
                accountingEntryLine2.KNDY4__Amount_CR__c = 0;
                accountingEntryLine2.KNDY4__GL_Account__c = cashGL.id;
                accountingEntryLine2.KNDY4__Transaction_Date__c = system.today();
                accountingEntryLine2.KNDY4__Accounting_Entry__c = JEAccountingEntries[0].id;
                accountingEntryLine2.KNDY4__Journal_Entry_Line__c = journalEntryLines[1].id;
                accountingEntryLine2.KNDY4__Company__c = company.Id;
                JEAccountingEntriesLines.add(accountingEntryLine2);

                KNDY4__Accounting_Entry_Line__c accountingEntryLine3 = new KNDY4__Accounting_Entry_Line__c();
                accountingEntryLine3.KNDY4__Amount_CR__c = 500;
                accountingEntryLine3.KNDY4__Amount_DR__c = 0;
                accountingEntryLine3.KNDY4__GL_Account__c = cashGL.id;
                accountingEntryLine3.KNDY4__Transaction_Date__c = system.today();
                accountingEntryLine3.KNDY4__Accounting_Entry__c = JEAccountingEntries[1].id;
                accountingEntryLine3.KNDY4__Journal_Entry_Line__c = journalEntryLines[2].id;
                accountingEntryLine3.KNDY4__Company__c = company.Id;
                JEAccountingEntriesLines.add(accountingEntryLine3);

                KNDY4__Accounting_Entry_Line__c accountingEntryLine4 = new KNDY4__Accounting_Entry_Line__c();
                accountingEntryLine4.KNDY4__Amount_DR__c = 500;
                accountingEntryLine4.KNDY4__Amount_CR__c = 0;
                accountingEntryLine4.KNDY4__GL_Account__c = cashGL.id;
                accountingEntryLine4.KNDY4__Transaction_Date__c = system.today();
                accountingEntryLine4.KNDY4__Accounting_Entry__c = JEAccountingEntries[1].id;
                accountingEntryLine4.KNDY4__Journal_Entry_Line__c = journalEntryLines[3].id;
                accountingEntryLine4.KNDY4__Company__c = company.Id;
                JEAccountingEntriesLines.add(accountingEntryLine4);

                insert JEAccountingEntriesLines;
            }
            return JEAccountingEntriesLines;
        }
        set;
    }

    public list<KNDY4__Supplier_Payment__c> supplierPayments{
        get{
            if(supplierPayments == null){
                supplierPayments = new list<KNDY4__Supplier_Payment__c>();
                KNDY4__Payment_Term__c paymentTermInfo = new KNDY4__Payment_Term__c();
                paymentTermInfo.KNDY4__due_days__c = 30;
                paymentTermInfo.KNDY4__discount_days__c = 30;
                paymentTermInfo.KNDY4__Discount_Percent__c = 10.0;
                insert paymentTermInfo;

                map <string,string> rtMap1 = KSE.RecordTypeDevNameMap('KNDY4__Supplier__c');

                //Create Supplier, assign remit and payment terms info
                KNDY4__Supplier__c supplier = new KNDY4__Supplier__c();
                supplier.Name = 'Test';
                supplier.KNDY4__Payment_Term__c = paymentTermInfo.Id;
                //supplier.KNDY4__Payment_Method_G__c = 'Check';
                supplier.KNDY4__Company__c = company.Id;
                supplier.KNDY4__Status__c = 'Active';
                supplier.KNDY4__Type__c = 'Remit-To';
                supplier.RecordTypeId = rtMap1.get('Remit_To');
                insert supplier;

                KNDY4__Supplier_Payment__c suppPay1 = new KNDY4__Supplier_Payment__c();
                suppPay1.KNDY4__Payment_Amount__c = 2000.00;
                suppPay1.KNDY4__Date_Paid__c = system.now();
                suppPay1.KNDY4__transaction_date__c = system.now();
                //suppPay1.KNDY4__Bank_Account__c = bankAccount.id ;
                suppPay1.KNDY4__Company__c = company.Id;
                suppPay1.KNDY4__Finalized__c = true;
                suppPay1.KNDY4__finalized_date__c = system.now();
                suppPay1.KNDY4__Supplier__c = supplier.Id;
                suppPay1.KNDY4__Currency__c = TestFuel.currencyUSD.id;
                suppPay1.KNDY4__historical__c = false;
                //KNDY-17923 - deperecated 'KNDY4__Check_Number__c'
                //suppPay1.KNDY4__Check_Number__c = 8987;
                suppPay1.KNDY4__Reference__c = '8987';
                supplierPayments.add(suppPay1);

                KNDY4__Supplier_Payment__c suppPay2 = new KNDY4__Supplier_Payment__c();
                suppPay2.KNDY4__Payment_Amount__c = 1000;
                suppPay2.KNDY4__Date_Paid__c = system.now();
                suppPay2.KNDY4__transaction_date__c = system.now();
                //suppPay2.KNDY4__Payment_Method_G__c = 'Check';
                suppPay2.KNDY4__Bank_Account__c = bankAccount.id ;
                suppPay2.KNDY4__Company__c = company.Id;
                suppPay2.KNDY4__Finalized__c = true;
                suppPay2.KNDY4__finalized_date__c = system.now();
                suppPay2.KNDY4__Supplier__c = supplier.Id;
                suppPay2.KNDY4__Currency__c = TestFuel.currencyUSD.id;
                //KNDY-17923 - deperecated 'KNDY4__Check_Number__c'
                //suppPay2.KNDY4__Check_Number__c = 8987;
                suppPay2.KNDY4__Reference__c = '8987';
                suppPay2.KNDY4__historical__c = false;
                supplierPayments.add(suppPay2);

                insert supplierPayments;
            }
            return supplierPayments;
        }
        set;
    }
    public list<KNDY4__Accounting_Entry__c> SPAccountingEntries{
        get{
            if(SPAccountingEntries == null){
                SPAccountingEntries = new list<KNDY4__Accounting_Entry__c>();
                KNDY4__Accounting_Entry__c accountingEntry = new KNDY4__Accounting_Entry__c();
                accountingEntry.KNDY4__Company__c = company.Id;
                accountingEntry.KNDY4__Supplier_Payment__c = supplierPayments[0].Id;
                accountingEntry.name = 'One';
                accountingEntry.KNDY4__Status__c = 'Active';
                accountingEntry.KNDY4__Transaction_Type__c = 'Std';
                SPAccountingEntries.add(accountingEntry);

                KNDY4__Accounting_Entry__c accountingEntry1 = new KNDY4__Accounting_Entry__c();
                accountingEntry1.KNDY4__Company__c = company.Id;
                accountingEntry1.KNDY4__Supplier_Payment__c = supplierPayments[1].Id;
                accountingEntry1.name = 'Two';
                accountingEntry1.KNDY4__Status__c = 'Active';
                accountingEntry1.KNDY4__Transaction_Type__c = 'Std';
                SPAccountingEntries.add(accountingEntry1);

                insert SPAccountingEntries;
            }
            return SPAccountingEntries;
        }
        set;
    }

    public KNDY4__Invoice__c intercompanyInvestmentInvoice{
        get{
            if(intercompanyInvestmentInvoice == null){

                intercompanyInvestmentInvoice = new KNDY4__Invoice__c();
                intercompanyInvestmentInvoice.KNDY4__From_Company__c = altCompany.Id;
                intercompanyInvestmentInvoice.KNDY4__To_Company__c = company.Id;
                intercompanyInvestmentInvoice.KNDY4__Currency__c = TestFuel.currencyUSD.id;
                intercompanyInvestmentInvoice.KNDY4__Transaction_Date__c = system.now();
                intercompanyInvestmentInvoice.KNDY4__Type__c = 'Intercompany Investment';
                intercompanyInvestmentInvoice.KNDY4__Transaction_Type__c = 'Intercompany Investment';

                DML.insertAsSystem(intercompanyInvestmentInvoice);
                //Insert ;

                KNDY4__Invoice_Line__c invLine = new KNDY4__Invoice_Line__c();
                invLine.KNDY4__Invoice__c = intercompanyInvestmentInvoice.Id;
                invLine.KNDY4__Extended_Amount__c = 10000;

                DML.insertAsSystem(invLine);
               // Insert ;

            }
            return intercompanyInvestmentInvoice;
        }
        set;
    }

    public KNDY4__Payment__c intercompanyPayment{
        get{
            if(intercompanyPayment == null){

                intercompanyPayment = new KNDY4__Payment__c();
                intercompanyPayment.KNDY4__From_Company__c = company.Id;
                intercompanyPayment.KNDY4__To_Company__c = altCompany.Id;
                intercompanyPayment.KNDY4__Currency__c = TestFuel.currencyUSD.id;
                intercompanyPayment.KNDY4__Transaction_Date__c = system.now();
                intercompanyPayment.KNDY4__Type__c = 'Intercompany Payment';
                intercompanyPayment.KNDY4__Transaction_Type__c = 'Intercompany Payment';
                DML.insertAsSystem(intercompanyPayment);
                //Insert ;

                KNDY4__Payment_Line__c pml = new KNDY4__Payment_Line__c();
                pml.KNDY4__Payment__c = intercompanyPayment.Id;
                pml.KNDY4__Amount__c = 10000;
                pml.KNDY4__Type__c = 'Intercompany Payment';
                DML.insertAsSystem(pml);
                //Insert ;

                KNDY4__Payment_Match__c pm = new KNDY4__Payment_Match__c();
                pm.KNDY4__Type__c = pml.KNDY4__Type__c;
                pm.KNDY4__Amount__c = pml.KNDY4__Amount__c;
                pm.KNDY4__Invoice__c = intercompanyInvestmentInvoice.Id;
                pm.KNDY4__Payment_Line__c = pml.Id;
                Insert pm;
                //DML.insertAsSystem();

            }
            return intercompanyPayment;
        }
        set;
    }

    public KNDY4__Payment__c intercompanyPayment1{
        get{
            if(intercompanyPayment1 == null){

                intercompanyPayment1 = new KNDY4__Payment__c();
                intercompanyPayment1.KNDY4__From_Company__c = company.Id;
                intercompanyPayment1.KNDY4__To_Company__c = altCompany.Id;
                intercompanyPayment1.KNDY4__Currency__c = TestFuel.currencyUSD.id;
                intercompanyPayment1.KNDY4__Transaction_Date__c = system.now();
                intercompanyPayment1.KNDY4__Type__c = 'Intercompany Payment';
                intercompanyPayment1.KNDY4__Transaction_Type__c = 'Intercompany Payment';
                //insert ;
                DML.insertAsSystem(intercompanyPayment1);

                KNDY4__Payment_Line__c pml = new KNDY4__Payment_Line__c();
                pml.KNDY4__Payment__c = intercompanyPayment1.Id;
                pml.KNDY4__Amount__c = 10000;
                pml.KNDY4__Type__c = 'Intercompany Payment';
                DML.insertAsSystem(pml);
                //insert pml;

                KNDY4__Payment_Match__c pm = new KNDY4__Payment_Match__c();
                pm.KNDY4__Type__c = pml.KNDY4__Type__c;
                pm.KNDY4__Amount__c = pml.KNDY4__Amount__c;
                pm.KNDY4__Invoice__c = intercompanyInvestmentInvoice.Id;
                pm.KNDY4__Payment_Line__c = pml.Id;
                DML.insertAsSystem(pm);
               //insert pm;

            }
            return intercompanyPayment1;
        }
        set;
    }

    public Map<String,KNDY4__Reason_Code__c> reasonCodes {
        get {
            if (reasonCodes == null) {
                reasonCodes = new Map<String,KNDY4__Reason_Code__c>();
                reasonCodes.put('Change',new KNDY4__Reason_Code__c(Name = 'Change', KNDY4__Type__c = 'Inventory Change'));
                reasonCodes.put('Transfer',new KNDY4__Reason_Code__c(Name = 'Transfer', KNDY4__Type__c = 'Inventory Transfer'));
                reasonCodes.put('Cycle',new KNDY4__Reason_Code__c(Name = 'Cycle', KNDY4__Type__c = 'Cycle Count'));
                insert reasonCodes.values();
            }
            return reasonCodes;
        } set;
    }

    public list<KNDY4__Accounting_Entry__c> InterCompanyAccountingEntries{
        get{
            if(InterCompanyAccountingEntries == null){
                InterCompanyAccountingEntries = new list<KNDY4__Accounting_Entry__c>();
                KNDY4__Accounting_Entry__c accountingEntry = new KNDY4__Accounting_Entry__c();
                accountingEntry.KNDY4__Company__c = company.Id;
                accountingEntry.KNDY4__Payment__c = intercompanyPayment.Id;
                accountingEntry.name = 'One';
                accountingEntry.KNDY4__Status__c = 'Active';
                accountingEntry.KNDY4__Transaction_Type__c = 'Std';
                InterCompanyAccountingEntries.add(accountingEntry);
                insert InterCompanyAccountingEntries;
            }
            return InterCompanyAccountingEntries;
        }
        set;
    }

    public list<KNDY4__Customer_Receipt__c> RefundCustomerReceipt{
        get{
            if(RefundCustomerReceipt == null){
                RefundCustomerReceipt = new list<KNDY4__Customer_Receipt__c>();
                KNDY4__Customer_Receipt__c custReceipt = new KNDY4__Customer_Receipt__c();
                custReceipt.KNDY4__Customer__c = customerBillTo.Id;
                custReceipt.KNDY4__Company__c = company.Id;

                custReceipt.KNDY4__Currency__c = company.KNDY4__Default_Transaction_Currency__c;
                custReceipt.KNDY4__Bank_Account_2__c = bankAccount.Id;

                custReceipt.KNDY4__Amount_Received__c = -1 * 200;
                custReceipt.KNDY4__Type__c = 'Refund';
                custReceipt.KNDY4__Transaction_Date__c = system.now();
                custReceipt.KNDY4__Date_Received__c = system.now();
                //custReceipt.KNDY4__Payment_Method_G__c = 'Check';
                RefundCustomerReceipt.add(custReceipt);
                insert RefundCustomerReceipt;
            }
            return RefundCustomerReceipt;
        }
        set;
    }


    public list<KNDY4__Accounting_Entry__c> RefundCRAccountingEntries{
        get{
            if(RefundCRAccountingEntries == null){
                RefundCRAccountingEntries = new list<KNDY4__Accounting_Entry__c>();
                KNDY4__Accounting_Entry__c accountingEntry = new KNDY4__Accounting_Entry__c();
                accountingEntry.KNDY4__Company__c = company.Id;
                accountingEntry.KNDY4__Customer_Receipt__c = RefundCustomerReceipt[0].Id;
                accountingEntry.name = 'One';
                accountingEntry.KNDY4__Status__c = 'Active';
                accountingEntry.KNDY4__Transaction_Type__c = 'Std';
                RefundCRAccountingEntries.add(accountingEntry);
                insert RefundCRAccountingEntries;
            }
            return RefundCRAccountingEntries;
        }
        set;
    }
    public KNDY4__Product__c packageProduct {
        get {
            if (packageProduct == null) {
                packageProduct = new KNDY4__Product__c(
                        KNDY4__Company__c = company.Id,
                        Name = 'Package Product',
                        KNDY4__Item__c = itemList[14].Id,
                        KNDY4__Description__c = 'Package Product',
                        KNDY4__Selling_UOM__c = uomList[11].Id
                );
                insert packageProduct;
            }
            return packageProduct;
        } set;
    }

    public KNDY4__Sales_Order__c packageSalesOrder {
        get {
            if (packageSalesOrder == null) {
                packageSalesOrder = newSalesOrder();
                packageSalesOrder.KNDY4__Bill_To__c = customerBillTo.Id;
                packageSalesOrder.KNDY4__Original_Sales_Order__c = 'packageSalesOrder';
                insert packageSalesOrder;

                System.assert(packageSalesOrderLine != null);
            }
            return packageSalesOrder;
        } set;
    }

    public KNDY4__Sales_Order_Line__c packageSalesOrderLine {
        get {
            if (packageSalesOrderLine == null) {
                packageSalesOrderLine = new KNDY4__Sales_Order_Line__c(
                        KNDY4__Company__c = company.Id,
                        KNDY4__Description__c = product.KNDY4__Description__c,
                        KNDY4__Discount_Percent__c = 0,
                        KNDY4__Product__c = packageProduct.Id,
                        KNDY4__Quantity_Ordered__c = 10,
                        KNDY4__Required_Date__c = System.today() + 5,
                        KNDY4__Sales_Order__c = packageSalesOrder.Id,
                        KNDY4__Ship_From_Location__c = location2.Id,
                        KNDY4__Unit_Price__c = 0,
                        KNDY4__Memo__c = 'packageSalesOrderLine',
                        KNDY4__Selling_UOM__c = uomList[11].Id
                );
                insert packageSalesOrderLine;
            }
            return packageSalesOrderLine;
        } set;
    }

    /***********Used in Customer Receipt/AR *************/
    public static final string TYPE_OVERPAYMENT = 'Overpayment';
    public static final string TYPE_OVERPAYMENT_CREDIT = 'Overpayment Applied';
    public static final string TYPE_CREDIT_MEMO = 'Credit Applied';
    public static final string TYPE_DEBIT_MEMO = 'Debit Applied';

    public static final string TYPE_ALLOWANCE_ACCRUAL_APPLIED = 'Allowance Accrual Applied';
    public static final string TYPE_CREDIT_CLAIM = 'Credit Applied - Claim';
    public static final string TYPE_DEBIT_CLAIM = 'Debit Applied - Claim';
    public static final string TYPE_CLAIM_PAYMENT = 'Claim Payment';
    public static final string TYPE_PREPAYMENT_CREDIT = 'Prepayment Applied';
    public static final string TYPE_REFUND_APPLIED_PREPAYMENT = 'Refund applied prepayment';
    public static final string TYPE_REFUND_APPLIED_PAYMENT = 'Refund applied payment';
    public static final string TYPE_DEDUCTION = 'Deduction';
    public static final string TYPE_INVOICE_DEDUCTION = 'Invoice Deduction';
    public static final string TYPE_GEN_DED = 'General Deduction';
    public static final string TYPE_UNEARNED_DISCOUNT = 'Unearned Terms Discount';
    public static final string TYPE_WRITEOFF = 'Writeoff';
    public static final string TYPE_WRITEOFF_CREDIT = 'Writeoff Credit'; //KNDY-19379

    /***************Used in refund credit *************/
    public static final string TYPE_REFUND_UNAPPLIED_PREPAYMENT = 'Refund unapplied prepayment';
    public static final string TYPE_REFUND_UNAPPLIED_OVERPREPAYMENT = 'Refund Unapplied Overpayment';
    public static final string TYPE_REFUND_CREDIT = 'Refund Credit';
    public static final string TYPE_REFUND_ALLOWANCE_ACCRUAL = 'Refund Allowance Accrual'; //KNDY-15033

    /***************Used in Supplier Payment/Supplier Invoice/AP *************/
    public static final string STATUS_CANCELLED = 'Cancelled';
    public static final string STATUS_VOID = 'Void';
    public static final string STATUS_APPROVED = 'Approved';
    public static final string STATUS_CLOSED = 'Closed';
    public static final string STATUS_APPLIED = 'Applied';
    public static final string STATUS_REASON_VOID_FROM_OVERFLOW_ADVICE = 'Void from Overflow Advice';
    public static final string STATUS_REASON_ZERO_AMT_PAYMENT_NOT_ALLOWED = 'Zero Amount Payment Creation Not Allowed';

    public static final string PAYMENT_METHOD_CHECK = 'Check';
    public static final string TYPE_CREDITMEMO = 'Credit Memo';
    public static final string TYPE_INVOICE = 'Invoice';
    /***************Used common AP/AR *************/
    public static final string TYPE_PAYMENT = 'Payment';
    public static final string TYPE_PREPAYMENT = 'Prepayment';

    public static final string TYPE_EARNED_DISCOUNT = 'Earned Terms Discount';
    public static final               string TYPE_BACKFLUSH = 'Backflush';


    public static final string TYPE_DEPRECIATION = 'Depreciation';
    public static final string TYPE_CIP = 'Capitalize';
    public static final string TYPE_RESIDUAL = 'Residual';
    public static final string TYPE_RETIRE = 'Retire';
    public static final string ASSET_TO_INVENTORY = 'Asset to Inventory';

    public static final string STATUS_INACTIVE = 'Inactive';
    public static final string STATUS_CIP = 'CIP';
    public static final string STATUS_ACTIVE = 'Active';
    public static final string STATUS_DEPRECIATED = 'Depreciated';
    public static final string STATUS_RETIRED = 'Retired';

    public static final string ASSET_ACCOUNTING = 'Accounting';
    public static final string ASSET_TAX = 'Tax';

    //Static boolean used for transaction control in creating new accounting fixed assets with tax books
    public static boolean isNewAsset = true;
    public static boolean isAcqCostCalculated = FALSE;

    //This map is used for providing Type definitions
    public static Map<string, string> interfaceProcessorMap = new Map<string, string>{ 'Straight Line' 		=> 'AccountingStraightLineDepreciation',
    'Declining Balance' => 'AccountingDecliningBalanceDepreciation',
    'Sum of Years' 		=> 'AccountingSumOfYearsDepreciation',
    'MACRS' 			=> 'AccountingMACRSDepreciation'};


}