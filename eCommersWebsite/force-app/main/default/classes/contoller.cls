public with sharing class contoller {

        // add Price__c in new org and use Phone in family field
   @AuraEnabled(Cacheable = true)
    public static list<Product2> getProduct() {
        try {
            return [SELECT Id, Name,Price__c, ProductCode, Display_Image__c,  Description FROM Product2 WHERE Family='SmartPhone'];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(Cacheable = true)
    public static list<User> getlistOfUsers() {
        try {
            return [SELECT Username, ProfileId, Name, IsActive, CompanyName FROM User WHERE Name='Vibhuti rai'];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(Cacheable = true)
    public static String getUser() {
        try {
            String name;
             for(User u: [SELECT ProfileId,Name, IsActive, CompanyName FROM User WHERE Name='Vibhuti rai']){
	        name = u.Name;
            }
            return name;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }


     // add Phone in profamily field new org  
    @AuraEnabled(Cacheable = true)
    public static List<Product2> retriveProducts(String strProdName) {
        try{
        strProdName = '%' + strProdName + '%';
        System.debug('strProdName value is : ' +strProdName);
        List<Product2> lstProd = [SELECT Id, Name, ProductCode, Display_Image__c, Price__c,  Description FROM Product2 WHERE Name LIKE :strProdName AND Family='SmartPhone'];
        System.debug('return  value is : ' +lstProd);
        return lstProd;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(Cacheable = true)
    public static List<Product2> sortHightoLowPrice() {
        try{
        List<Product2> ascProd = [SELECT Id, Name, ProductCode, Display_Image__c, Price__c, Description FROM Product2 WHERE Family='SmartPhone' ORDER BY Price__c ASC];
        return ascProd;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(Cacheable = true)
    public static List<Product2> sortLowToHighPrice() {
        try {
        List<Product2> descPro = [SELECT Id, Name, ProductCode, Display_Image__c, Price__c, Description FROM Product2 WHERE Family='SmartPhone' ORDER BY Price__c DESC];
        return descPro;
        }
        catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    /*@AuraEnabled(Cacheable = true)
    public static void checkOpportunity(List<Product2> pro){
        try {
           List<OpportunityLineItem> opItem = new  List<OpportunityLineItem>();
           List<OpportunityLineItem> pLI = new List<OpportunityLineItem>
           List<Opportunity> op = [SELECT Id, Name, StageName FROM Opportunity];
           for(Opportunity opp : op){
                if(opp.StageName != 'Closed Won'){
                    for(Product2 p : pro){
                        opItem.Product2Id = p.Id;	
                        opItem.ProductCode = p.ProductCode;
                        opItem.Name = p.Name;  
                        pLI.add(opItem); 
                        
            }
           }
        }
        if(op == null){
            Opportunity opp = new Opportunity();
            opp.CloseDate=date.today().addMonths(2);
            opp.Name='Productopp';
            opp.StageName='Closed Won';
            insert opp;
            for(Product2 p : pro){
                opItem.Product2Id = p.Id;	
                opItem.ProductCode = p.ProductCode;
                opItem.Name = p.Name;   
                pLI.add(opItem);
            }
            }
        }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }*/

    @AuraEnabled(Cacheable = true)
    public static List<Opportunity> getOpportunity(String opId) {
        try {
            
        List<Opportunity> getopp = [SELECT Id, Name,Amount,CloseDate, (SELECT Id, Name, PricebookEntry.Product2Id, TotalPrice, UnitPrice, ListPrice from OpportunityLineItems) from Opportunity WHERE Id =:opId];
        return getopp;
        }
        catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }


    @AuraEnabled(Cacheable = true)
    public static void getOpportunityForOrderItem() {
        try {
        List<OrderItem> orderItem = new List<OrderItem>();
        List<Opportunity> getop = [SELECT TotalOpportunityQuantity,Id, Name,Amount,CloseDate from Opportunity ];
        for(Opportunity getp : getop){
          //  orderItem.TotalPrice = getp.Amount;
            // orderItem.Quantity = getp.TotalOpportunityQuantity;
        }
        }
        catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
