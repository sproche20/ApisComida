import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:comidasapis/recetasBebidas/models/bebidasModels.dart';
import 'package:comidasapis/enlaces.dart';

class Bebidaservice {
  var urlSearch =
      Uri.http('www.thecocktaildb.com', '/api/json/v1/1/search.php');
  var urlFilter =
      Uri.http('www.thecocktaildb.com', '/api/json/v1/1/filter.php');
  final translator = GoogleTranslator();
  Future<List<Bebidasmodels>> listarBebidasPorTipo(String TipoBebidas) async {
    var queryParameters = {'a': TipoBebidas};
    final response =
        await http.get(urlFilter.replace(queryParameters: queryParameters));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      var drinks = data['drinks'] as List;
      List<Bebidasmodels> bebidasTipo = drinks
          .map((drinksJson) => Bebidasmodels.fromJson(drinksJson))
          .toList();
      for (var tipoBebidas in bebidasTipo) {
        var translationBebida = await translator.translate(tipoBebidas.strDrink,
            from: 'en', to: 'es');
        tipoBebidas.strTranslatedstrDrink = translationBebida.text;
      }
      return bebidasTipo;
    } else {
      throw Exception('Fallo al cargar las bebidas');
    }
  }

  Future<List<Bebidasmodels>> listarBebidasPorCategoria(
      String categoriaBebidas) async {
    var queryParameters = {'c': categoriaBebidas};
    final response =
        await http.get(urlFilter.replace(queryParameters: queryParameters));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      var drinks = data['drinks'] as List;
      List<Bebidasmodels> bebidasList = drinks
          .map((drinksJson) => Bebidasmodels.fromJson(drinksJson))
          .toList();
      for (var catBebidas in bebidasList) {
        var translationBebida = await translator.translate(catBebidas.strDrink,
            from: 'en', to: 'es');
        catBebidas.strTranslatedstrDrink = translationBebida.text;
      }
      return bebidasList;
    } else {
      throw Exception('Fallo al cargar las bebidas');
    }
  }

  Future<Bebidasmodels> buscarBebidaPorNombre(String nombre) async {
    var queryParameters = {'s': nombre};
    final response =
        await http.get(urlSearch.replace(queryParameters: queryParameters));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      var drinks = data['drinks'] as List;
      if (drinks.isNotEmpty) {
        var bebidas = Bebidasmodels.fromJson(drinks.first);
        bebidas = await traducirBebidas(bebidas);
        return bebidas;
      } else {
        throw Exception('No se encontró la bebida');
      }
    } else {
      throw Exception('Fallo al buscar la bebida');
    }
  }

  Future<Bebidasmodels> traducirBebidas(Bebidasmodels traducirBebidas) async {
    var translationBebida = await translator.translate(traducirBebidas.strDrink,
        from: 'en', to: 'es');
    traducirBebidas.strTranslatedstrDrink = translationBebida.text;

    var translationTipoBebida = await translator
        .translate(traducirBebidas.strAlcoholic, from: 'en', to: 'es');
    traducirBebidas.strTranslatedstrAlcoholic = translationTipoBebida.text;

    var translationCategoria = await translator
        .translate(traducirBebidas.strCategory, from: 'en', to: 'es');
    traducirBebidas.strTranslatedstrCategory = translationCategoria.text;

    var translationGlass = await translator.translate(traducirBebidas.strGlass,
        from: 'en', to: 'es');
    traducirBebidas.strTranslatedstrGlass = translationGlass.text;
    return traducirBebidas;
  }
}
