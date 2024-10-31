public with sharing class OOPNotificationProcessor {
    // Method that accepts any OOPpolymorphism (from the OG parent class) and sends it
    public void processNotification(OOPpolymorphism notification, String message) {
        notification.sendNotification(message);  // Polymorphism in action, calling the parent abstract class
    }
}