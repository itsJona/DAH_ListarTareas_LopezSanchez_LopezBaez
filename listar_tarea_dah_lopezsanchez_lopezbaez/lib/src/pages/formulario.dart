import 'package:flutter/material.dart';
import 'package:listar_tarea_dah_lopezsanchez_lopezbaez/src/providers/tareas_provider.dart';
import 'package:listar_tarea_dah_lopezsanchez_lopezbaez/src/pages/listado.dart';

class FormularioPage extends StatefulWidget {
  FormularioPage({Key key}) : super(key: key);

  static final nombrePagina = "formulario";

  @override
  FormularioPageState createState() => FormularioPageState();
}

class FormularioPageState extends State<FormularioPage> {
  final idForm = GlobalKey<FormState>();
  Map<String, dynamic> nuevaTarea = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
            key: idForm,
            child: Column(
              children: <Widget>[
                _crearInputNombre(),
                _crearInputDescripcion(),
                _crearBotonAgregar(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  _crearInputNombre() {
    return TextFormField(
      onSaved: (valor) {
        nuevaTarea['nombre'] = valor;
      },
      decoration: InputDecoration(hintText: "Nombre de la tarea"),
    );
  }

  _crearInputDescripcion() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: TextFormField(
        onSaved: (valor) {
          nuevaTarea['descripcion'] = valor;
        },
        maxLines: null,
        decoration: InputDecoration(hintText: "Descripción de la tarea"),
      ),
    );
  }

  _crearBotonAgregar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: RaisedButton(
        onPressed: () {
          idForm.currentState.save();
          nuevaTarea['estado'] = false;

          TareasProvider().agregarTarea(nuevaTarea);

          if (TareasProvider().tareas.isNotEmpty) {
            Navigator.popAndPushNamed(context, ListadoPage.nombrePagina);
          }
        },
        child: Text("Agregar Tarea"),
      ),
    );
  }
}
