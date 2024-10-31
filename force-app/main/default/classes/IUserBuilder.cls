public interface IUserBuilder {
    void setFirstName();
    void setLastName();
    void setEmail();
    void setProfile();
    void setEmailEncodingKey();
    void setAlias();
    void setLanguageKey();
    void setLocalSIDKey();
    void setTimeZone();
    void setPermissionSet();
    void setUserName();
    User getUser();
}