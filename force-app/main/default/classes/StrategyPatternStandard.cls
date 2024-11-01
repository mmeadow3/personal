public with sharing class StrategyPatternStandard implements StrategyPattern {
  public Decimal calculateDiscount(Decimal totalAmount) {
    System.debug('This is from the Standard');
    return 5.0;
  }

  public Boolean submitPayment() {
    System.debug('Credit calling');
    return true;
  }
}
