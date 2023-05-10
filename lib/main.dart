import 'package:flutter/material.dart';
import 'loginscreen.dart';
import 'forgotp.dart';
import 'signup.dart';
import 'homepage.dart';
import 'outputpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  /*Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }*/

  Widget build(BuildContext context) {
    return ScreenUtilInit(
        
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            initialRoute: "/",
            routes: {
              "/": (context) => LoginScreen(),
              "/first": (context) => Signup(),
              "/second":(context) => Homepage(),
              //"/third":(context) => Outputpage()
            },
            useInheritedMediaQuery: false,
            debugShowCheckedModeBanner: false,
            
          );
        });
  }
}
