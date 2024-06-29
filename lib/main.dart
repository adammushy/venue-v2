import 'package:flutter/material.dart';
import 'package:venue/screens/dashboard.dart';
import 'package:venue/screens/weddings.dart';
import 'screens/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:venue/theme_notifier.dart';
// import 'package:venue/theme.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'widgets/styles.dart';
import 'widgets/therme_notifier.dart';

import 'screens/registration.dart';
import 'screens/login.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Venue',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      // home:TabNavigation() ,
      // home: RegistrationScreen(),
      // home: LoginScreen(),
      home: const SplashScreen(),
      // home:const WeddingVenues(),
    );
  }
}
