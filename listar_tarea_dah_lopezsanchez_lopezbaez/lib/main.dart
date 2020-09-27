import 'package:flutter/material.dart';
import 'package:listar_tarea_dah_lopezsanchez_lopezbaez/src/pages/listado.dart';
import 'package:listar_tarea_dah_lopezsanchez_lopezbaez/src/pages/formulario.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tareas',
      initialRoute: ListadoPage.nombrePagina,
      routes: {
        ListadoPage.nombrePagina: (BuildContext context) => ListadoPage(),
        FormularioPage.nombrePagina: (BuildContext context) => FormularioPage(),
      },
    );
  }
}
