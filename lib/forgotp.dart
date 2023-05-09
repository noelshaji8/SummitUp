import 'package:flutter/material.dart';

import 'package:summitup/loginscreen.dart';

class forgotPassword extends StatelessWidget {
  const forgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              width: 500,
              height: 1200,
              decoration: const BoxDecoration(
                color: Color(0xFFC1CDCE),
                //borderRadius: BorderRadius.all(Radius.circular(10.0)),
                image: DecorationImage(
                  image: AssetImage('assets/text.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 250, 30, 0),
                    child: const Text(
                      'Forgot Password ?',
                      style: TextStyle(
                        color: Color(0xFF682704),
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 50, 0, 20),
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      decoration:  InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF0E032E)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.brown.shade900)),

                        //filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Email address",
                        //fillColor: Colors.white70),
                      ),
                    ),
                  ),
                  
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LoginScreen(),
                          ),
                        );
                      },
                      color: const Color(0xFF682704),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text("Submit",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
