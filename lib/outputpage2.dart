import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Outputpage2 extends StatefulWidget {
  
  String response = "";
  double currentSliderValue;
  //late String text;
  dynamic selectedfile;
  //late String url;
  Outputpage2({
    super.key,
    required this.selectedfile,
    //required this.text,
    required this.currentSliderValue,
    //required this.url,
  });

  @override
  State<Outputpage2> createState() => _Outputpage2State();
}

class _Outputpage2State extends State<Outputpage2> {
  
  late String dbdata;
  String user = FirebaseAuth.instance.currentUser!.email!;
  bool showSpinner = false;
  late DatabaseReference dbRef;
  late Future newData;
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child(user);

    newData = sum();
  }

  Future sum() async {
    setState(() {
      showSpinner = true;
    });
    dynamic currentS = widget.currentSliderValue.toInt();
    String filepath = widget.selectedfile;

    Uri url = Uri.parse('https://api.meaningcloud.com/summarization-1.0');

    var request = await http.MultipartRequest('POST', url);

    request.fields['key'] = '0c531a73c44da7b8dd4de50ed56c6462';
    request.fields['lang'] = 'auto';
    //request.fields['txt'] = widget.text;
    //request.fields['url'] = widget.url;
    request.files.add(await http.MultipartFile.fromPath(
      'doc',
      await filepath,
    ));
    request.fields['limit'] = '$currentS';

    var response = await request.send();
    var responsebody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      setState(() {
        showSpinner = false;
      });
      var data = jsonDecode(responsebody)['summary'];
      print(data);
      return data;
    } else {
      print('failed');
      print(response.statusCode);
      print(responsebody);
      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var fem = MediaQuery.of(context);
    

    return Scaffold(
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
                left: 0.03 * fem.size.width,
                top: 0.05 * fem.size.height,
                child: BackButton(
                  color: Color.fromARGB(255, 231, 226, 226),
                ),
              ),
              Positioned(
                // rectangle3jDP (2:4)
                left: 0.04 * fem.size.width,
                top: 0.20 * fem.size.height,
                child: SizedBox(
                  width: 0.92 * fem.size.width,
                  height: 0.6 * fem.size.height,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Color(0xff000000)),
                      color: Color(0xff13191b),
                    ),
                    child: SizedBox(
                      width: 0.40 * fem.size.width,
                      height: 0.4 * fem.size.height,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            border: Border.all(
                                color: Color.fromARGB(255, 241, 237, 237)),
                            color: Color(0xff13191b),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: FutureBuilder(
                              initialData: "",
                              future: newData,
                              builder: (context, snapshot) {
                                dbdata = snapshot.data.toString();

                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return TextField(
                                    readOnly: true,
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 233, 227, 227)),
                                    maxLines: 16,
                                    decoration: InputDecoration(

                                      contentPadding: EdgeInsets.all(10),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(17)),
                                    ),
                                    controller: TextEditingController(
                                        text: snapshot.data.toString()),
                                  );
                                } else {
                                  return const Align(child: CircularProgressIndicator(),);
                                     
                                    
                                  

                                  //                          showDialog(context: context, builder: (context) {
                                  //   return Center(child: CircularProgressIndicator());
                                  // },);
                                  //return Align(child: CircularProgressIndicator(),);
                                }
                              },
                            ),
                          )),
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
                    Map<String, dynamic> sumtext = {
                      'txt': dbdata,
                      'value': widget.currentSliderValue,
                      'uid': FirebaseAuth.instance.currentUser!.uid,
                    };
                    dbRef.push().set(sumtext);
                  },
                  color: Color(0xff3d0d35),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text("Save to History",
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
    );
  }
}
