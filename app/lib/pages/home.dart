import 'package:flutter/material.dart';
import 'package:app/quotes/quotes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    List<dynamic> listedData = data["allQuotes"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          "QuteQuotes",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: listedData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
              child: Card(
                child: ListTile(
                  onTap: () async {
                    await Navigator.pushNamed(context, '/singleQuote', arguments: {
                      "quote": listedData[index]["quote"],
                      "author": listedData[index]["author"],
                    });
                  },
                  title: Text(
                    "\"${listedData[index]["quote"]}\"",
                    style: TextStyle(
                      fontSize: 18.0,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.pinkAccent,
        onPressed: () async {
          dynamic resultQuote = await Navigator.pushNamed(context, '/add');
          setState(() {
            data = {
              'author': resultQuote['author'],
              'text': resultQuote['text'],
            };
          });
        },
        label: Text("add a quote"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
