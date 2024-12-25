import 'package:comidasapis/enlaces.dart';

class Listascomidas extends StatefulWidget {
  final String? categoria;

  const Listascomidas({
    super.key,
    this.categoria,
  });

  @override
  State<Listascomidas> createState() => _ListascomidasState();
}

class _ListascomidasState extends State<Listascomidas> {
  late Future<List<Modelolistacomidas>> futureComidas;
  late Future<List<Modelolistacomidas>> futureRegiones;
  String? translated;
  @override
  void initState() {
    super.initState();
    futureComidas =
        Comidaservice().listarComidasPorCategoria(widget.categoria!);
    translateCategory(widget.categoria!);
  }

  Future<void> translateCategory(String categoria) async {
    final translator = GoogleTranslator();
    var translation =
        await translator.translate(categoria, from: 'en', to: 'es');
    setState(() {
      translated = translation.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(translated ?? widget.categoria!),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: FutureBuilder<List<Modelolistacomidas>>(
        future: futureComidas,
        builder: (context, snapshot) {
          return builder(context, snapshot);
        },
      ),
    );
  }
}
