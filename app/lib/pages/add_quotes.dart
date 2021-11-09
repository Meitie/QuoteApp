import 'package:flutter/material.dart';
import 'package:app/templates/add_template.dart';

class AddQuote extends StatefulWidget {
  const AddQuote({Key? key}) : super(key: key);

  @override
  _AddQuoteState createState() => _AddQuoteState();
}

class _AddQuoteState extends State<AddQuote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Add A Quote",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: FormWdigetBois(),
        ),
      );
  }
}
