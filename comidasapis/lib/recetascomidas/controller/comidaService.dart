import 'dart:convert';

import 'package:comidasapis/recetascomidas/models/comidasModels.dart';
import 'package:comidasapis/recetascomidas/models/modelolistaComidas.dart';
import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';

class Comidaservice {
  var urlFilter = Uri.https('www.themealdb.com', '/api/json/v1/1/filter.php');
  var urlSearch = Uri.https('www.themealdb.com', '/api/json/v1/1/search.php');

  final translator = GoogleTranslator();
  Future<List<Modelolistacomidas>> listarComidasPorCategoria(
      String categoria) async {
    var queryParameters = {'c': categoria};
    final response =
        await http.get(urlFilter.replace(queryParameters: queryParameters));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      var meals = data['meals'] as List;
      List<Modelolistacomidas> comidaList = meals
          .map((mealJson) => Modelolistacomidas.fromJson(mealJson))
          .toList();
      for (var comidas in comidaList) {
        /**traducir nombre comida */
        var translationstrComida =
            await translator.translate(comidas.strComida, from: 'en', to: 'es');
        comidas.strTranslatedstrComida = translationstrComida.text;
      }
      return comidaList;
    } else {
      throw Exception('Fallo al cargar las comidas');
    }
  }

  Future<List<Modelolistacomidas>> listarComidasPorRegion(String region) async {
    var queryParameters = {'a': region};
    final response =
        await http.get(urlFilter.replace(queryParameters: queryParameters));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      var meals = data['meals'] as List;
      List<Modelolistacomidas> comidaList = meals
          .map((mealJson) => Modelolistacomidas.fromJson(mealJson))
          .toList();
      for (var comidasRegion in comidaList) {
        var translationstrComida = await translator
            .translate(comidasRegion.strComida, from: 'en', to: 'es');
        comidasRegion.strTranslatedstrComida = translationstrComida.text;
      }
      return comidaList;
    } else {
      throw Exception('Fallo al cargar las comidas');
    }
  }

  Future<List<ComidasModels>> buscarComidaPorBuscador(String nombre) async {
    var queryParameters = {'s': nombre};
    final response =
        await http.get(urlSearch.replace(queryParameters: queryParameters));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      var meals = data['meals'] as List;
      if (meals.isNotEmpty) {
        List<ComidasModels> comidaList =
            meals.map((mealJson) => ComidasModels.fromJson(mealJson)).toList();
        List<ComidasModels> translatedComidaList = [];
        for (var comida in comidaList) {
          translatedComidaList.add(await traducirComida(comida));
        }
        return translatedComidaList;
      } else {
        return [];
      }
    } else {
      throw Exception('Fallo al buscar la comida');
    }
  }

  Future<ComidasModels> buscarComidaPorNombre(String nombre) async {
    var queryParameters = {'s': nombre};
    final response =
        await http.get(urlSearch.replace(queryParameters: queryParameters));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      var meals = data['meals'] as List;
      if (meals.isNotEmpty) {
        var comida = ComidasModels.fromJson(meals.first);
        comida = await traducirComida(comida);
        return comida;
      } else {
        throw Exception('No se encontró la comida');
      }
    } else {
      throw Exception('Fallo al buscar la comida');
    }
  }

  Future<ComidasModels> traducirComida(ComidasModels comida) async {
    // Traducir nombre comida
    var translationstrComida =
        await translator.translate(comida.strComida, from: 'en', to: 'es');
    comida.strTranslatedstrComida = translationstrComida.text;

    // Traducir categoría
    var translationstrCategoria =
        await translator.translate(comida.strCategoria, from: 'en', to: 'es');
    comida.strTranslatedCategoria = translationstrCategoria.text;

    // Traducir área
    var translationstrArea =
        await translator.translate(comida.strArea, from: 'en', to: 'es');
    comida.strTranslatedArea = translationstrArea.text;

    // Traducir instrucciones
    var translationstrInstrucciones = await translator
        .translate(comida.strInstrucciones, from: 'en', to: 'es');
    comida.strTranslatedInstrucciones = translationstrInstrucciones.text;

    return comida;
  }
}
