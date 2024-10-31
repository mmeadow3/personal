public interface ISubject {
  void subscribe(Product_Notification__c observer);
  void unsubscribe(Product_Notification__c observer);
  void notifyObserver();
}