import 'package:flutter/material.dart';
import 'package:material_campus/signup.dart';
import 'package:material_campus/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'aboutus.dart';
import 'contactus.dart';
import 'firebase_options.dart';


import 'home.dart';
import 'signup.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
      title: 'Material Campus',
      theme: ThemeData(















        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    initialRoute: '/',
    routes: {
      '/': (context) => SplashScreen(),
      '/signup': (context) => Signup(),
      '/login': (context) => Login(),
      '/home': (context) => Home(),
      '/about': (context) => AboutUsPage(),
      '/contact': (context) => ContactUsPage(),

    }


    );
  }
}

