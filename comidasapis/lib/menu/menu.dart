import 'dart:io';

import 'package:comidasapis/enlaces.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      backgroundColor: Color.fromARGB(255, 106, 78, 57),
      overlayColor: const Color.fromARGB(255, 186, 186, 186),
      overlayOpacity: 0.0,
      children: [
        SpeedDialChild(
            child: Icon(
              Icons.exit_to_app,
              color: Color.fromARGB(255, 106, 78, 57),
            ),
            backgroundColor: const Color.fromARGB(255, 220, 182, 147),
            label: 'salir',
            labelStyle: TextStyle(
              color: Color.fromARGB(255, 106, 78, 57),
            ),
            onTap: () {
              exit(0);
            }),
        SpeedDialChild(
            child: Icon(
              Icons.emoji_food_beverage_rounded,
              color: Color.fromARGB(255, 106, 78, 57),
            ),
            label: 'Bebidas',
            backgroundColor: const Color.fromARGB(255, 220, 182, 147),
            labelStyle: TextStyle(
              color: Color.fromARGB(255, 106, 78, 57),
            ),
            onTap: () {
              Navigator.pushNamed(context, 'inicioBebidas');
            }),
        SpeedDialChild(
            child: Icon(
              Icons.fastfood_outlined,
              color: Color.fromARGB(255, 106, 78, 57),
            ),
            label: 'Comidas',
            backgroundColor: const Color.fromARGB(255, 220, 182, 147),
            labelStyle: TextStyle(
              color: Color.fromARGB(255, 106, 78, 57),
            ),
            onTap: () {
              Navigator.pushNamed(context, 'inicio');
            }),
      ],
    );
  }
}
