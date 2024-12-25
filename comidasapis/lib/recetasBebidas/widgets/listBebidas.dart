import 'package:comidasapis/enlaces.dart';
import 'package:comidasapis/recetasBebidas/pages/mostrarBebidas.dart';

class Listbebidas extends StatelessWidget {
  final Bebidasmodels bebidas;
  const Listbebidas({super.key, required this.bebidas});

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
                var bebidaCompleta = await Bebidaservice()
                    .buscarBebidaPorNombre(bebidas.strDrink);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Mostrarbebidas(listBebidas: bebidaCompleta)));
              },
              child: Image.network(
                bebidas.strDrinkThumb,
                width: double.infinity,
                height: 200,
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
                  bebidas.strTranslatedstrDrink ?? bebidas.strDrink,
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          color: const Color.fromARGB(255, 255, 229, 204),
                          fontSize: MediaQuery.of(context).size.width * 0.057,
                          fontWeight: FontWeight.bold)),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ))
        ],
      ),
    );
  }
}
