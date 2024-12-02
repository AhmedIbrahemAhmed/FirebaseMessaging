import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class ChannelSubscriptionScreen extends StatefulWidget {
  @override
  _ChannelSubscriptionScreenState createState() => _ChannelSubscriptionScreenState();
}

class _ChannelSubscriptionScreenState extends State<ChannelSubscriptionScreen> {
  final List<String> channels = ['Sports', 'News', 'Technology', 'Health'];
  final Set<String> subscribedChannels = {}; // To keep track of subscriptions

  void toggleSubscription(String channel) {
    if (subscribedChannels.contains(channel)) {
      FirebaseMessaging.instance.unsubscribeFromTopic(channel);
      setState(() {
        subscribedChannels.remove(channel);
      });
      print('Unsubscribed from $channel');
    } else {
      FirebaseMessaging.instance.subscribeToTopic(channel);
      setState(() {
        subscribedChannels.add(channel);
      });
      print('Subscribed to $channel');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Subscribe to Channels')),
      body: ListView.builder(
        itemCount: channels.length,
        itemBuilder: (context, index) {
          final channel = channels[index];
          return ListTile(
            title: Text(channel),
            trailing: ElevatedButton(
              onPressed: () => toggleSubscription(channel),
              child: Text(
                subscribedChannels.contains(channel) ? 'Unsubscribe' : 'Subscribe',
              ),
            ),
          );
        },
      ),
    );
  }
}
