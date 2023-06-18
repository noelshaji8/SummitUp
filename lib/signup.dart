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
    return false; //<-- SEE HERE
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
                      Color.fromARGB(102, 152, 207, 231),
                      Color.fromARGB(153, 151, 207, 231),
                      Color.fromARGB(204, 155, 211, 236),
                      Color.fromARGB(255, 151, 205, 228),
                    ],
                  )),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                    child: const Text(
                      "Signup",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(10, 80, 0, 20),
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: TextField(
                        onChanged: (value) {
                          name = value;
                        },
                        cursorColor: Colors.black,
                        decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.brown.shade900)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.brown.shade900)),
                          filled: true,
                          hintStyle: new TextStyle(color: Colors.grey[800]),
                          hintText: "Name",
                          fillColor: Colors.white70,
                        ),
                      )),
                  Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 20),
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: TextField(
                        onChanged: (value) {
                          email = value;
                        },
                        cursorColor: Colors.black,
                        decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.brown.shade900)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.brown.shade900)),
                          filled: true,
                          hintStyle: new TextStyle(color: Colors.grey[800]),
                          hintText: "Email",
                          fillColor: Colors.white70,
                        ),
                      )),
                 
                  Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 20),
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: TextField(
                        onChanged: (value) {
                          password = value;
                        },
                        cursorColor: Colors.black,
                        obscureText: true,
                        decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.brown.shade900)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.brown.shade900)),
                          filled: true,
                          hintStyle: new TextStyle(color: Colors.grey[800]),
                          hintText: "Password",
                          fillColor: Colors.white70,
                        ),
                      )),
                  
                  Container(
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
                              color: Color.fromARGB(102, 0, 0, 0),
                              fontSize: 16,
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
