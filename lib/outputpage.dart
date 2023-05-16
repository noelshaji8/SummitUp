import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Outputpage extends StatefulWidget {
  String response = "";
  
  String text;
  Outputpage({required this.text});

  @override
  _OutputpageState createState() => _OutputpageState();
}

class _OutputpageState extends State<Outputpage> {

  late Future newData;
  void initState() {
    // TODO: implement initState
    super.initState();
    newData = sum();
  }

  sum() async {
    

    final response =
        await http.post(Uri.parse('https://portal.ayfie.com/api/summarize'),
            headers: {
              'X-API-KEY': 'NNHVhmMOGhaOpMMHdAhRKVQFgDTLKGspivkVbppNRobJHnTokv',
              'accept': 'application/json',
              'Content-Type': 'application/json',
            },
            body: jsonEncode({
              'language': 'auto',
              'text': widget.text,
              'min_length': 5,
              'max_length': 100,
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

  //sidemenu
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
        ),
        centerTitle: true,
        title: Text('SummitUp'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Summarized text"),
            SizedBox(height: 13),
            SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                scrollDirection: Axis.vertical,
                child: FutureBuilder(
                  
                  future: newData,
                  builder: (context, snapshot) {
                    return TextField(
                      maxLines: 15,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      controller:
                          TextEditingController(text: snapshot.data.toString()),
                    );
                  },
                )),
            SizedBox(height: 16.0),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Save to History'),
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
