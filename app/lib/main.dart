import 'package:app/pages/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/add_quotes.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/single_quote.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => LoadingScreen(),
    '/home': (context) => Home(),
    '/singleQuote': (context) => SingleQuote(),
    '/add': (context) => AddQuote(),
  }
));