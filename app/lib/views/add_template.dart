import 'package:app/models/quotes.dart';
import 'package:app/controllers/quote_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormWidgetBois extends StatefulWidget {
  const FormWidgetBois({Key? key}) : super(key: key);

  @override
  _FormWidgetBoisState createState() => _FormWidgetBoisState();
}

class _FormWidgetBoisState extends State<FormWidgetBois> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final newUserQuote = TextEditingController();
  late final newUserAuthor = TextEditingController();

  void uploadQuote(quote, author) async {
    Quote brandNewQuote = Quote(text: quote.text, author: author.text);
    QuoteController quoteController = QuoteController();
    print("author ${brandNewQuote.author}");
    print("text ${brandNewQuote.text}");
    await quoteController.addNewQuote(author: brandNewQuote.author, quote: brandNewQuote.text);

    Navigator.pop(context);
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
                  uploadQuote(newUserQuote, newUserAuthor);
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
