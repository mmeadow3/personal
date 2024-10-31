public with sharing class StrategyPatternContext {

    ///// The interface
    private StrategyPattern strategy;

    // Constructor to set the strategy
    public StrategyPatternContext(StrategyPattern strategy) {
        this.strategy = strategy;
    }

    public Decimal executeStrategy(Decimal totalAmount) {
        return strategy.calculateDiscount(totalAmount);
    }
}
