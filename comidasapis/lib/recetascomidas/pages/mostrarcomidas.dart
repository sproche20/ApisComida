import 'package:comidasapis/enlaces.dart';

class Mostrarcomidas extends StatelessWidget {
  final ComidasModels listComidas;

  const Mostrarcomidas({super.key, required this.listComidas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            Text(listComidas.strTranslatedstrComida ?? listComidas.strComida),
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
                  image: NetworkImage(listComidas.strMealThumb),
                  fit: BoxFit.cover,
                ),
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
                          listComidas.strTranslatedCategoria ??
                              listComidas.strCategoria,
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
                          "Area: ",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.delius(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      SizedBox(
                        child: Text(
                          listComidas.strTranslatedArea ?? listComidas.strArea,
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
                    listComidas.strTranslatedInstrucciones ??
                        listComidas.strInstrucciones,
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
