import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/nota.dart';
import '../state/app_state.dart';
import '../theme/app_theme.dart';

class NotasScreen extends StatefulWidget {
  final AppState appState;
  final String idProyecto;

  const NotasScreen({
    super.key,
    required this.appState,
    required this.idProyecto
  });

  @override
  State<NotasScreen> createState() => _NotasScreenState();
}

class _NotasScreenState extends State<NotasScreen> {
  void editarNota(Nota nota) {
    context.push(
      '/nuevaNota'
          '?idProyecto=${widget.idProyecto}'
          '&idNota=${nota.id_notas}',
    ).then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }


  void eliminarNota(Nota nota) {
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
            'Eliminar nota',
            style: TextStyle(
              color: AppTheme.texto,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            '¿Estás seguro de que deseas eliminar '
                '"${nota.titulo}"?',
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
                widget.appState.notas.removeWhere(
                      (notaActual) =>
                  notaActual.id_notas == nota.id_notas,
                );

                widget.appState.notifyListeners();

                Navigator.of(contextoDialogo).pop();

                setState(() {});

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                      'Nota eliminada correctamente',
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

  Widget crearNotas(Nota nota) {
    final appState = widget.appState;

    return Card(
      color: AppTheme.tarjeta,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: AppTheme.borde),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          context.push('/detalles_notas/${nota.id_notas}');
        },
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      "${nota.titulo}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.texto,
                      ),
                    ),

                    const SizedBox(height: 10),

                     Text(
                      "${nota.descripcion}",
                      style: const TextStyle(
                        color: AppTheme.textoSecundario,
                      ),
                    ),
                    const SizedBox(height: 15,),
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
                    const SizedBox(height: 20,),
                    Text(
                      nota.fecha_ult_mod.toString(),
                      style: const TextStyle(
                        color: AppTheme.textoSecundario,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 15),

              PopupMenuButton<String>(
                color: AppTheme.tarjeta,
                icon: const Icon(
                  Icons.more_vert,
                  color: AppTheme.textoSecundario,
                ),
                onSelected: (opcion) {
                  if (opcion == 'editar') {
                    editarNota(nota);
                  }

                  if (opcion == 'eliminar') {
                    eliminarNota(nota);
                  }
                },

                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'editar',
                    child: Text('Editar'),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = widget.appState;
    final proyecto = appState.proyectos.firstWhere(
          (proyecto) => proyecto.id.toString() == widget.idProyecto,
    );
    final notasProyecto = appState.notas.where(
    (notas) => notas.id_proyecto.toString() == widget.idProyecto).toList();

    return Scaffold(
      backgroundColor: AppTheme.fondo,
      appBar: AppBar(
        backgroundColor: AppTheme.fondo,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.texto),
          onPressed: () {
            context.pop();
          },
        ),

        title: Text(
          "${proyecto.nombre}",
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppTheme.texto,
          ),
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return crearNotas(notasProyecto[index]);
        },
        itemCount: notasProyecto.length,
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(
            '/nuevaNota?idProyecto=${widget.idProyecto}',
          ).then((_) {
            if (mounted) {
              setState(() {});
            }
          });
        },
        backgroundColor: AppTheme.principal,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
