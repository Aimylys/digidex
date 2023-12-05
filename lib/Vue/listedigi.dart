import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../Api/apidigidex.dart';

class ListDigi extends StatefulWidget {
  const ListDigi({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ListDigi> createState() => _ListDigiState();
}

class _ListDigiState extends State<ListDigi> {
  Map<String, dynamic> dataMap = new Map();
  bool recupDataBool = false;
  int id = 1;

  Future<void> recupDataJson() async {
    String url = "https://digi-api.com/api/v1/digimon/" + this.id.toString();
    var reponse = await http.get(Uri.parse(url));
    if (reponse.statusCode == 200) {
      dataMap = convert.jsonDecode(reponse.body);
      recupDataBool = true;
    } else {
      recupDataBool = false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(children: [
                //Padding(padding: EdgeInsets.only(top: 30)),
                Text(
                  'Liste des Digimons',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                DataTable(
                  columns: [
                    DataColumn(label: Text('N°')),
                    DataColumn(label: Text('Nom')),
                  ],
                  rows: [
                    for (id = 0; id < 1422 -1; id++)
                      DataRow(cells: [
                        DataCell(Text('${id + 1}')),
                        DataCell(Text("${dataMap['name']}")),//va être null faut trouver astuce
                      ]),
                  ],
                ),
              ])
            ],
          ),
        ));
  }


}
