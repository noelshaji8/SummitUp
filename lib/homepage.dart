import 'package:flutter/material.dart';
import 'package:summitup/loginscreen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:summitup/outputpage.dart';

class Homepage extends StatefulWidget {
  late String text;
  //static const String id = 'homepage';
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  @override
  void initState() {
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
  }

  @override

  //sidemenu
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Hi there!',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            
            ListTile(
              leading: Icon(Icons.history),
              title: Text('History'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                _auth.signOut();
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
      ),

      //sidemenu end

      appBar: AppBar(
        centerTitle: true,
        title: Text('SummitUp'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              scrollDirection: Axis.vertical,
              child: TextField(
                onChanged: (value) {
                  widget.text = value;
                },
                maxLines: 15,
                decoration: InputDecoration(
                  hintText: 'Enter text',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Submit'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Outputpage(text: widget.text);
                }));
                
                // Handle submit button press
              },
            ),
          ],
        ),
      ),
    );
  }
}
