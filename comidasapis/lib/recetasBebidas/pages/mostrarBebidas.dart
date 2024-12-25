import 'package:comidasapis/enlaces.dart';

class Mostrarbebidas extends StatelessWidget {
  final Bebidasmodels listBebidas;
  const Mostrarbebidas({super.key, required this.listBebidas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(listBebidas.strTranslatedstrDrink ?? listBebidas.strDrink),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                    placeholder: const AssetImage("assets/loading.gif"),
                    image: NetworkImage(listBebidas.strDrinkThumb),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text(
                          "Categoria: ",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.delius(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      SizedBox(
                        child: Text(
                          listBebidas.strTranslatedstrCategory ??
                              listBebidas.strCategory,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.delius(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text(
                          "Tipo de Bebida: ",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.delius(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      SizedBox(
                        child: Text(
                          listBebidas.strTranslatedstrAlcoholic ??
                              listBebidas.strAlcoholic,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.delius(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text(
                          "Tipo de Vaso: ",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.delius(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      SizedBox(
                        child: Text(
                          listBebidas.strTranslatedstrGlass ??
                              listBebidas.strGlass,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.delius(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Instrucciones:',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.delius(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  )
                ],
              ),
            ),
            const SizedBox(),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    listBebidas.strInstructionsES,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.delius(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
