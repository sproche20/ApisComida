import 'package:comidasapis/enlaces.dart';

class Iniciobebidas extends StatefulWidget {
  const Iniciobebidas({super.key});

  @override
  State<Iniciobebidas> createState() => _IniciobebidasState();
}

class _IniciobebidasState extends State<Iniciobebidas> {
  late Future<Bebidasmodels> futureBebidas;
  final translator = GoogleTranslator();
  @override
  void initState() {
    super.initState();
    futureBebidas = Bebidaservice().buscarBebidaPorNombre('Frappé');
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
                    'Bebida del Dia',
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
              FutureBuilder<Bebidasmodels>(
                future: futureBebidas,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error:${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return Widgetbebidadia(bebida: snapshot.data!);
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
                height: 10,
              ),
              Carruselesbebidas.categoriasBebidas(carruselCatBebidas),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Tipo de Bebida',
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
              Carruselesbebidas.tipoBebida(carruselTipos)
            ],
          ),
        ),
      ),
      floatingActionButton: Menu(),
    );
  }
}
