import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tours/card.dart';

const url = 'https://course-api.com/react-tours-project';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  late Future<List> futureTours;
  late List tours;

  @override
  void initState() {
    futureTours = fetchTours();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue.shade50,
          body: Center(
            child: ListView(
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Our Tours",
                    style: theme.textTheme.headline3!
                        .copyWith(color: Colors.black),
                  ),
                )),
                Divider(
                    indent: 130,
                    thickness: 5,
                    endIndent: 130,
                    color: theme.primaryColor.withOpacity(0.5)),
                myFutureBuilder(theme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<List> fetchTours() async {
    var response = await http.get(Uri.parse(url));
    tours = json.decode(response.body);
    return tours;
  }

  myFutureBuilder(theme) {
    return FutureBuilder<List>(
        future: futureTours,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return ListView(
                  padding: const EdgeInsets.all(15),
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  children: tours
                      .map((tourDetail) => myCard(tourDetail, theme, onPressed))
                      .toList(),
                );
              }
          }
        });
  }

  onPressed(id) {
    setState(() {
      tours = tours.where((tour) => tour["id"] != id).toList();
    });
  }
}
