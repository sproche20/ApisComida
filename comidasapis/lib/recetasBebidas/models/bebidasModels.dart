class Bebidasmodels {
  final int? idDrinks;
  final String strDrink;
  final String strAlcoholic /**Tipo de bebida alcolica */;
  final String strCategory;
  final String strInstructionsES;
  final String strDrinkThumb /**imagen de cada bebida */;
  final String strGlass /**Tipo de vaso */;
  String? strTranslatedstrAlcoholic;
  String? strTranslatedstrDrink;
  String? strTranslatedstrCategory;
  String? strTranslatedstrGlass;
  Bebidasmodels(
      {required this.strDrink,
      required this.strAlcoholic,
      required this.strCategory,
      required this.strInstructionsES,
      required this.strDrinkThumb,
      required this.strGlass,
      this.idDrinks,
      this.strTranslatedstrDrink,
      this.strTranslatedstrAlcoholic,
      this.strTranslatedstrCategory,
      this.strTranslatedstrGlass});
  factory Bebidasmodels.fromJson(Map<String, dynamic> json) {
    return Bebidasmodels(
        idDrinks: json['idDrink'] != null ? int.tryParse(json['idDrink']) : -1,
        strDrink: json['strDrink'] ?? 'Desconocido',
        strAlcoholic: json['strAlcoholic'] ?? 'Desconocido',
        strCategory: json['strCategory'] ?? 'Desconocido',
        strInstructionsES: json['strInstructionsES'] ?? 'Desconocido',
        strDrinkThumb:
            json['strDrinkThumb'] ?? 'https://via.placeholder.com/300',
        strGlass: json['strGlass'] ?? 'Desconocido',
        strTranslatedstrDrink: null,
        strTranslatedstrAlcoholic: null,
        strTranslatedstrCategory: null,
        strTranslatedstrGlass: null);
  }
  Map<String, dynamic> toJson() => {
        'idDrinks': idDrinks,
        'strDrink': strDrink,
        'strAlcoholic': strAlcoholic,
        'strCategory': strCategory,
        'strInstructionsES': strInstructionsES,
        'strDrinkThumb': strDrinkThumb,
        'strGlass': strGlass,
        'strTranslatedstrDrink': strTranslatedstrDrink,
        'strTranslatedstrAlcoholic': strTranslatedstrAlcoholic,
        'strTranslatedstrCategory': strTranslatedstrCategory,
        'strTranslatedstrGlass': strTranslatedstrGlass,
      };
  Bebidasmodels copyWith({
    int? idDrinks,
    String? strDrink,
    String? strAlcoholic /**Tipo de bebida alcolica */,
    String? strCategory,
    String? strInstructionsES,
    String? strDrinkThumb /**imagen de cada bebida */,
    String? strGlass /**Tipo de vaso */,
    String? strTranslatedstrAlcoholic,
    String? strTranslatedstrDrink,
    String? strTranslatedstrCategory,
    String? strTranslatedstrGlass,
  }) {
    return Bebidasmodels(
      idDrinks: idDrinks ?? this.idDrinks,
      strDrink: strDrink ?? this.strDrink,
      strAlcoholic: strAlcoholic ?? this.strAlcoholic,
      strCategory: strCategory ?? this.strCategory,
      strInstructionsES: strInstructionsES ?? this.strInstructionsES,
      strDrinkThumb: strDrinkThumb ?? this.strDrinkThumb,
      strGlass: strGlass ?? this.strGlass,
      strTranslatedstrAlcoholic:
          strTranslatedstrAlcoholic ?? this.strTranslatedstrAlcoholic,
      strTranslatedstrDrink:
          strTranslatedstrDrink ?? this.strTranslatedstrDrink,
      strTranslatedstrCategory:
          strTranslatedstrCategory ?? this.strTranslatedstrCategory,
      strTranslatedstrGlass:
          strTranslatedstrGlass ?? this.strTranslatedstrGlass,
    );
  }
}
