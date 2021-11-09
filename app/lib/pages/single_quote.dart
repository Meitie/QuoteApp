import 'package:flutter/material.dart';

class SingleQuote extends StatefulWidget {
  const SingleQuote({Key? key}) : super(key: key);

  @override
  _SingleQuoteState createState() => _SingleQuoteState();
}

class _SingleQuoteState extends State<SingleQuote> {

  Map data = {};


  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Quote:"),
        centerTitle: true,
        elevation: 0,
      ),
        body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                            "Author: ",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Text(data["author"],
                          style: const TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Quote: ",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Text(data["quote"],
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
    );
  }
}
