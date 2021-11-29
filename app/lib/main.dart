import 'package:app/views/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/views/add_quotes.dart';
import 'package:app/views/home.dart';
import 'package:app/views/single_quote.dart';
import 'package:provider/provider.dart';

import 'models/quotes.dart';

void main() => runApp(ChangeNotifierProvider(
  create: (_) => Quotes(),
  child:   MaterialApp(

    initialRoute: '/',

    routes: {

      '/': (context) => LoadingScreen(),

      '/home': (context) => Home(),

      '/singleQuote': (context) => SingleQuote(),

      '/add': (context) => AddQuote(),

    }

  ),
));