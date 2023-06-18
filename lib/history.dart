import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_auth/firebase_auth.dart';

class History extends StatefulWidget {
  
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {



//   void _readData() {
//     _databaseReference.once().then((DataSnapshot snapshot) {
//       if (snapshot.value != null) {
//         Map<dynamic, dynamic> values = snapshot.value;
//         values.forEach((key, values) {
//           print('Post ID: $key');
//           print('Text: ${values['text']}');
//           print('User ID: ${values['userID']}');
//         });
//       } else {
//         print('No data available');
//       }
//     });
//   }

//   void _writeData() {
//     DatabaseReference user1Reference = _databaseReference.child('User1');
//     DatabaseReference user2Reference = _databaseReference.child('User2');

//     user1Reference.push().set({
//       'text': 'New note for User1',
//       'userID': 'User1',
//     });

//     user2Reference.push().set({
//       'text': 'New note for User2',
//       'userID': 'User2',
//     });
//   }
// }



//   void _readData() {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       DatabaseReference userReference = _databaseReference.child('posts').child(user.uid);
      
//       userReference.once().then((DataSnapshot snapshot) {
//         if (snapshot.value != null) {
//           Map<dynamic, dynamic> values = snapshot.value;
//           values.forEach((key, values) {
//             print('Post ID: $key');
//             print('Text: ${values['text']}');
//             print('User ID: ${values['userID']}');
//           });
//         } else {
//           print('No data available');
//         }
//       });
//     }
//   }

//   void _writeData() {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       DatabaseReference userReference = _databaseReference.child('posts').child(user.uid);

//       userReference.push().set({
//         'text': 'New note for ${user.uid}',
//         'userID': user.uid,
//       });
//     }
//   }
// }
  
  


  Query dbRef = FirebaseDatabase.instance.ref().child(FirebaseAuth.instance.currentUser!.email!);
  //Query dbRef = FirebaseDatabase.instance.ref().child(user);
  //DatabaseReference reference = FirebaseDatabase.instance.ref().child('Students');
  
  Widget listItem({required Map sumtext}) {
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
          controller: TextEditingController(text: sumtext['txt']),
          style: TextStyle(color: Color.fromARGB(255, 245, 243, 243)),
          maxLines: 15,
          decoration: InputDecoration(
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
                        Map sumtext = snapshot.value as Map;
                        sumtext['key'] = snapshot.key;

                        return listItem(sumtext: sumtext);
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
