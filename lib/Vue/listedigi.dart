import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ListDigi extends StatefulWidget {
  const ListDigi({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ListDigi> createState() => _ListDigiState();
}

class _ListDigiState extends State<ListDigi> {
  List<Map<String, dynamic>> dataList = [];
  bool recupDataBool = false;
  int id = 1;

  Future<void> recupDataJson(int id) async {
    String url = "https://digi-api.com/api/v1/digimon/" + id.toString();
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        dataList.add(convert.jsonDecode(response.body));
        recupDataBool = true;
      });
    } else {
      setState(() {
        recupDataBool = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    for (id = 1; id <= 1422; id++) {
      recupDataJson(id);
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
                    for (int i = 0; i < dataList.length -1; i++)
                      DataRow(cells: [
                        DataCell(Text('${i + 1}')),
                        DataCell(Text("${dataList[i + 1]['name']}")),
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
