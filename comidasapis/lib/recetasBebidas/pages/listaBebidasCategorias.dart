import 'package:comidasapis/enlaces.dart';
import 'package:comidasapis/recetasBebidas/widgets/builderBebidas.dart';

class Listabebidascategorias extends StatefulWidget {
  final String categoriaBebidas;
  const Listabebidascategorias({super.key, required this.categoriaBebidas});

  @override
  State<Listabebidascategorias> createState() => _ListabebidascategoriasState();
}

class _ListabebidascategoriasState extends State<Listabebidascategorias> {
  late Future<List<Bebidasmodels>> futureBebidas;
  String? translated;
  @override
  void initState() {
    super.initState();
    futureBebidas =
        Bebidaservice().listarBebidasPorCategoria(widget.categoriaBebidas);
    translateCategory(widget.categoriaBebidas);
  }

  Future<void> translateCategory(String categoriaBebidas) async {
    final translator = GoogleTranslator();
    var translation =
        await translator.translate(categoriaBebidas, from: 'en', to: 'es');
    setState(() {
      translated = translation.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(translated ?? widget.categoriaBebidas),
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
