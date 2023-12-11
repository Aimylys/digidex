import 'package:flutter/material.dart';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => _MyHomeState())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amber,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/fonddecrandeux.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/logodigi.png',
                      fit: BoxFit.contain,
                      height: 300,
                    ),
                  ])),
        ],
      ),
    );
  }
}

class _MyHomeState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(padding: const EdgeInsets.all(8.0), child: Text(''))
            ],
          ),
        ),
        drawer: Drawer(
            child: Container(
          color: Colors.red,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const Center(
                child: DrawerHeader(
                  child: Text(
                    'Menu',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black87),
                  ),
                ),
              ),
              Column(children:[
              Center(
                child: ListTile(
                  title: const Text(
                    'Mes Digimons',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black87),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/route2');
                  },
                ),
              ),
              Center(
                child: ListTile(
                  title: const Text('Listes des Digimons',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black87)),
                  onTap: () {
                    Navigator.pushNamed(context, '/route3');
                  },
                ),
              ),
              Center(
                child: ListTile(
                  title: const Text('Recherche d\'un Digimon',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black87)),
                  onTap: () {
                    Navigator.pushNamed(context, '/route4');
                  },
                ),
              ),
                Padding(
                    padding: const EdgeInsets.only(top: 325),
                    child:
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        //crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/logodigi.png',
                            fit: BoxFit.contain,
                            height: 50,
                          )
                        ]),
                )]),
            ],
          ),
        )),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.blueAccent,
          ),
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        //Image.asset('assets/images/checkers.png', fit: BoxFit.cover, width: 200),
                      ],
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/grandlogo.png',
                          fit: BoxFit.contain,
                          height: 100,
                        ),
                      ])),
              const Padding(padding: EdgeInsets.only(bottom: 50)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/route2');
                  },
                  child: const Text("Mes digimons",
                      style: TextStyle(color: Colors.black87)),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.orange))),
              const Padding(padding: EdgeInsets.only(bottom: 50)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/route3');
                  },
                  child: const Text("Listes des Digimons",
                      style: TextStyle(color: Colors.black87)),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.deepOrangeAccent))),
              const Padding(padding: EdgeInsets.only(bottom: 50)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/route4');
                  },
                  child: const Text("Recherche d\'un Digimon",
                      style: TextStyle(color: Colors.black87)),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.deepOrange))),
              Expanded(
                      child: Container(), // Utilisez ce conteneur pour occuper l'espace disponible
                    ),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  'assets/images/teambasecran.png',
                  fit: BoxFit.contain,
                  height: 200,
                ),
              ),
            ],
          ),
        ));
  }
}
