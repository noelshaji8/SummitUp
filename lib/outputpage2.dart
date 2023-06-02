import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;

class Outputpage2 extends StatefulWidget {
  String response = "";
  double currentSliderValue;
  String text;
  Outputpage2({super.key, required this.text, required this.currentSliderValue});

  @override
  State<Outputpage2> createState() => _Outputpage2State();
}

class _Outputpage2State extends State<Outputpage2> {
  late String dbdata;
  late DatabaseReference dbRef; 
  late Future newData;
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Students');
    newData = sum();
  }

  sum() async {
    final response =
        await http.post(Uri.parse('https://portal.ayfie.com/api/summarize'),
            headers: {
              'X-API-KEY': 'NIAvbRwSJGRsLYBpwSwbwVYGnUYWxSLHmDMswngbZLvvRkpLJl',
              'accept': 'application/json',
              'Content-Type': 'application/json',
            },
            body: jsonEncode({
              'language': 'en',
              'text': widget.text,
              'min_length': 1,
              'max_length': widget.currentSliderValue,
            }));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['result'];
      print(data);
      return data;

      //widget.newdata = data;
      //print(widget.newdata);
    } else {
      print(response.statusCode);
      print(response.body);
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
                                return TextField(
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 233, 227, 227)),
                                  maxLines: 15,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  controller: TextEditingController(
                                      text: snapshot.data.toString()),
                                );
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
                  Map<String, dynamic> students = {
                    'txt': dbdata,
                    'value': widget.currentSliderValue,
                    };
                    dbRef.push().set(students);
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
