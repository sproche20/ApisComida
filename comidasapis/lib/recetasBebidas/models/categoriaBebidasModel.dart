class Categoriabebidasmodel {
  final int? idCategoriaBebidas;
  final String? strCategory;
  final String? image;
  Categoriabebidasmodel(
      {required this.idCategoriaBebidas,
      required this.strCategory,
      required this.image});
  factory Categoriabebidasmodel.fromJson(Map<String, dynamic> json) =>
      Categoriabebidasmodel(
          idCategoriaBebidas: json["idCategoriaBebidas"],
          strCategory: json["strCategory"],
          image: json["image"]);
  Map<String, dynamic> toJson() => {
        "idCategoriaBebidas": idCategoriaBebidas,
        "strCategory": strCategory,
        "image": image,
      };
  Categoriabebidasmodel copy() => Categoriabebidasmodel(
      idCategoriaBebidas: idCategoriaBebidas,
      strCategory: strCategory,
      image: image);
}
