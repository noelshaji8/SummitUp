import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_auth/firebase_auth.dart';

class History extends StatefulWidget {
  History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  late Query dbRef;
  String user = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('posts/$user');
  }

  Widget listItem({required Map posts}) {
    var fem = MediaQuery.of(context);

    return SizedBox(
      width: 0.92 * fem.size.width,
      height: 0.3 * fem.size.height,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Color(0xff000000)),
          color: Color(0xff13191b),
        ),
        child: TextField(
          readOnly: true,
          controller: TextEditingController(text: posts['text']),
          style: TextStyle(color: Color.fromARGB(255, 245, 243, 243)),
          maxLines: 15,
          decoration: InputDecoration(
            
            contentPadding: EdgeInsets.all(15),
            border: OutlineInputBorder(
                gapPadding: 1,
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
                    right: fem.size.width/81-fem.size.width,
                    bottom: fem.size.height-120,
                    child: Container(
                      width: fem.size.width*3,
                      height: fem.size.height,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff3d0d35),
                      ),
                    ),
                  ),
                  Positioned(
                    left: fem.size.width /2.9,
                    top: fem.size.height*0.065,
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
              Positioned(
                left: 0.03 * fem.size.width,
                top: 0.05 * fem.size.height,
                child: BackButton(
                  color: Color.fromARGB(255, 231, 226, 226),
                ),
              ),
              Positioned(
                // rectangle3jDP (2:4)
                left: 0.025 * fem.size.width,
                top: 0.19 * fem.size.height,
                child: SingleChildScrollView(
                  child: Container(
                    width: 0.95 * fem.size.width,
                    height: 0.8 * fem.size.height,
                    child: FirebaseAnimatedList(
                      query: dbRef,
                      itemBuilder: (BuildContext context, DataSnapshot snapshot,
                          Animation<double> animation, int index) {
                        Map posts = snapshot.value as Map;
                        print(posts['key']);

                        return listItem(posts: posts);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
