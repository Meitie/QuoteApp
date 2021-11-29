
import 'package:app/models/quotes.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class QuoteController  {
  late List<dynamic> allQuotes;

  Future<List<Quote>> getDBQuotes() async {
    List<Quote> emptyList = [];
    try {
      // Response response = await get(Uri.parse('http://localhost:5000/fetchQuotes'));
      Response response = await get(Uri.parse('http://10.0.2.2:5000/fetchQuotes'));
      List<dynamic> data = jsonDecode(response.body);


      for (dynamic item in data) {
        emptyList.add(Quote.fromJson(item));
      }

      // print(data);

      // allQuotes = data;



      // Provider.of<Quote>(context).allQuotes;

    } catch (e) {
      print("Caught Error: $e");
      emptyList.add(Quote.fromJson({"author": "Error", "quote": "There was an error getting your quote"}));
    }
    return emptyList;
  }

  Future<Quote> addNewQuote({author, quote}) async {
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
    return Quote.fromJson(json.decode(response.body));
  }
}