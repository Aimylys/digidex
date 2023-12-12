import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../Api/apidigidex.dart';

class MesDigi extends StatefulWidget {
  const MesDigi({Key? key, required this.title}) : super(key: key);

  final String title;
  static MesDigiState of(BuildContext context) =>
      context.findAncestorStateOfType<MesDigiState>()!;

  @override
  State<MesDigi> createState() => MesDigiState();
}

class MesDigiState extends State<MesDigi> {
  Map<String, dynamic> dataMap = new Map();
  List<Map<String, dynamic>> _madataList = [];
  bool recupDataBool = false;
  int id = 1;

  List<Map<String, dynamic>> madatalist() {
    return _madataList;
}

  void ajouterDigi(int id, String nom) {
    _madataList.add({
      'id': id,
      'numero': _madataList.length + 1,
      'nom': nom,
    });
  }

  Future<void> recupDataJson(int id) async {
    String url = "https://digi-api.com/api/v1/digimon/" + id.toString();
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        dataMap = convert.jsonDecode(response.body);
        recupDataBool = true;
      });
    } else {
      setState(() {
        recupDataBool = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
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
                    for (int i = 0; i < _madataList.length -1; i++)
                      DataRow(cells: [
                        DataCell(Text('${i + 1}')),
                        DataCell(Text("${_madataList[i + 1]['name']}")),
                      ]),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
