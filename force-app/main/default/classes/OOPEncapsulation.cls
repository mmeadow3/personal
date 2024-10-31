public class OOPEncapsulation {
        // Private variables
        /// These are the encapsulated values
        private Decimal balance;
        private String accountNumber;
    
        // Constructor to initialize variables
        public OOPEncapsulation(String accNum, Decimal initialBalance) {
            this.accountNumber = accNum;
            this.balance = initialBalance;
            System.debug('initial balance : ' + this.balance);
        }
    
        ///// made this private and we can still call it 
        private Integer deposit(Decimal amount) {
            system.debug('Account number: ' +  this.accountNumber + ' has this much of a balance ' +  Integer.valueOf(calculateSomething() + calculateSomethingElse() + amount));
            return Integer.valueOf(calculateSomething() + calculateSomethingElse() + amount);
        }

        @AuraEnabled(cacheable=true)
        public static Integer callApexLWC(){
            OOPEncapsulation oop = new OOPEncapsulation('123456', 10);
            return oop.deposit(5);
        }

        ///can call this from hello.apex (CTRL + SHIFT  + P ) => SFDX: Execute Anonymous Apex 
        ///////////////////////////////////////////////////
        // OOPEncapsulation oop = new OOPEncapsulation('50', 10.00);
        // oop.deposit(500);
        ///////////////////////////////////////////////////
        /////we can also have private methods that can also be called
        ///These private methods can be changed easily bc we know no other class is calling them
        ////reduced dependecis on these methods
        private Decimal calculateSomething(){
            return this.balance + 5;
        }
    
        private Decimal calculateSomethingElse(){
            System.debug(this.balance);
            return this.balance + 10;
        }
        // Method to withdraw money
        public void withdraw(Decimal amount) {
            if (amount <= balance) {
                balance -= amount;
            } else {
                System.debug('Insufficient funds');
            }
        }
    
        // Method to get account balance
        public Decimal getBalance() {
            return balance;
        }
    
        // Method to set account number (for demonstration purposes)
        public void setAccountNumber(String accNum) {
            accountNumber = accNum;
        }
    
        // Method to get account number (for demonstration purposes)
        public String getAccountNumber() {
            return accountNumber;
        }
}