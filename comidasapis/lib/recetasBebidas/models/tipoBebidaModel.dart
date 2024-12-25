class Tipobebidamodel {
  final int idTipo;
  final String nameTipo;
  final String image;
  Tipobebidamodel(
      {required this.idTipo, required this.nameTipo, required this.image});
  factory Tipobebidamodel.fromJson(Map<String, dynamic> json) =>
      Tipobebidamodel(
          idTipo: json["idTipo"],
          nameTipo: json["nameTipo"],
          image: json["image"]);
  Map<String, dynamic> toJson() => {
        "idTipo": idTipo,
        "nameTipo": nameTipo,
        "image": image,
      };
  Tipobebidamodel copy() =>
      Tipobebidamodel(idTipo: idTipo, nameTipo: nameTipo, image: image);
}
