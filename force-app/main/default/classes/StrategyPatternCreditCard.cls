public with sharing class StrategyPatternCreditCard implements StrategyPattern{
    public Boolean submitPayment(){
        System.debug('Credit calling');
        return true;
    }
}