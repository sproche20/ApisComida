import 'package:comidasapis/enlaces.dart';

class Carruseles {
  static Container carrusel(List<Catcomidas> catcomidas) {
    final List<Widget> imageSliders = catcomidas.map((catcomida) {
      return Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            // Navegar a la lista de comidas filtradas por categoría
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    Listascomidas(categoria: catcomida.strCategory),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage('assets/maderas.jpg'),
                    fit: BoxFit.cover)),
            margin: EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(
                    catcomida.strImageCategory,
                    fit: BoxFit.cover,
                    width: 1000.0,
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(170, 0, 0, 0),
                            Color.fromARGB(120, 0, 0, 0),
                            Color.fromARGB(72, 0, 0, 0),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      child: Text(
                        catcomida.strCategoryTranslated ??
                            catcomida.strCategory,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
    }).toList();

    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        items: imageSliders,
      ),
    );
  }

/**Carrusel Regiones--------------------------------------------------- */
  static Container regiones(List<Regionescomidas> regcomidas) {
    final List<Widget> imagenslider = regcomidas.map((regcomidas) {
      String traducirRegion =
          regionTranslations[regcomidas.nameRegion] ?? regcomidas.nameRegion;
      return Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Listascomidasregiones(
                        regiones: regcomidas.nameRegion)));
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage('assets/maderas.jpg'),
                    fit: BoxFit.cover)),
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: [
                  Image.asset(
                    regcomidas.image,
                    fit: BoxFit.scaleDown,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(170, 0, 0, 0),
                            Color.fromARGB(120, 0, 0, 0),
                            Color.fromARGB(72, 0, 0, 0),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(29),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      child: Text(
                        traducirRegion,
                        style: const TextStyle(
                          color: const Color.fromARGB(255, 255, 229, 204),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
    }).toList();
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        items: imagenslider,
      ),
    );
  }
}

Map<String, String> regionTranslations = {
  "American": "Estadounidense",
  "British": "Británica",
  "Canadian": "Canadiense",
  "Chinese": "China",
  "Croatian": "Croata",
  "Dutch": "Holandesa",
  "Egyptian": "Egipcia",
  "Filipino": "Filipina",
  "French": "Francesa",
  "Greek": "Griega",
  "Indian": "India",
  "Irish": "Irlandesa",
  "Italian": "Italiana",
  "Jamaican": "Jamaicana",
  "Japanese": "Japonesa",
  "Kenyan": "Keniata",
  "Malaysian": "Malasia",
  "Mexican": "Mexicana",
  "Moroccan": "Marroquí",
  "Polish": "Polaca",
  "Portuguese": "Portuguesa",
  "Russian": "Rusa",
  "Spanish": "Española",
  "Thai": "Tailandesa",
  "Tunisian": "Tunecina",
  "Turkish": "Turca",
  "Ukrainian": "Ucraniana",
  "Unknown": "Desconocida",
  "Vietnamese": "Vietnamita",
};
