import 'package:app/models/quotes.dart';
import 'package:app/controllers/quote_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void setupQuotes() async {
    // Quote quote = Quote(author: "", text: '');
    QuoteController quoteController = QuoteController();
    List<Quote> bob = await quoteController.getDBQuotes();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'allQuotes': bob,
    });
  }

  void initState(){
    super.initState();
    setupQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[400],
      body: Center(
        child: SpinKitPianoWave(
          color: Colors.black,
          size: 50.0,
        )
      ),
    );
  }
}
