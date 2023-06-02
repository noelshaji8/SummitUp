import 'package:flutter/material.dart';
import 'package:summitup/loginscreen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:summitup/outputpage2.dart';

class Homepage2 extends StatefulWidget {
  
  
  double currentSliderValue = 0;

  @override
  State<Homepage2> createState() => _Homepage2State();
}

class _Homepage2State extends State<Homepage2> {
  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }
  late String text;
  //late DatabaseReference dbRef;

  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
     //dbRef = FirebaseDatabase.instance.ref().child('Students');
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

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);

    // if no file is picked
    if (result == null) return;

    // we get the file from result object
    final file = result.files.first;

    openFile(file);
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    var fem = MediaQuery.of(context);

    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              width: fem.size.width,
              height: fem.size.height,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 5, 21, 21),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    // rectangle2MKK (2:3)
                    left: 0,
                    top: 0,
                    child: Container(
                      width: fem.size.width,
                      height: 0.17 * fem.size.height,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 81, 20, 70),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "SummitUp",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(226, 237, 230, 230)),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0.03 * fem.size.width,
                    top: 0.05 * fem.size.height,
                    child: IconButton(
                      onPressed: () {
                        _auth.signOut();
                        Navigator.pushNamed(context, '/2');
                      },
                      icon: Icon(Icons.logout),
                      iconSize: 25,
                      color: Color.fromARGB(255, 247, 245, 245),
                    ),
                  ),
                  Positioned(
                    // rectangle3jDP (2:4)
                    left: 0.04 * fem.size.width,
                    top: 0.20 * fem.size.height,
                    child: SizedBox(
                      width: 0.92 * fem.size.width,
                      height: 0.27 * fem.size.height,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Color(0xff000000)),
                          color: Color(0xff13191b),
                        ),
                        child: SizedBox(
                          width: 0.40 * fem.size.width,
                          height: 0.19 * fem.size.height,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              border: Border.all(
                                  color: Color.fromARGB(255, 241, 237, 237)),
                              color: Color(0xff13191b),
                            ),
                            child: TextField(
                              onChanged: (value) {
                            text = value;
                          },
                              style: TextStyle(
                                  color: Color.fromARGB(255, 245, 243, 243)),
                              maxLines: 15,
                              decoration: InputDecoration(
                                hintText: 'Enter text',
                                border: OutlineInputBorder(gapPadding: 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0.04 * fem.size.width,
                    top: 0.5 * fem.size.height,
                    child: SizedBox(
                      width: 0.92 * fem.size.width,
                      height: 0.07 * fem.size.height,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: Color.fromARGB(225, 106, 102, 102)),
                        child: TextField(
                          // onChanged: (value) {
                          //   widget.text = value;
                          // },

                          style: TextStyle(
                              color: Color.fromARGB(255, 245, 243, 243)),
                          keyboardType: TextInputType.url,
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: 'Enter url',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: fem.size.height * 0.31,
                    left: (fem.size.width / 2) * 0.165,
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        MaterialButton(
                          color: Color(0xff3c0c35),
                          onPressed: () {
                            Navigator.pushNamed(context, "/6");
                          },
                          minWidth: 0.38 * fem.size.width,
                          height: 0.088 * fem.size.height,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'History',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: fem.size.width * 0.075),
                        MaterialButton(
                          color: Color(0xff3d0d35),
                          onPressed: () {
                            pickFile();
                          },
                          minWidth: 0.38 * fem.size.width,
                          height: 0.088 * fem.size.height,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'Files',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: fem.size.width * 0.03,
                    bottom: fem.size.height * 0.19,
                    child: Theme(
                      data: ThemeData(
                        colorSchemeSeed: const Color(0xff6750a4),
                        useMaterial3: true,
                      ),
                      child: Container(
                        width: fem.size.width * 0.9,
                        child: Slider(
                          value: widget.currentSliderValue,
                          max: 100,
                          divisions: 100,
                          label: widget.currentSliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              widget.currentSliderValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: fem.size.height * 0.073,
                    child: MaterialButton(
                      height: 50,
                      minWidth: 120,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Outputpage2(
                                  text: text,
                                  currentSliderValue: widget.currentSliderValue);
                                  
                            },
                          ),
                        );
                        
                    // Map<String, dynamic> students = {
                    // 'txt': text,
                    // 'value': widget.currentSliderValue,
                    // };
                    // dbRef.push().set(students);
                  
                      },
                      color: Color(0xff3d0d35),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text("Summarize",
                          style: TextStyle(
                              color: Color.fromARGB(255, 249, 246, 246),
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
