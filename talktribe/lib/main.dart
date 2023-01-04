import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:talktribe/pages/createprofile_page.dart';
import 'package:talktribe/pages/group_page.dart';
import 'package:talktribe/pages/newuser_page.dart';
import 'package:talktribe/pages/write_page.dart';
import 'pages/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import './firebase_options.dart';
import 'pages/welcome_page.dart';
import 'pages/profile_page.dart';
import 'pages/users_page.dart';
import 'package:http/http.dart' as http;
import 'package:talktribe/database/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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
      home: getLandingPage(),
    );
  }

  Widget getLandingPage() {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData && (!snapshot.data!.isAnonymous)) {
          return WelcomePage();
        }

        return WelcomePage();
      },
    );
  }
}
