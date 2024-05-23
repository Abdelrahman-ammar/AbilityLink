import 'package:ability_link1/bottomnavigation.dart';
import 'package:ability_link1/home_page.dart';
//import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:ability_link1/LetsStart.dart';
import 'package:ability_link1/User_select.dart';
import 'package:ability_link1/career_info.dart';
import 'package:ability_link1/clinic_info.dart';
import 'package:ability_link1/doctor_details.dart';
import 'package:ability_link1/doctor_reviews.dart';
import 'package:ability_link1/firebase_options.dart';
import 'package:ability_link1/school_details.dart';
import 'package:ability_link1/search.dart';
import 'package:ability_link1/search_for_doctors.dart';
import 'package:ability_link1/search_for_schools.dart';
import 'package:ability_link1/sign_up_care.dart';
import 'package:ability_link1/sign_up_doctor.dart';
import 'package:ability_link1/sign_up_volanteer.dart';
import 'package:ability_link1/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'SignIn.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AuthenticationWrapper(),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Return a loading indicator while checking authentication state
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          // If user is authenticated, navigate to the home page
          if (snapshot.hasData) {
            return Bottom_navy();
          } else {
            // If user is not authenticated, show the sign-in screen
            return SignIn();
          }
        }
      },
    );
  }
}
