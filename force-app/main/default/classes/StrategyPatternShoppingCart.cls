public with sharing class StrategyPatternShoppingCart {
   
    
    public StrategyPattern paymentStrategy;

    public StrategyPatternShoppingCart(StrategyPattern payment){
        this.paymentStrategy = payment;
    }

    public Boolean submitPayment(){
        return this.paymentStrategy.submitPayment();
    }

}