public class RealDataLayer implements IDataLayer {
    //The real data layer implements this interface and performs actual SOQL queries and DML operations. This would be used in production.
    ///// as opposed to MockDataLayer.cls which does not insert real data

    public List<Account> getAccounts() {
        return [SELECT Id, Name FROM Account LIMIT 100];
    }

    public List<Contact> getContacts() {
        return [SELECT Id, FirstName, LastName FROM Contact LIMIT 100];
    }

    public void insertRecords(List<SObject> records) {
        insert records;
    }
}
