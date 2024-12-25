import 'package:comidasapis/enlaces.dart';
import 'package:comidasapis/menu/menu.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'inicio',
      routes: {
        'inicio': (context) => Inicio(),
        'inicioBebidas': (context) => Iniciobebidas(),
        '/': (context) => Menu()
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
            backgroundColor: Color.fromARGB(255, 106, 78, 57),
            titleTextStyle: GoogleFonts.delius(
                textStyle: TextStyle(
                    color: const Color.fromARGB(255, 255, 229, 204),
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    fontWeight: FontWeight.bold))),
        scaffoldBackgroundColor: const Color.fromARGB(255, 220, 182, 147),
      ),
    );
  }
}
