import 'package:flutter/material.dart';
import '../Api/apidigidex.dart';

class ListDigi extends StatefulWidget {
  const ListDigi({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ListDigi> createState() => _ListDigiState();
}

class _ListDigiState extends State<ListDigi> {
  List<Map<String, dynamic>> listInfosDigi = [];

  @override
  void initState() {
    super.initState();
    researchListInfosDigi();
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
                    DataColumn(label: Text('Image')),
                  ],
                  rows: [
                    for (int i = 1; i < listInfosDigi.length; i++)
                      DataRow(cells: [
                        DataCell(Text('${i + 1}')),
                        DataCell(Text("${listInfosDigi[i]['name']}")),
                        DataCell(Text("${listInfosDigi[i]['image']}")),
                      ]),
                  ],
                ),
              ])
            ],
          ),
        ));
  }

  Future<void> researchListInfosDigi() async {
    var list = await getListDigi();

    setState(() {
      listInfosDigi = list as List<Map<String, dynamic>>;
    });
  }
}