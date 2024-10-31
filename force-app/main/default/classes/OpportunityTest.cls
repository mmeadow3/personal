@isTest
public class OpportunityTest {
    @IsTest
    static void testUpdateMutlipleOpps() {
        Account[] accts = TestDataFactory.createAccountsWithOpps(1,200);
        
        Test.startTest();
            System.debug([Select count() from Opportunity]);
        Test.stopTest();
        System.assertEquals([Select count() from Opportunity], 200, 'We should see 200 Opportunities');
        System.assertEquals([Select count() from Account], 1, 'We should see 1 Account');
    }

    @IsTest
    static void testDMLvsReturn() {
        Account acc = TestDataFactory.createAccount('Test Acct', false);
        Test.startTest();
            System.debug('Testing the DML insert vs return: ' + acc.Name); //// No insert but this is still available in memory
        Test.stopTest();
        System.assertEquals(0, [Select COUNT() From Account], 'Since the record is not inserted there will not be one');
    }

    @IsTest
    static void testDMLvsReturnNonVoid() {
        Account acc = TestDataFactory.createAccount('Test Acct', true);
        Test.startTest();
            System.debug('Testing the DML insert vs return: ' + acc.Id);
        Test.stopTest();
        System.assertEquals('Test Acct', acc.Name , 'We do not have to query like below');
    }

    @isTest
    static void testDMLvsReturnVoid() {
        TestDataFactory.createAccountVoid('Test Acct');
        Account acc = [Select Name from Account];   //// only way we can get the info from a void test method
        Test.startTest();
            System.debug('Cant Select acc.Name here without querying'); 
        Test.stopTest();
        System.assertEquals('Test Acct', [Select Name From Account].Name, 'Have to query');
    }
}