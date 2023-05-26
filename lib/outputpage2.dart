import 'package:flutter/material.dart';

class Outputpage2 extends StatefulWidget {
  const Outputpage2({super.key});

  @override
  State<Outputpage2> createState() => _Outputpage2State();
}

class _Outputpage2State extends State<Outputpage2> {
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
                        child: TextField(
                          // onChanged: (value) {
                          //   widget.text = value;
                          // },
                          style: TextStyle(color: Color.fromARGB(255, 245, 243, 243)),
                          maxLines: 15,
                          decoration: InputDecoration(
                            hintText: 'Enter text',
                            border: OutlineInputBorder(
                              gapPadding: 1
                            ),
                          ),
                        ),
                      ),
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
                    Navigator.pushNamed(context, '');
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

