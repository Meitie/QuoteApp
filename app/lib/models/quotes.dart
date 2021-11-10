import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class Quote {
  String text;
  String author;

  Quote({required this.text, required this.author});

}