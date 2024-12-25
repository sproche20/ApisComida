class ComidasModels {
  final int? idMeal;
  final String strComida;
  final String? strBebidaAlternativa;
  final String strMealThumb /**imagen de cada comida */;
  final String strCategoria;
  final String strArea;
  final String strInstrucciones;
  String? strTranslatedstrComida;
  String? strTranslatedCategoria;
  String? strTranslatedArea;
  String? strTranslatedBebidaAlternativa;
  String? strTranslatedInstrucciones;

  ComidasModels({
    this.idMeal,
    required this.strComida,
    required this.strBebidaAlternativa,
    required this.strMealThumb,
    required this.strCategoria,
    required this.strArea,
    required this.strInstrucciones,
    this.strTranslatedstrComida,
    this.strTranslatedCategoria,
    this.strTranslatedArea,
    this.strTranslatedBebidaAlternativa,
    this.strTranslatedInstrucciones,
  });
  factory ComidasModels.fromJson(Map<String, dynamic> json) {
    return ComidasModels(
        idMeal: json['idMeal'] != null ? int.tryParse(json['idMeal']) : -1,
        strComida: json['strMeal'] ?? 'Desconocido',
        strBebidaAlternativa: json['strDrinkAlternate'],
        strMealThumb: json['strMealThumb'] ?? 'https://via.placeholder.com/300',
        strCategoria: json['strCategory'] ?? 'Desconocido',
        strArea: json['strArea'] ?? 'Desconocido',
        strInstrucciones: json['strInstructions'] ?? 'Sin instrucciones',
        strTranslatedstrComida: null,
        strTranslatedCategoria: null,
        strTranslatedArea: null,
        strTranslatedBebidaAlternativa: null,
        strTranslatedInstrucciones: null);
  }
  Map<String, dynamic> toJson() => {
        'idMeal': idMeal,
        'strMeal': strComida,
        'strDrinkAlternate': strBebidaAlternativa,
        'strMealThumb': strMealThumb,
        'strCategory': strCategoria,
        'strArea': strArea,
        'strInstructions': strInstrucciones,
        'strTranslatedstrComida': strTranslatedstrComida,
        'strTranslatedCategoria': strTranslatedCategoria,
        'strTranslatedArea': strTranslatedArea,
        'strTranslatedBebidaAlternativa': strTranslatedBebidaAlternativa,
        'strTranslatedInstrucciones': strTranslatedInstrucciones,
      };
  ComidasModels copyWith({
    int? idMeal,
    String? strComida,
    String? strBebidaAlternativa,
    String? strMealThumb,
    String? strCategoria,
    String? strArea,
    String? strInstrucciones,
    String? strTranslatedstrComida,
    String? strTranslatedCategoria,
    String? strTranslatedArea,
    String? strTranslatedBebidaAlternativa,
    String? strTranslatedInstrucciones,
  }) {
    return ComidasModels(
      idMeal: idMeal ?? this.idMeal,
      strComida: strComida ?? this.strComida,
      strBebidaAlternativa: strBebidaAlternativa ?? this.strBebidaAlternativa,
      strMealThumb: strMealThumb ?? this.strMealThumb,
      strCategoria: strCategoria ?? this.strCategoria,
      strArea: strArea ?? this.strArea,
      strInstrucciones: strInstrucciones ?? this.strInstrucciones,
      strTranslatedstrComida:
          strTranslatedstrComida ?? this.strTranslatedstrComida,
      strTranslatedCategoria:
          strTranslatedCategoria ?? this.strTranslatedCategoria,
      strTranslatedArea: strTranslatedArea ?? this.strTranslatedArea,
      strTranslatedBebidaAlternativa:
          strTranslatedBebidaAlternativa ?? this.strTranslatedBebidaAlternativa,
      strTranslatedInstrucciones:
          strTranslatedInstrucciones ?? this.strTranslatedInstrucciones,
    );
  }
}
