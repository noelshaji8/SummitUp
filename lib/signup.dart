import 'package:flutter/material.dart';
import 'package:summitup/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Future<bool> _onWillPop() async {
    return true; //<-- SEE HERE
  }
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String name;
  late String number;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
      
          child: Container(
            
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              //padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              
              decoration: const BoxDecoration(
                  color: Color(0xFFC1CDCE),
                  //borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff3d0d35),
                          Color(0xcc3d0d35),
                          Color(0xcc3d0d35),
                          Color(0xcc3d0d35),
                    ],
                  )),
              child: Column(
                children: [
                  SizedBox(height: 120),
                  Container(
                    
                    child: const Text(
                      "Signup",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                 SizedBox(height: 90,),
                 Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
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
              email = value;
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xcc3d0d35),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        ),
        SizedBox(height: 30),
                 
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
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
                  color: Color(0xcc3d0d35),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        ),
                  SizedBox(height: 60) ,Container(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: MaterialButton(
                      height: 50,
                      minWidth: 120,
                      onPressed: () async {
                        try {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          if (newUser != null) {
                            Navigator.pushNamed(context, '/2');
                          }
                          
                        } catch (e) {
                          print(e);
                        }
                      },
                      color: Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text("Submit",
                          style: TextStyle(
                              color: Color(0xcc3d0d35),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      )),
    ));
  }
}