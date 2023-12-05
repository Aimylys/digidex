import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
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
                      color: Colors.brown),
                ),
              ),
            ),
            Center(
              child: ListTile(
                title: const Text(
                  'Mes Digimons',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.brown),
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
                    style: TextStyle(color: Colors.brown)),
                onTap: () {
                  Navigator.pushNamed(context, '/route3');
                },
              ),
            ),
            Center(
              child: ListTile(
                title: const Text('Recherche d\'un Digimon',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.brown)),
                onTap: () {
                  Navigator.pushNamed(context, '/route4');
                },
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(top: 50),
              child:
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    //Image.asset('assets/images/checkers.png', fit: BoxFit.cover, width: 200),
                  ],
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                const Text(
                  'Bienvenue sur Digidex !!!',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ])),
          const Padding(padding: EdgeInsets.only(bottom: 50)),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/route2');
              },
              child: const Text("Mes digimons",style: TextStyle(color: Colors.blueAccent)),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.red))),
          const Padding(padding: EdgeInsets.only(bottom: 50)),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/route3');
              },
              child: const Text("Listes des Digimons",style: TextStyle(color: Colors.blueAccent)),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.red))),
          const Padding(padding: EdgeInsets.only(bottom: 50)),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/route4');
              },
              child: const Text("Recherche d\'un Digimon",style: TextStyle(color: Colors.blueAccent)),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.red))),
        ],
      ),
    );
  }
}
