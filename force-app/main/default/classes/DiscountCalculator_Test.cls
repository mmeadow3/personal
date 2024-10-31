@IsTest
private class DiscountCalculator_Test {
    
    @IsTest
    static void testGoldDiscount() {
        
        Account goldDiscount = new Account(Name = 'Test Acct', Customer_Tier__c = 'Gold');
        insert goldDiscount;

        Opportunity opportunity = new Opportunity(Name = 'Test Opportunity', CloseDate = Date.today(), StageName = 'Closed Won', AccountId = goldDiscount.Id, Amount = 1000.00);
        List<Opportunity> opportunityList = new List<Opportunity> { opportunity }; //// can do this because Opportunity has a built in constrcutor, so we dont have to do list.add

        Formula.recalculateFormulas(opportunityList);
        
        DiscountCalculator calculator = new DiscountCalculator(opportunity);


        Test.startTest();
            Decimal result = calculator.discountOpportunity();
        Test.stopTest();

        System.assertEquals(900.00, result, 'Should be the discount of 10%');
    }
}