public with sharing class Singleton_Impl {

        public static void execute() {
            // Retrieve the Singleton instance of SingletonPattern
            ////Cannot do SingletonPattern whatever = new SingletonPattern() // becasue the Constructor on that class is private
            //// we can test this by calling : SingletonPattern test = new SingletonPattern(); and getting an error - if we switch its constrcutor to public then it will work
            SingletonPattern configManager = SingletonPattern.getInstance(); ///// this would have used the "new" keyword if we didnt built it like this
            
            // Access configuration settings
            String apiUrl = configManager.getConfigSetting('API_URL');
            String timeout = configManager.getConfigSetting('TIMEOUT');
            
            System.debug('API URL from IMPL: ' + apiUrl);
            System.debug('Timeout API URL from IMPL: ' + timeout);
        }


        ///// This is the second Example, we would not call the Singleton Class twice IRL
        public static void sendEmail(){
            SingletonPattern emailSettings = SingletonPattern.getInstance();

            List<String> emailAddys = new List<String>{ 'mmeadow33@gmail.com' };

            ////using the new Instance of it 
            emailSettings.sendDatEmail('Standard Email Template', emailAddys);

            ////   we can also debug the properties from the Singleton Class
            System.debug('This is from the private set in the Singleton Class  : ' + emailSettings.emailTemplate);
        }
}