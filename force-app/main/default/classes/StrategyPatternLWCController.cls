public with sharing class StrategyPatternLWCController {
   
    @AuraEnabled
    public static Boolean submitPayment(String payentType){
        StrategyPatternShoppingCart cart = new StrategyPatternShoppingCart(StrategyPatternFactory.getStrategy(payentType));
        return cart.submitPayment();
    }
    //////Fire this bad boy:  StrategyPatternLWCController.submitPayment('debit');
}