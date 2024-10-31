public class MockDataLayer implements IDataLayer {
    ////returns test data instead of querying or performing DML operations on actual Salesforce records.
    public List<Account> getAccounts() {
        return new List<Account>{
            new Account(Name = 'Mock Account 1'),
            new Account(Name = 'Mock Account 2')
        };
    }

    public List<Contact> getContacts() {
        return new List<Contact>{
            new Contact(FirstName = 'John', LastName = 'Doe'),
            new Contact(FirstName = 'Jane', LastName = 'Smith')
        };
    }

    public void insertRecords(List<SObject> records) {
        // Do nothing or just simulate an insert (if necessary for the test logic)
    }
}
