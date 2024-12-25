import 'package:comidasapis/enlaces.dart';

class Listtipbebidas extends StatefulWidget {
  final String tiposBebidas;
  const Listtipbebidas({super.key, required this.tiposBebidas});

  @override
  State<Listtipbebidas> createState() => _ListtipbebidasState();
}

class _ListtipbebidasState extends State<Listtipbebidas> {
  late Future<List<Bebidasmodels>> futureBebidas;
  String? translated;
  @override
  void initState() {
    super.initState();
    futureBebidas = Bebidaservice().listarBebidasPorTipo(widget.tiposBebidas);
    translateTipo(widget.tiposBebidas);
  }

  Future<void> translateTipo(String tiposBebidas) async {
    final translator = GoogleTranslator();
    var translation =
        await translator.translate(tiposBebidas, from: 'en', to: 'es');
    setState(() {
      translated = translation.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(translated ?? widget.tiposBebidas),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: FutureBuilder<List<Bebidasmodels>>(
          future: futureBebidas,
          builder: (context, snapshot) {
            return builderBebidas(context, snapshot);
          }),
    );
  }
}
