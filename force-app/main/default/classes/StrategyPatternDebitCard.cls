public with sharing class StrategyPatternDebitCard implements StrategyPattern{
    public Boolean submitPayment(){
        System.debug('debit calling');
        return true;
    }
}