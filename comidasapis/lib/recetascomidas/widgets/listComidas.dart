import 'package:comidasapis/enlaces.dart';

class Listcomidas extends StatelessWidget {
  final Modelolistacomidas comida;
  const Listcomidas({super.key, required this.comida});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
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
                          builder: (context) => Mostrarcomidas(
                                listComidas: comidaCompleta,
                              )));
                },
                child: Image.network(
                  comida.strMealThumb,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              )),
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
                        fontSize: MediaQuery.of(context).size.width * 0.057,
                        fontWeight: FontWeight.bold)),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
