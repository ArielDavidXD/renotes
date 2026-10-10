import 'package:flutter/material.dart';

import '../state/app_state.dart';
import '../theme/app_theme.dart';

class DetallesNotas extends StatefulWidget {
  final AppState appState;
  final String idNota;

  const DetallesNotas({
    super.key,
    required this.appState,
    required this.idNota,
  });

  @override
  State<DetallesNotas> createState() => _DetallesNotasState();
}

class _DetallesNotasState extends State<DetallesNotas> {
  @override
  Widget build(BuildContext context) {
    final appState = widget.appState;
    final nota = appState.notas.firstWhere(
          (nota) => nota.id_notas.toString() == widget.idNota,
    );

    return Scaffold(
      backgroundColor: AppTheme.fondo,
      appBar: AppBar(
        backgroundColor: AppTheme.fondo,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(
          nota.titulo,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppTheme.texto,
          ),
        ),
      ),

      body: SingleChildScrollView(
    child:
      Padding(
    padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          Text(
            "Descripcion",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppTheme.texto,
            ),
          ),

          SizedBox(height: 8,),
          Text(
            nota.descripcion,
            style: const TextStyle(
              color: AppTheme.textoSecundario,
            ),
          ),

          SizedBox(height: 30,),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: nota.lista_etiquetas.map((idEtiqueta) {
              final etiqueta = appState.etiquetas.firstWhere(
                    (etiqueta) => etiqueta.id_etiqueta == idEtiqueta,
              );

              return Chip(
                label: Text(etiqueta.nombre),
                backgroundColor: AppTheme.fondo,
                side: const BorderSide(color: AppTheme.borde),
              );
            }).toList(),
          ),
          SizedBox(height:20,),
          Text(
            nota.fecha_ult_mod.toString(),
            style: const TextStyle(
              color: AppTheme.textoSecundario,
            ),
          ),
        ],
      ),
      ),
      )
    );
  }
}
