public class NotificationController {
    @AuraEnabled
    public static String getSessionId() {
        return UserInfo.getSessionId();
    }
}