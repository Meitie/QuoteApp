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

    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Quote:"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: double.maxFinite,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.indigo,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        data["quote"],
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 70.0),
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
                  Text(
                    data["author"],
                    style: const TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
