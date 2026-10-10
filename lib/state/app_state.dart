import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../data/datos_prueba.dart';
import '../models/proyecto.dart';
import '../models/nota.dart';
import '../models/etiqueta.dart';

class AppState extends ChangeNotifier {
  List<Proyecto> proyectos = proyectosPrueba;
  List<Nota> notas = notasPrueba;
  List<Etiqueta> etiquetas = etiquetasPrueba;
}
AppState obtenerAppState(BuildContext context) {
  return context
      .dependOnInheritedWidgetOfExactType<InheritedNotifier<AppState>>()!
      .notifier!;
}
