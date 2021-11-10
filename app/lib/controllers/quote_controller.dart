import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class QuoteController  {
  late List<dynamic> allQuotes;

  Future<void> getDBQuotes() async {
    try {
      // Response response = await get(Uri.parse('http://localhost:5000/fetchQuotes'));
      Response response = await get(Uri.parse('http://10.0.2.2:5000/fetchQuotes'));
      List<dynamic> data = jsonDecode(response.body);
      // print(data);

      allQuotes = data;

    } catch (e) {
      print("Caught Error: $e");
      allQuotes = [{"author": "Error", "quote": "There was an error getting your quote"}];
    }
  }

  Future<void> addNewQuote({author, quote}) async {
    try {
      Response response = await post(
        // Uri.parse('http://localhost:5000/create%20quote/'),
        Uri.parse('http://10.0.2.2:5000/create%20quote/'),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "author": author,
          "quote": quote,
        }),
      );
    } catch (e) {
      print("Caught Error: $e");
      allQuotes = [{"author": "Error", "quote": "There was an error getting your quote"}];
    }
  }
}