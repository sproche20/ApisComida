class Regionescomidas {
  final int id;
  final String nameRegion;
  final String image;

  Regionescomidas({
    required this.id,
    required this.nameRegion,
    required this.image,
  });
  factory Regionescomidas.fromJson(Map<String, dynamic> json) =>
      Regionescomidas(
        id: json["id"],
        nameRegion: json["nameRegion"],
        image: json["image"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "nameRegion": nameRegion,
        "image": image,
      };
  Regionescomidas copy() => Regionescomidas(
        id: id,
        nameRegion: nameRegion,
        image: image,
      );
}
