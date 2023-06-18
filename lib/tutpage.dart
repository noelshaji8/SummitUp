import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tutpage extends StatefulWidget {
  const Tutpage({super.key});

  @override
  State<Tutpage> createState() => _TutpageState();
}

class _TutpageState extends State<Tutpage> {
  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }
  @override
  Widget build(BuildContext context) {
    // double baseWidth = 360;
    // double fem = MediaQuery.of(context).size.width;
    // double ffem = fem * 0.97 / baseWidth;

    var fem = MediaQuery.of(context);
    var ffem = fem.size;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
      body: Container(
        alignment: Alignment.center,
        // iphone14promax1e7y (1:2)
        width: fem.size.width,
        height: fem.size.height,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              // image2XhZ (1:8)
              left: 0,
              top: 0,
              child: Align(
                child: SizedBox(
                  width: fem.size.width,
                  height: 0.65 * fem.size.height,
                  child: const Image(
                    image: AssetImage('images/tut1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              // ellipse1KNX (1:12)
              bottom: -30,
              left: 0,
              child: Align(
                child: SizedBox(
                    height: 0.45 * fem.size.height,
                    width: fem.size.width,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromARGB(255, 30, 29, 29)),
                    )),
              ),
            ),
            Positioned(
              // rectangle2S3q (1:4)
              left: fem.size.width / 2 - 35,
              top: fem.size.height * 0.597,
              child: const Align(
                child: SizedBox(
                  width: 70,
                  height: 70,

                  // decoration: BoxDecoration(
                  //   shape: BoxShape.circle,

                  //   border: Border.all(),
                  //   color: const Color(0xff041319),
                  // ),

                  // width: 50,
                  // height: 50,
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('images/logo1.png'),
                  ),
                ),
              ),
            ),
            Positioned(
              // summitupRAf (1:18)
              left: fem.size.width / 2 - 70,
              top: 0.07 * fem.size.height,
              child: Align(
                child: SizedBox(
                  width: 140,
                  height: 40,
                  child: const Text(
                    'SummitUp',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Positioned(
              // neverforgettheimportantstuffkM (2:21)
              left: fem.size.width / 2 - 100,
              bottom: 0.185 * fem.size.height,
              child: Align(
                child: SizedBox(
                  width: 200,
                  height: 60,
                  child: const Text(
                    'Never forget the important stuff!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 241, 229, 229),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle3EXR (2:26)
              left: fem.size.width * 0.30,
              top: 0.85 * fem.size.height,
              child: Align(
                alignment: Alignment.center,
                child: MaterialButton(
                  height: 50,
                  minWidth: 120,
                  onPressed: () {
                    Navigator.pushNamed(context, '/2');
                  },
                  color: Color.fromARGB(255, 239, 236, 236),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text("Get Started",
                      style: TextStyle(
                          color: Color.fromARGB(205, 0, 0, 0),
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}
