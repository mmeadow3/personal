public with sharing class StrategyPatternPremium implements StrategyPattern {
  public Decimal calculateDiscount(Decimal totalAmount) {
    System.debug('This is from the Premium');
    return 777.00;
  }

  public Boolean submitPayment() {
    System.debug('Credit calling');
    return true;
  }
}
