import 'package:comidasapis/enlaces.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

/** */
class _InicioState extends State<Inicio> {
  late Future<List<Catcomidas>> futureCatcomidas;
  late Future<ComidasModels> futureComida;
  TextEditingController _BuscarController = TextEditingController();
  final translator = GoogleTranslator();
  @override
  void initState() {
    super.initState();
    futureCatcomidas = Catmealservice().listCatComidas();
    futureComida = Comidaservice().buscarComidaPorNombre('Lasagne');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('inicio'),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Plato del Dia',
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Color.fromARGB(255, 80, 60, 45),
                            fontSize: MediaQuery.of(context).size.width * 0.07,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              FutureBuilder<ComidasModels>(
                future: futureComida,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error:${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return Widgetplatodia(comida: snapshot.data!);
                  } else {
                    return Text('No Data');
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Categorias',
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Color.fromARGB(255, 80, 60, 45),
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.07,
                              fontWeight: FontWeight.bold)),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder<List<Catcomidas>>(
                future: futureCatcomidas,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final catcomidas = snapshot.data ?? [];
                    return Carruseles.carrusel(catcomidas);
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Regiones',
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Color.fromARGB(255, 80, 60, 45),
                            fontSize: MediaQuery.of(context).size.width * 0.07,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Carruseles.regiones(carruselRegiones),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Menu(),
    );
  }

  @override
  void dispose() {
    _BuscarController.dispose();
    super.dispose();
  }
}
