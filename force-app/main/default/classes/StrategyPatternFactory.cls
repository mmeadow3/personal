public with sharing class StrategyPatternFactory {
   
    public static StrategyPattern getStrategy(string strategyName){
            switch on strategyName.toLowerCase(){
                when 'debit'{
                    return new StrategyPatternDebitCard();
                }
                when 'credit'{
                    return new StrategyPatternCreditCard();
                }
            }
        return null;
    }

}