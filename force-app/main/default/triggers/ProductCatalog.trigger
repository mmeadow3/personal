trigger ProductCatalog on Product_Catalog__c (before insert, before update, before delete,
        after insert, after update, after delete, after undelete) {

    ProductCatalogTriggerHandler handler = new ProductCatalogTriggerHandler();
    handler.run();

}