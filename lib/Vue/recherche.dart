import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Recherche extends StatefulWidget {
  const Recherche({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Recherche> createState() => _RechercheState();
}

class _RechercheState extends State<Recherche> {
  final _formKey = GlobalKey<FormState>();

  String txtButton = "Rechercher";
  bool _isLoading = false;

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

  startLoading() async {
    setState(() {
      _isLoading = true;
    });
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate()) {
      await recupDataJson();
      if (recupDataBool) {
        Navigator.popAndPushNamed(context, '/affiche', arguments: dataMap);
      } else {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Erreur dans recupération des informations."),
          ),
        );
      }
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  //savoir si la valeur est un nombre
  bool isNumeric(String s) {
    bool isnum = false;
    try {
      double.parse(s);
      isnum = true;
    } catch (e) {}
    return isnum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/soleil.png',
                          fit: BoxFit.contain,
                          height: 300,
                        ),
                      ]),

              const Padding(padding: EdgeInsets.only(top: 100)),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: TextFormField(
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey, width: 2.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2.5),
                        ),
                        labelText: "N° du Digimon",
                        hintText: "Saisir l'id d'un Digimon"),
                    //initialValue: "9782841774470",
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      LengthLimitingTextInputFormatter(4)
                    ],
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty || !isNumeric(value)) {
                        return 'N° de Digimon non valide !';
                      } else {
                        id = int.parse(value);
                      }
                    },
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: _isLoading ? null : startLoading,
                  child: _isLoading
                      ? CircularProgressIndicator()
                      : const Text("Chercher",
                          style: TextStyle(color: Colors.black)),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.grey)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
