import 'package:app/controllers/quote_controller.dart';
import 'package:flutter/material.dart';
import 'package:app/models/quotes.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};


  void harryPotter() async {
  //   data = ModalRoute.of(context)!.settings.arguments as Map;
  //   Provider.of<Quotes>(context, listen: false).loopAddAll(data["allQuotes"]);
  //   print(data);
    QuoteController quoteController = QuoteController();
    await quoteController.getDBQuotes().then((value) => Provider.of<Quotes>(context, listen: false).loopAddAll(value));


  }


  void initState(){
    super.initState();
    harryPotter();
  }

  @override
  Widget build(BuildContext context) {

    List<Quote> listedData = Provider.of<Quotes>(context).allQuotes;


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
      body: Scrollbar(
        thickness: 10.0,
        child: ListView.builder(
          itemCount: listedData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
                child: Card(
                  child: ListTile(
                    onTap: () async {
                      await Navigator.pushNamed(context, '/singleQuote', arguments: {
                        "quote": listedData.elementAt(index).text,
                        "author": listedData.elementAt(index).author,
                      });
                    },
                    title: Center(
                      child: Text(
                        "\"${listedData.elementAt(index).text}\"",
                        style: TextStyle(
                          fontSize: 18.0,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.pinkAccent,
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {
            Navigator.pushReplacementNamed(context, '/');
          });
        },
        label: Text("add a quote"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
