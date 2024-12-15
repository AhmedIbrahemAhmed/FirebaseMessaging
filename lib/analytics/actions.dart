import 'package:firebase_analytics/firebase_analytics.dart';

class UserActions {
  final FirebaseAnalytics analytics =FirebaseAnalytics.instance;

  void logFirstTimeLogin(String userId) {
    analytics.logEvent(
      name: 'first_time_login',
      parameters: <String, Object>{'user_id': userId},
    );
  }
  void logUserSubscription(String userId, String channelName) {
    analytics.logEvent(
      name: 'user_subscription',
      parameters: <String, Object>{
        'user_id': userId, // Add the user ID
        'channel': channelName,
        'status': 'subscribed',
      },
    );
  }

  /// Log user unsubscription event with user ID
  void logUserUnsubscription(String userId, String channelName) {
    analytics.logEvent(
      name: 'user_unsubscription',
      parameters: <String, Object>{
        'user_id': userId, // Add the user ID
        'channel': channelName,
        'status': 'unsubscribed',
      },
    );
  }
}
