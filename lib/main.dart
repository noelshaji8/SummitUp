import 'package:flutter/material.dart';
import 'package:summitup/homepage2.dart';
import 'history.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'loginscreen.dart';
import 'forgotp.dart';
import 'signup.dart';
import 'tutpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'outputpage2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();

  runApp(MyApp());
  FlutterNativeSplash.remove();
}

// Future initialization(BuildContext? context) async {
//   await Future.delayed(Duration(seconds: 3));
//}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: 'Questrial',
            ),
            initialRoute: '/2',
            routes: {
              "/1": (context) => Tutpage(),
              "/2": (context) => LoginScreen(),
              "/3": (context) => Signup(),
              "/4": (context) => Homepage2(),
              //"/5":(context) => Outputpage2(),
              "/6": (context) => History()
            },
            useInheritedMediaQuery: false,
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
