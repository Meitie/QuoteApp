import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class Quote {
  String text;
  String author;

  Quote({required this.text, required this.author});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      text: json['quote'],
      author: json['author'],
    );
  }
}


class Quotes extends ChangeNotifier {
  List<Quote> allQuotes = [];

  void addQuote(Quote quote) {
    allQuotes.add(quote);
    notifyListeners();
  }

  void loopAddAll(List<Quote> bob) {
    allQuotes = bob;
    notifyListeners();
  }

}