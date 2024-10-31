public with sharing class SingletonPattern {
    
        // Private static variable that holds the single instance of the class
        //The constructor is private so that no other class can instantiate the SingletonPattern directly.
        private static SingletonPattern instance {get; private set;}
        
        // Private constructor to prevent instantiation from other classes
        private SingletonPattern() {
            // Load configuration settings or perform other initializations
            System.debug('Loading configuration settings...');
        }
        
        // Public static method that returns the single instance of the class
        //////The instance is static, ensuring only one instance is created and shared across the current transaction.
        /////Lazy Initialization: The Singleton instance is only created when it is needed (i.e., the first time getInstance() is called).
        public static SingletonPattern getInstance() {
            // Create the instance if it doesn't already exist
            if (instance == null) {
                instance = new SingletonPattern();
            }
            ////// if it does already exist in this execution context just return the already running one
            return instance;
        }
        
/////////////////////////////// Above is the main logic, below is where we can set variables to be called /////////////////////////

        /// Example 1 
        // Example method to get configuration values
        public String getConfigSetting(String key) {
            // Simulate retrieving a configuration setting
            Map<String, String> config = new Map<String, String>{
                'API_URL' => 'https://api.example.com',
                'TIMEOUT' => '5000'
            };
            return config.containsKey(key) ? config.get(key) : 'Default';
        }

        //// Example 2: For an email service 
        public String emailTemplate {get; private set;}
        public List<String> recipients {get; private set;}

        public void sendDatEmail(String emailTemplate, List<String> recipients) {
            this.emailTemplate = emailTemplate;
            this.recipients = recipients;
        }
  
}