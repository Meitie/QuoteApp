import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class Quote {
  String text;
  String author;
  late List<dynamic> allQuotes;

  Quote({required this.text, required this.author});

  Future<void> getDBQuotes() async {
    try {
      Response response = await get(Uri.parse('http://10.0.2.2:5000/fetchQuotes'));
      List<dynamic> data = jsonDecode(response.body);
      print(data);

      allQuotes = data;

    } catch (e) {
      print("Caught Error: $e");
      // return {"author": "error", "quote": "there was an error"};
    }
  }

  Future<void> addNewQuote() async {
    try {
      Response response = await post(Uri.parse('http://10.0.2.2:5000/create%20quote/'));


    } catch (e) {
      print("Caught Error: $e");
    }
  }
}