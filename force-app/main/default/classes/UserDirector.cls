public with sharing class UserDirector {
    ///// The point of the Director class is just to build the Object 
    
    IUserBuilder userBuilder;

    public User build(IUserBuilder userBuilder){
        this.userBuilder = userBuilder;
        userBuilder.setFirstName();
        userBuilder.setLastName();
        userBuilder.setEmail();
        userBuilder.setProfile();
        userBuilder.setEmailEncodingKey();
        userBuilder.setAlias();
        userBuilder.setLanguageKey();
        userBuilder.setLocalSIDKey();
        userBuilder.setTimeZone();
        userBuilder.setPermissionSet();
        userBuilder.setUserName();


        return userBuilder.getUser();
    }


    ////called in the test class
    //User user = new UserDirector().build(new UserBuilder.Admin());
    /////System.debug(user);
}