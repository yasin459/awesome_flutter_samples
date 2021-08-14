import 'package:flutter/material.dart';
import 'package:john_sligma_project/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var titles = data;

  @override
  Widget build(BuildContext context) {
    const padding = 20.0;
    return Scaffold(
      backgroundColor: Colors.pinkAccent.shade100,
      body: Padding(
        padding: const EdgeInsets.all(padding),
        child: Center(
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(padding),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Text(
                    '${titles.length} birthdays today',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: 15),
                  ListView(
                    shrinkWrap: true,
                    children: titles
                        .map((person) => ListTile(
                            title: Text(person["name"] as String),
                            subtitle: Text(
                                (person["age"] as int).toString() + " years"),
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(person["image"] as String),
                              radius: 35,
                            )))
                        .toList(),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.pinkAccent),
                    onPressed: () {
                      setState(() {
                        titles = [];
                      });
                    },
                    child: const Text("Clear All"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
