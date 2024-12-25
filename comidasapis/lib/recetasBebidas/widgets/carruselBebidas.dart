import 'package:comidasapis/enlaces.dart';
import 'package:comidasapis/recetasBebidas/pages/listaBebidasCategorias.dart';

class Carruselesbebidas {
  static Container categoriasBebidas(List<Categoriabebidasmodel> catBebidas) {
    final List<Widget> imagenslider = catBebidas.map((catBebidas) {
      String? traducirCategorias =
          categoryTranslations[catBebidas.strCategory] ??
              catBebidas.strCategory;
      return Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Listabebidascategorias(
                        categoriaBebidas: catBebidas.strCategory!)));
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
                    catBebidas.image!,
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
                        traducirCategorias!,
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

  /**tipo de bebida */
  static Container tipoBebida(List<Tipobebidamodel> tipoBebida) {
    final List<Widget> imagenslider = tipoBebida.map((tipoBebida) {
      String? traducirTipos =
          tipoBebidaTranslations[tipoBebida.nameTipo] ?? tipoBebida.nameTipo;
      return Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Listtipbebidas(tiposBebidas: tipoBebida.nameTipo)));
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
                    tipoBebida.image,
                    fit: BoxFit.scaleDown,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      //color: const Color.fromARGB(20, 0, 0, 0).withOpacity(0.3),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(170, 0, 0, 0),
                            Color.fromARGB(120, 0, 0, 0),
                            Color.fromARGB(72, 0, 0, 0),
                          ],
                          begin: Alignment.center,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(90),
                      ),
                      //padding: const EdgeInsets.all(5),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      child: Text(
                        traducirTipos,
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

Map<String, String> categoryTranslations = {
  "Cocktail": "Cóctel",
  "Ordinary Drink": "Bebida Ordinaria",
  "Punch / Party Drink": "Ponche / Bebida de Fiesta",
  "Shake": "Batido",
  "Other / Unknown": "Otros / Desconocido",
  "Cocoa": "Cacao",
  "Shot": "Trago",
  "Coffee / Tea": "Café / Té",
  "Homemade Liqueur": "Licor Casero",
  "Beer": "Cerveza",
  "Soft Drink": "Refresco",
};
Map<String, String> tipoBebidaTranslations = {
  "Alcoholic": "Alcohólica",
  "Non alcoholic": "No alcohólica",
  "Optional alcohol": "Opcional con alcohol",
};
