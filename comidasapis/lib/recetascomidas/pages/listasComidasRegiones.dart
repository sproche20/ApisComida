import 'package:comidasapis/enlaces.dart';

class Listascomidasregiones extends StatefulWidget {
  final String? regiones;
  const Listascomidasregiones({super.key, this.regiones});

  @override
  State<Listascomidasregiones> createState() => _ListascomidasregionesState();
}

class _ListascomidasregionesState extends State<Listascomidasregiones> {
  late Future<List<Modelolistacomidas>> futureRegiones;
  String? translated;
  @override
  void initState() {
    super.initState();
    futureRegiones = Comidaservice().listarComidasPorRegion(widget.regiones!);
    translateRegiones(widget.regiones!);
  }

  Future<void> translateRegiones(String regiones) async {
    final translator = GoogleTranslator();
    var translation =
        await translator.translate(regiones, from: 'en', to: 'es');
    setState(() {
      translated = translation.text;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(translated ?? widget.regiones!),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: FutureBuilder<List<Modelolistacomidas>>(
          future: futureRegiones,
          builder: (context, snapshot) {
            return builder(context, snapshot);
          }),
    );
  }
}
