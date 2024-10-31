public with sharing class UserBuilder {
    ///// exmaple of an inner class using an Interface 
    //// and this builder pattern implements an Interface

    /// in the UML diagram - the inner classes are the ConcreteBuilders, the outer Class - UserBuild is the Builder Class
    public with sharing class Admin implements IUserBuilder {
        User user;

        public Admin(){
            this.user = new User();
        }

        public void setFirstName(){
            user.FirstName = 'Admin';
        }
        public void setLastName(){
            user.LastName = 'Test';
        }
        public void setEmail(){
            user.Email = 'test@test.com';
        }
        public void setProfile(){
            Profile p = [SELECT Id From Profile WHERE Name = 'System Administrator' WITH SECURITY_ENFORCED];
            user.ProfileId = p.Id;
        }
        public void setEmailEncodingKey(){
            user.EmailEncodingKey = 'UTF-8';
        }
   
        public void setAlias(){
            user.Alias = 'testBoy';
        }
        public void setLanguageKey(){
            user.LanguageLocaleKey = 'en_US';
        }
        public void setLocalSIDKey(){
            user.LocaleSidKey = 'en_US';
        }
        public void setTimeZone(){
            user.TimeZoneSidKey = 'America/Los_Angeles';
        }
        public void setPermissionSet(){
            System.debug('this does nothing in our example');
        }
        public void setUserName(){
            user.Username = 'testUser@' + Math.random() + '.com';
        }

        public User getUser(){
           return this.user;
        }
    }
    //////// Now we can make another Builder Class that implements the IUserBuilder Interface
    ///////// This Builder will be responsible for building a Standard User

    public with sharing class Standard implements IUserBuilder {
        public User user {get; private set;}

        public Standard(){
            this.user = new User();
        }

        public void setFirstName(){
            user.FirstName = 'Ole Standard';
        }
        public void setLastName(){
            user.LastName = 'Test';
        }
        public void setEmail(){
            user.Email = 'test@test.com';
        }
        public void setProfile(){
            Profile p = [SELECT Id From Profile WHERE Name = 'Standard User' WITH SECURITY_ENFORCED];
            user.ProfileId = p.Id;
        }
        public void setEmailEncodingKey(){
            user.EmailEncodingKey = 'UTF-8';
        }
   
        public void setAlias(){
            user.Alias = 'standardTestBoy';
        }
        public void setLanguageKey(){
            user.LanguageLocaleKey = 'en_US';
        }
        public void setLocalSIDKey(){
            user.LocaleSidKey = 'en_US';
        }
        public void setTimeZone(){
            user.TimeZoneSidKey = 'America/Los_Angeles';
        }
        public void setPermissionSet(){
            System.debug('this does nothing in our example');
        }
        public void setUserName(){
            user.Username = 'testUser@' + Math.random() + '.com';
        }

        public User getUser(){
           return this.user;
        }
    }
}