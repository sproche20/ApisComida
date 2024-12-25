import 'package:comidasapis/enlaces.dart';

Widget builder(context, snapshot) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return Center(child: CircularProgressIndicator());
  } else if (snapshot.hasError) {
    return Center(child: Text('Error: ${snapshot.error}'));
  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
    return Center(child: Text('No hay comidas disponibles'));
  } else {
    final comidas = snapshot.data ?? [];
    return ListView.builder(
      itemCount: comidas.length,
      itemBuilder: (context, index) {
        final comida = comidas[index];
        return Listcomidas(comida: comida);
      },
    );
  }
}
