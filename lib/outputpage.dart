import 'package:flutter/material.dart';
import 'package:summitup/loginscreen.dart';
import 'package:summitup/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Outputpage extends StatefulWidget {
  //static const String id = 'outputpage';
  @override
  _OutputpageState createState() => _OutputpageState();
}

class _OutputpageState extends State<Outputpage> {
  //final _auth = FirebaseAuth.instance;
  //late User loggedInUser;

  @override
  /*void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }*/

  @override

  //sidemenu
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
        ),
        centerTitle: true,
        title: Text('SummitUp'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('The summarized text:'),
            SizedBox(height: 13),
            SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              scrollDirection: Axis.vertical,
              child: TextField(
                maxLines: 15,
                decoration: InputDecoration(
                  hintText: 'text',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Save to History'),
              onPressed: () {
                // Handle submit button press
              },
            ),
          ],
        ),
      ),
    );
  }
}
