public interface IDataLayer {
  /////this is hte data access layer, blueprint for adding in real or mock data access layers as needed
  List<Account> getAccounts();
  List<Contact> getContacts();
  void insertRecords(List<SObject> records);
}
