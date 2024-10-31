@IsTest
private class AccountService_Test {
    @IsTest
    static void testGetAllAccounts() {
        // Use the MockDataLayer instead of the RealDataLayer
        ///instantiate the service class with the mock data layer. 
        /////This allows your tests to run faster because they avoid actual DML operations.
        IDataLayer mockDataLayer = new MockDataLayer();
        AccountService service = new AccountService(mockDataLayer);

        Test.startTest();
            List<Account> accounts = service.getAllAccounts();
        Test.stopTest();

        // Assertions to verify the mock data
        System.assertEquals(2, accounts.size(), 'Sizes Dont Match');
        System.debug(accounts);
        System.assertEquals('Mock Account 1', accounts[0].Name, 'Names Dont Match');
    }
}
