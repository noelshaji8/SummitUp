import 'package:flutter/material.dart';
import 'package:summitup/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Homepage extends StatefulWidget {
  static const String id = 'homepage';
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
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/cover.jpg'),
                ),
              ),
            ),
            
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('Profile'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('History'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.border_color),
              title: Text('Settings'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                _auth.signOut();
                Navigator.pop(context);
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
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter text, url here',
              ),
              onChanged: (text) {
                setState(() {
                  var _text = text;
                });
              },
            ),
            SizedBox(height: 16.0),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Submit'),
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
    
