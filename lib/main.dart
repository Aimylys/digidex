import 'package:flutter/material.dart';
import 'Vue/myhomepage.dart';
import 'Vue/mesdigi.dart';
import 'Vue/listedigi.dart';
import 'Vue/recherche.dart';
import 'Vue/affichepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digidex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
      routes: <String, WidgetBuilder>{
        '/route1': (BuildContext context) => MyHomePage(title: ''),
        '/route2': (BuildContext context) => MesDigi(title: ''),
        '/route3': (BuildContext context) => ListDigi(title: ''),
        '/route4': (BuildContext context) => Recherche(title: ''),
        '/affiche': (BuildContext context) => AffichePage(title: 'Affichage'),
      },
    );
  }
}
