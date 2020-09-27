import 'package:flutter/material.dart';
import 'package:listar_tarea_dah_lopezsanchez_lopezbaez/src/providers/tareas_provider.dart';
import 'package:listar_tarea_dah_lopezsanchez_lopezbaez/src/pages/formulario.dart';

class ListadoPage extends StatelessWidget {
  const ListadoPage({Key key}) : super(key: key);

  static final nombrePagina = "listado";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de Tareas'),
      ),
      body: (TareasProvider().tareas.isEmpty)
          ? Center(
              child: Text("No hay tareas agregadas"),
            )
          : ListView(children: _crearItem()),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            // Navigator.pushNamed(context, FormularioPage.nombrePagina),
            Navigator.popAndPushNamed(context, FormularioPage.nombrePagina),
        child: Icon(Icons.add),
      ),
    );
  }

  List<Widget> _crearItem() {
    List<Widget> temporal = [];

    for (Map<String, dynamic> tarea in TareasProvider().tareas) {
      Widget item = ListTile(
        title: Text("${tarea['nombre']}\n     ${tarea['descripcion']}"),
        trailing:
            (tarea['estado']) ? Icon(Icons.star) : Icon(Icons.star_border), //if
      );
      temporal.add(item);
    }
    return temporal;
  }
}
