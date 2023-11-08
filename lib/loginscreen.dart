import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }
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
                  color: Color(0xcc3d0d35),
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

          showDialog(context: context, builder: (context) {
            return Center(child: CircularProgressIndicator());
          },);

          try {
            final user = await _auth.signInWithEmailAndPassword(
                email: email, password: password);
            if (user != null) {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/4');
            }
          } catch (e) {
            print(e);
          }
        },
        color: Color.fromARGB(255, 255, 255, 255),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: const Text("Submit",
            style: TextStyle(
                color: Color(0xcc3d0d35),
                fontSize: 18,
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
          
          Navigator.pushNamed(context, '/3')
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
    
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 1,
                    width: MediaQuery.of(context).size.width / 1,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff3d0d35),
                          Color(0xcc3d0d35),
                          Color(0xcc3d0d35),
                          Color(0xcc3d0d35),
                          
                        ],
                      ),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 40),
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
        )));
  }
}
