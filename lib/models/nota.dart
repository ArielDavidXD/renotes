class Nota {
  String id_notas;
  String id_proyecto;
  String titulo;
  String descripcion;
  DateTime fecha_creacion;
  DateTime fecha_ult_mod;
  List<String> lista_etiquetas;

  Nota({
    required this.id_notas,
    required this.id_proyecto,
    required this.titulo,
    required this.descripcion,
    required this.fecha_creacion,
    required this.fecha_ult_mod,
    required this.lista_etiquetas,
  });
}