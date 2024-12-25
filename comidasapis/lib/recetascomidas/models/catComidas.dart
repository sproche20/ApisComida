class Catcomidas {
  final int? idCategory;
  final String strCategory;
  final String strImageCategory;
  String? strCategoryTranslated;
  Catcomidas({
    this.idCategory = -1,
    required this.strCategory,
    required this.strImageCategory,
    this.strCategoryTranslated,
  });
  factory Catcomidas.fromJson(Map<String, dynamic> json) {
    return Catcomidas(
        idCategory: json['idCategory'] is int
            ? json['idCategory']
            : int.tryParse(json['idCategory'] ?? '-1'),
        strCategory: json['strCategory'],
        strImageCategory: json['strCategoryThumb']);
  }
}
