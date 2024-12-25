import 'package:comidasapis/enlaces.dart';

Widget builderBebidas(context, snapshot) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return Center(child: CircularProgressIndicator());
  } else if (snapshot.hasError) {
    return Center(child: Text('Error: ${snapshot.error}'));
  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
    return Center(child: Text('No hay comidas disponibles'));
  } else {
    final bebidas = snapshot.data ?? [];
    return ListView.builder(
      itemCount: bebidas.length,
      itemBuilder: (context, index) {
        final bebida = bebidas[index];
        return Listbebidas(bebidas: bebida);
      },
    );
  }
}
