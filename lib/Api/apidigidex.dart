import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> getDigi(String id) async {
  final response = await http.get(
    //Uri.parse('https://www.digi-api.com/api/v1/digimon/$id'),
    Uri.parse('https://www.digi-api.com/api/v1/digimon/$id'),
    headers: {'Content-Type': 'application/ld+json',},
  );

  //200 -> bon
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    var digi = responseData['hydra:member'];
    //si user n'est pas vide, prendre ses infos
    if (digi.isNotEmpty) {
      var infosDigi = digi[0];
      return {
        'id':infosDigi['id'],
        'name': infosDigi['name'],
        'href': infosDigi['href'],
        'image': infosDigi['image'],
      };
    } else {
      // Digi inexistant -> digimon associé à aucun id
      return {
        'id': null, // Email par défaut si jamais
      };
    }
  } else {
    // Gérer l'échec de la tentative de récupération des infos
    print(
        "Échec de la récupération des infos. Statut code: ${response.statusCode}");
    print("Réponse du serveur: ${response.body}");

    // Retourner une valeur par défaut
    return {
      'id': null,
    };
  }
}

Future<List<Map<String, dynamic>>> getListDigi() async {
  final response = await http.get(
    Uri.parse('https://www.digi-api.com/api/v1/digimon'),
    headers: {'Content-Type': 'application/ld+json',},
  );

  //200 = bon
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    var digi = responseData['hydra:member'];
    if (digi.isNotEmpty) {
      // Map chaque joueur avec ses statistiques
      var tri = digi.map<Map<String, dynamic>>((infosDigi) {
        return {
          'id':infosDigi['id'],
          'name': infosDigi['name'],
          'href': infosDigi['href'],
          'image': infosDigi['image'],
        };
      }).toList();

      return tri;
    } else {
      // Aucun digimon trouvé.
      return [];
    }
  } else {
    // Gérer l'échec de la tetative de récupération des statistiques
    print(
        "Échec de la récupération des statistiques. Statut code: ${response.statusCode}");
    print("Réponse du serveur: ${response.body}");

    // Retourner une liste vide en cas d'échec
    return [];
  }
}