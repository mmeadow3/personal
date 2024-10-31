public class AccountService {
    //By injecting the data layer dependency, you can control whether your service class uses the real or mock data layer. 
    //This approach is especially beneficial in test contexts, where you can inject the mock data layer.
    private IDataLayer dataLayer;

    public AccountService(IDataLayer dataLayer) {
        this.dataLayer = dataLayer;
    }

    public List<Account> getAllAccounts() {
        return dataLayer.getAccounts();
    }

    public void createRecords(List<SObject> records) {
        dataLayer.insertRecords(records);
    }
}

