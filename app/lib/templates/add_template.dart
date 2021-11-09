import 'package:app/quotes/quotes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/quotes/quotes.dart';

class FormWdigetBois extends StatefulWidget {
  const FormWdigetBois({Key? key}) : super(key: key);

  @override
  _FormWdigetBoisState createState() => _FormWdigetBoisState();
}

class _FormWdigetBoisState extends State<FormWdigetBois> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final newUserQuote = TextEditingController();
  late final newUserAuthor = TextEditingController();

  void uploadQuote(quote, author) async {
    Quote brandNewQuote = Quote(text: quote.text, author: author.text);
    print("author ${brandNewQuote.author}");
    print("text ${brandNewQuote.text}");
    // await quote.addNewQuote();

    Navigator.pushReplacementNamed(context, "/", arguments: {

    });

    // Navigator.pop(context, {
    //   "author": brandNewQuote.author,
    //   "text": brandNewQuote.text,
    // });
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: newUserQuote,
              decoration: const InputDecoration(
                hintText: 'Enter Your Quote',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: newUserAuthor,
              decoration: const InputDecoration(
                hintText: 'Enter The Author',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState!.validate()) {
                    // Process data.
                    uploadQuote(newUserQuote, newUserAuthor);
                  }
                },
                child: const Text('Submit'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[600],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
