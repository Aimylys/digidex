import 'package:flutter/material.dart';

class AffichePage extends StatefulWidget {
  const AffichePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AffichePage> createState() => _AffichePageState();
}

class _AffichePageState extends State<AffichePage> {
  Map<String, dynamic> dataMap = new Map();

  Widget afficheData() {
    Column contenu = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.empty(growable: true),
    );

    contenu.children.add(
      Image.network(
          "https://digi-api.com/images/digimon/w/${dataMap['name'].toString()}.png"),
    );
    contenu.children.add(Text("Nom: " + dataMap['name'].toString()));

    return contenu;
  }

  @override
  Widget build(BuildContext context) {
    dataMap =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          afficheData(),
          const Padding(padding: EdgeInsets.only(bottom: 50)),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/route4');
              },
              child: const Text("En chercher un autre ?",
                  style: TextStyle(color: Colors.black)),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.grey))),
          const Padding(padding: EdgeInsets.only(bottom: 50)),
          ElevatedButton(
              onPressed: () {
                //tabdigimoi.add(dataMap['name'].toString());
                Navigator.pushNamed(context, '/afficher');
              },
              child:
                  const Text("Ajouter", style: TextStyle(color: Colors.black)),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.grey))),
        ],
      )),
    );
  }
}
