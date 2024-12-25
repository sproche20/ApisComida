import 'dart:convert';

import 'package:comidasapis/recetascomidas/models/catComidas.dart';
import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';

class Catmealservice {
  var url = Uri.https('www.themealdb.com', '/api/json/v1/1/categories.php');
  final translator = GoogleTranslator();
  Future<List<Catcomidas>> listCatComidas() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      var categories = data['categories'] as List;
      List<Catcomidas> catcomidaList =
          categories.map((catJson) => Catcomidas.fromJson(catJson)).toList();
      for (var catcomida in catcomidaList) {
        var translation = await translator.translate(catcomida.strCategory,
            from: 'en', to: 'es');
        catcomida.strCategoryTranslated = translation.text;
      }
      return catcomidaList;
    } else {
      throw Exception('Fallo al cargar la lista de comidas');
    }
  }
}
