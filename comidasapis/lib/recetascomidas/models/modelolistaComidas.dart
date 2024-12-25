class Modelolistacomidas {
  final int? idMeal;
  final String strComida;
  final String strMealThumb /**imagen de cada comida */;
  String? strTranslatedstrComida;
  Modelolistacomidas({
    this.idMeal,
    required this.strComida,
    required this.strMealThumb,
    this.strTranslatedstrComida,
  });
  factory Modelolistacomidas.fromJson(Map<String, dynamic> json) {
    return Modelolistacomidas(
      idMeal: json['idMeal'] != null ? int.tryParse(json['idMeal']) : -1,
      strComida: json['strMeal'] ?? 'Desconocido',
      strMealThumb: json['strMealThumb'] ?? 'https://via.placeholder.com/300',
      strTranslatedstrComida: null,
    );
  }
  Map<String, dynamic> toJson() => {
        'idMeal': idMeal,
        'strMeal': strComida,
        'strMealThumb': strMealThumb,
        'strTranslatedstrComida': strTranslatedstrComida,
      };
  Modelolistacomidas copyWith({
    int? idMeal,
    String? strComida,
    String? strMealThumb,
    String? strTranslatedstrComida,
  }) {
    return Modelolistacomidas(
      idMeal: idMeal ?? this.idMeal,
      strComida: strComida ?? this.strComida,
      strMealThumb: strMealThumb ?? this.strMealThumb,
      strTranslatedstrComida:
          strTranslatedstrComida ?? this.strTranslatedstrComida,
    );
  }
}
