import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/etiqueta.dart';
import '../state/app_state.dart';
import '../theme/app_theme.dart';

class EtiquetasScreen extends StatefulWidget {
  final AppState appState;

  const EtiquetasScreen({
    super.key,
    required this.appState,
  });

  @override
  State<EtiquetasScreen> createState() => _EtiquetasScreenState();
}

class _EtiquetasScreenState extends State<EtiquetasScreen> {

  void renombrarEtiqueta(Etiqueta etiqueta) {
    context.push(
      '/nuevaEtiqueta'
          '?idEtiqueta=${etiqueta.id_etiqueta}'
    ).then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }


  void eliminarEtiqueta(Etiqueta etiqueta) {
    showDialog(
      context: context,
      builder: (contextoDialogo) {
        return AlertDialog(
          backgroundColor: AppTheme.tarjeta,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Eliminar etiqueta',
            style: TextStyle(
              color: AppTheme.texto,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            '¿Estás seguro de que deseas eliminar '
                '"${etiqueta.nombre}"?',
            style: const TextStyle(
              color: AppTheme.textoSecundario,
              height: 1.5,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(contextoDialogo).pop();
              },
              child: const Text(
                'Cancelar',
                style: TextStyle(color: AppTheme.textoSecundario),
              ),
            ),
            TextButton(
              onPressed: () {
                widget.appState.etiquetas.removeWhere(
                      (etiquetaActual) =>
                  etiquetaActual.id_etiqueta == etiqueta.id_etiqueta,
                );

                widget.appState.notifyListeners();

                Navigator.of(contextoDialogo).pop();

                setState(() {});

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                      'Etiqueta eliminada correctamente',
                    ),
                    backgroundColor: AppTheme.texto,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }

  Widget crearTarjetas(Etiqueta etiquetas) {
    final cantidadNotas = widget.appState.notas
        .where((nota) => nota.lista_etiquetas.contains(etiquetas.id_etiqueta))
        .length;

    return Card(
      color: AppTheme.tarjeta,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: AppTheme.borde),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(
              Icons.label_outline,
              color: AppTheme.principal,
            ),

            const SizedBox(width: 12),

             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  etiquetas.nombre,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.texto,
                  ),
                ),
                Text(
                  '${cantidadNotas} notas',
                  style: const TextStyle(
                    color: AppTheme.textoSecundario,
                  ),
                ),
              ],
            ),

            const Spacer(),

            PopupMenuButton<String>(
              color: AppTheme.tarjeta,
              icon: const Icon(
                Icons.more_vert,
                color: AppTheme.textoSecundario,
              ),
              onSelected: (opcion) {
                if (opcion == 'editar') {
                  renombrarEtiqueta(etiquetas);
                }

                if (opcion == 'eliminar') {
                  eliminarEtiqueta(etiquetas);
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'editar',
                  child: Text('Renombrar'),
                ),
                const PopupMenuItem(
                  value: 'eliminar',
                  child: Text(
                    'Eliminar',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = widget.appState;
    return Scaffold(
      backgroundColor: AppTheme.fondo,
      appBar: AppBar(
        backgroundColor: AppTheme.fondo,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Etiquetas",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppTheme.texto,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          itemBuilder: (context, index) {
            final etiquetas = appState.etiquetas[index];
            return crearTarjetas(etiquetas);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemCount: appState.etiquetas.length,
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push("/nuevaEtiqueta");
        },
        backgroundColor: AppTheme.principal,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
