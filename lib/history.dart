import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  Query dbRef = FirebaseDatabase.instance.ref().child('Students');
  //DatabaseReference reference = FirebaseDatabase.instance.ref().child('Students');

  Widget listItem({required Map student}) {
    var fem = MediaQuery.of(context);

    return SizedBox(
      width: 0.92 * fem.size.width,
      height: 0.20 * fem.size.height,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Color(0xff000000)),
          color: Color(0xff13191b),
        ),
        child: TextField(
          readOnly: true,
          controller: TextEditingController(text: student['txt']),
          style: TextStyle(color: Color.fromARGB(255, 245, 243, 243)),
          maxLines: 15,
          decoration: InputDecoration(
            border: OutlineInputBorder(gapPadding: 1,
            borderRadius: BorderRadius.all(Radius.circular(30))),
          ),
        ),
      ),
    );
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
                      "History",
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
                child: SingleChildScrollView(
                  child: Container(
                    width: 0.92 * fem.size.width,
                    height: 0.76 * fem.size.height,
                    child: FirebaseAnimatedList(
                      query: dbRef,
                      itemBuilder: (BuildContext context, DataSnapshot snapshot,
                          Animation<double> animation, int index) {
                        Map student = snapshot.value as Map;
                        student['key'] = snapshot.key;

                        return listItem(student: student);
                      },
                    ),
                  ),

                  // child: Column(
                  //   children: [
                  //     SizedBox(
                  //       width: 0.92 * fem.size.width,
                  //       height: 0.20 * fem.size.height,
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(30),
                  //           border: Border.all(color: Color(0xff000000)),
                  //           color: Color(0xff13191b),
                  //         ),
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(17),
                  //             border: Border.all(
                  //                 color: Color.fromARGB(255, 241, 237, 237)),
                  //             color: Color(0xff13191b),
                  //           ),
                  //           child: TextField(
                  //             readOnly: true,
                  //             // onChanged: (value) {
                  //             //   widget.text = value;
                  //             // },
                  //             style: TextStyle(
                  //                 color: Color.fromARGB(255, 245, 243, 243)),
                  //             maxLines: 15,
                  //             decoration: InputDecoration(
                  //               hintText: 'Enter text',
                  //               border: OutlineInputBorder(gapPadding: 1),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ),
              ),
              // Positioned(
              //   bottom: fem.size.height * 0.073,
              //   child: MaterialButton(
              //     height: 50,
              //     minWidth: 120,
              //     onPressed: () {
              //       Navigator.pushNamed(context, '/third');
              //     },
              //     color: Color(0xff3d0d35),
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10)),
              //     child: const Text("Save to History",
              //         style: TextStyle(
              //             color: Color.fromARGB(255, 249, 246, 246),
              //             fontSize: 16,
              //             fontWeight: FontWeight.bold)),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
