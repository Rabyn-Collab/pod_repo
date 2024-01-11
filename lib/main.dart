import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:podsriver/firebase_options.dart';
import 'package:podsriver/provider/other_provider.dart';
import 'package:podsriver/views/status_page.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  await Firebase.initializeApp();


}


const AndroidNotificationChannel channel = AndroidNotificationChannel(
  "high_importance_channel",
  "high_importance_channel",
  importance: Importance.high,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

const InitializationSettings initializationSettings =
InitializationSettings(
  android: AndroidInitializationSettings("@mipmap/ic_launcher"),
);

void main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  await Future.delayed(Duration(milliseconds: 500));
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );

  runApp(ProviderScope(child: Home()));
}


class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final mode = ref.watch(toggleThemeProvider);
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: mode ? ThemeData.dark(
          useMaterial3: true,
        ): ThemeData.light(useMaterial3: true),
          home: StatusPage(),
    );
  }
}


class Counter extends StatelessWidget {

  final numControl = StreamController<int>();
  int n = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stream'),),
        body: StreamBuilder(
          stream: numControl.stream,
          builder: (context, snapshot) {
            print(snapshot.data);
            return Center(child: Text('${snapshot.data}', style: TextStyle(fontSize: 50),));
          }
        ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            numControl.sink.add(n++);
      }, child: Icon(Icons.add)),
    );
  }
}


