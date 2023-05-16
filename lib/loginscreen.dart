import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:summitup/forgotp.dart';
import 'package:summitup/signup.dart';
import 'package:summitup/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  //static const String id = 'loginscreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? isRememberMe = false;
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter your email',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 13),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 5, offset: Offset(0, 2))
              ]),
          height: 52,
          child: TextField(
            onChanged:(value) {
              email = value;
              
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color.fromARGB(204, 146, 198, 223),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter your password',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 13),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 5, offset: Offset(0, 2))
              ]),
          height: 52,
          child: TextField(
            onChanged: (value) {
              password = value;
            },
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color.fromARGB(204, 146, 198, 223),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }



  Widget submitBt() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: MaterialButton(
        height: 50,
        minWidth: 120,
        onPressed: () async {
          try {
          final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
          if (user != null) {
            Navigator.pushNamed(context, '/second');
          }
          }
          catch (e) {
            print(e);
          }
        },
        color: Color.fromARGB(255, 255, 255, 255),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: const Text("Submit",
            style: TextStyle(
                color: Color.fromARGB(102, 61, 101, 118),
                fontSize: 16,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget newaccBt() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () => {
          /*Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Signup(),
              ))*/
              Navigator.pushNamed(context, '/first')
        },
        child: Text(
          "   Don't have an account?\nCreate a new account here.",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1,
                width: MediaQuery.of(context).size.width / 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(102, 152, 207, 231),
                      Color.fromARGB(153, 151, 207, 231),
                      Color.fromARGB(204, 155, 211, 236),
                      Color.fromARGB(255, 151, 205, 228),
                    ],
                  ),
                ),
                child: Container(
                  
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 70),
                      buildEmail(),
                      SizedBox(height: 20),
                      buildPassword(),
                      //buildForgotP(),
                      //buildRemember(),
                      submitBt(),
                      newaccBt()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
