@isTest
public class TestDataFactory {
	public static Account createAccount(String name, Boolean doInsert) {
		Account acc = new Account(name = name);
        ///// sometimes we want this to be a DML statement 
		if(doInsert) {
			insert acc;
		}
		return acc;
	}


    //// Void method will work but then we have to query the record when we call this method
    //// so not the easier way to use it
    public static void createAccountVoid(String name) {
		Account acc = new Account(name = name);
        insert acc;
	}
	
	public static Contact createContact(Boolean doInsert) {
		Account acc = createAccount('test', true);
		return createContact(acc.id, true);
	}
	
	public static Contact createContact(Id accountId, Boolean doInsert) {
		Contact c = new Contact(firstName = 'Apex', lastName = 'Hours', accountId = accountId);
		if(doInsert) {
			insert c;
		}
		return c;
	}

	public static List<Opportunity> createOpportunity(Id accountId, Integer numOpps) {
		List<Opportunity> opps = new List<Opportunity>();
		for(Integer i = 1; i <= numOpps; i++) {
			Opportunity opp = new Opportunity();
			opp.name = 'Account ' + i;
			opp.accountId = accountid;
			opp.amount = 1000;
			opp.closeDate = Date.today().addDays(5);
			opp.stageName = 'Prospecting';
			opps.add(opp);
		}
		return opps;
	}

    public static List<Account> createAccountsWithOpps(Integer numAccts, Integer numOppsPerAcct) {
        List<Account> accts = new List<Account>();
        for(Integer i=0;i<numAccts;i++) {
          Account a = new Account(Name='TestAccount' + i);
          accts.add(a);
        }
        insert accts;
        List<Opportunity> opps = new List<Opportunity>();
        for(Integer j=0;j<numAccts;j++) {
          Account acct = accts[j];
          // For each account just inserted, add opportunities
          for(Integer k=0;k<numOppsPerAcct;k++) {
            opps.add(new Opportunity(Name=acct.Name + ' Opportunity ' + k,
              StageName='Prospecting',
              CloseDate=System.today().addMonths(1),
              AccountId=acct.Id));
          }
        }
        // Insert all opportunities for all accounts.
        insert opps;
        return accts;
      }
}