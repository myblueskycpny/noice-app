import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:noice/favourite/models/favlist_model.dart';
import 'package:noice/favourite/screens/favorite_list.dart';
import 'package:noice/favourite/screens/favorite_page.dart';
import 'package:noice/kedua/history_koleksi.dart';
import 'package:noice/kedua/playlistStuff/functionList.dart';
import 'package:noice/launch.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

import 'favourite/models/favpage_model.dart';

const AndroidNotificationChannel settingNotify = AndroidNotificationChannel(
    // settings
    'high_importance_channel', // id
    'High Importance Notifications', //title
    description: "This channel is used for important notifications.",
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin functionNotifPlatform =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await functionNotifPlatform
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(settingNotify);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // TERMINATED
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        print(message.notification!.title);
        var _routeName = message.data['route'];
        Navigator.of(context).pushNamed(_routeName);
      }
    });
    // FOREGROUND
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        functionNotifPlatform.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                settingNotify.id,
                settingNotify.name,
                channelDescription: settingNotify.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
      if (message != null) {
        print(message.notification!.title);
        final _routeName = message.data['route'];
        Navigator.of(context).pushNamed(_routeName);
      }
    });
    // BACKGROUND
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text("${notification.title}"),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("${notification.body}")],
                  ),
                ),
              );
            });
        var _routeName = message.data['route'];
        Navigator.of(context).pushNamed(_routeName);
      }
    });

    FirebaseMessaging.instance.getToken().then((token) {
      print(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CRUD(),
        ),
        Provider(create: (context) => FavoriteListModel()),
        ChangeNotifierProxyProvider<FavoriteListModel, FavoritePageModel>(
          create: (context) => FavoritePageModel(),
          update: (context, favoritelist, favoritepage) {
            if (favoritepage == null)
              throw ArgumentError.notNull('favoritepage');
            favoritepage.favoritelist = favoritelist;
            return favoritepage;
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const launchPage(),
        routes: {
          '/history_koleksi': (_) => const HistoryKoleksi(),
          '/favoritelist': (context) => FavoriteList(),
          '/favoritepage': (context) => FavoritePage(),
        },
      ),
    );
  }
}
