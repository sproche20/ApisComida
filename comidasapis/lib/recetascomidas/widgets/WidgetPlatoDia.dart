import 'package:comidasapis/enlaces.dart';

class Widgetplatodia extends StatelessWidget {
  final ComidasModels comida;
  const Widgetplatodia({super.key, required this.comida});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return FractionallySizedBox(
      widthFactor: 0.9, // Ocupa el 100% del ancho disponible
      alignment: Alignment.center, // Centra el contenedor horizontalmente
      child: Container(
        height: screenSize.height * 0.23,
        // 30% de la altura de la pantalla
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 106, 78, 57), // Color del borde
            width: 4, // Ancho del borde
          ),
          borderRadius: BorderRadius.circular(29), // Radio de los bordes
        ),
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(29), // Mismo radio que en BoxDecoration
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: InkWell(
                  onTap: () async {
                    var comidaCompleta = await Comidaservice()
                        .buscarComidaPorNombre(comida.strComida);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Mostrarcomidas(listComidas: comidaCompleta)));
                  },
                  child: Image.network(
                    comida.strMealThumb,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  bottom: 5,
                  left: 5,
                  right: 5,
                  child: Container(
                    color: const Color.fromARGB(20, 0, 0, 0).withOpacity(0.3),
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      comida.strTranslatedstrComida ?? comida.strComida,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: const Color.fromARGB(255, 255, 229, 204),
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.057,
                              fontWeight: FontWeight.bold)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
