
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:renotes/models/proyecto.dart';
import 'package:renotes/state/app_state.dart';

class ProyectosScreen extends StatefulWidget {
  final AppState appState;

  const ProyectosScreen({
    super.key,
    required this.appState,
  });

  @override
  State<ProyectosScreen> createState() => _ProyectosScreenState();
}

class _ProyectosScreenState extends State<ProyectosScreen> {
  // Colores de ReNotes.
  static const Color azulPrincipal = Color(0xFF2563EB);
  static const Color fondo = Color(0xFFF5F7FB);
  static const Color textoPrincipal = Color(0xFF172033);
  static const Color textoSecundario = Color(0xFF64748B);
  static const Color borde = Color(0xFFE2E8F0);

  void editarProyecto(Proyecto proyecto) {
    context.push(
      '/nuevoProyecto?idProyecto=${proyecto.id}',
    ).then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  void eliminarProyecto(Proyecto proyecto) {
    showDialog(
      context: context,
      builder: (contextoDialogo) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Eliminar proyecto',
            style: TextStyle(
              color: textoPrincipal,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            '¿Estás seguro de que deseas eliminar '
                '"${proyecto.nombre}"?',
            style: const TextStyle(
              color: textoSecundario,
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
                style: TextStyle(color: textoSecundario),
              ),
            ),
            TextButton(
              onPressed: () {
                widget.appState.proyectos.removeWhere(
                      (proyectoActual) =>
                  proyectoActual.id == proyecto.id,
                );

                widget.appState.notifyListeners();

                Navigator.of(contextoDialogo).pop();

                setState(() {});

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                      'Proyecto eliminado correctamente',
                    ),
                    backgroundColor: textoPrincipal,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              },
              child: const Text(
                'Eliminar',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget crearTarjeta(Proyecto proyecto) {
    final cantidadNotas = widget.appState.notas
        .where((nota) => nota.id_proyecto == proyecto.id)
        .length;

    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: borde),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          context.push('/notas/${proyecto.id}');
        },
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icono del proyecto.
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF1FF),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.folder_open_rounded,
                  color: azulPrincipal,
                  size: 25,
                ),
              ),

              const SizedBox(width: 14),

              // Información del proyecto.
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      proyecto.nombre,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: textoPrincipal,
                      ),
                    ),

                    const SizedBox(height: 7),

                    Text(
                      proyecto.descripcion,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: textoSecundario,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Icon(
                          Icons.sticky_note_2_outlined,
                          size: 16,
                          color: azulPrincipal,
                        ),
                        Text(
                          '$cantidadNotas notas',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: azulPrincipal,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.edit_calendar_outlined,
                          size: 15,
                          color: textoSecundario,
                        ),
                        Text(
                          'Modificado: '
                              '${proyecto.fechaModificacion.day}/'
                              '${proyecto.fechaModificacion.month}/'
                              '${proyecto.fechaModificacion.year}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: textoSecundario,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Menú de opciones.
              PopupMenuButton<String>(
                tooltip: 'Opciones del proyecto',
                icon: const Icon(
                  Icons.more_vert,
                  color: textoSecundario,
                ),
                color: Colors.white,
                onSelected: (opcion) {
                  if (opcion == 'editar') {
                    editarProyecto(proyecto);
                  }

                  if (opcion == 'eliminar') {
                    eliminarProyecto(proyecto);
                  }
                },
                itemBuilder: (context) => const [
                  PopupMenuItem(
                    value: 'editar',
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit_outlined,
                          color: textoPrincipal,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text('Editar'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'eliminar',
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Eliminar',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
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
    final proyectos = widget.appState.proyectos;

    return Scaffold(
      backgroundColor: fondo,

      appBar: AppBar(
        backgroundColor: fondo,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Mis proyectos',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: textoPrincipal,
          ),
        ),
      ),

      body: proyectos.isEmpty
          ? Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF1FF),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(
                  Icons.folder_open_rounded,
                  size: 38,
                  color: azulPrincipal,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Todavía no tienes proyectos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textoPrincipal,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Crea un proyecto para organizar tus notas '
                    'de investigación.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: textoSecundario,
                ),
              ),
            ],
          ),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 90),
        itemCount: proyectos.length,
        itemBuilder: (context, index) {
          return crearTarjeta(proyectos[index]);
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push('/nuevoProyecto').then((_) {
            if (mounted) {
              setState(() {});
            }
          });
        },
        backgroundColor: azulPrincipal,
        foregroundColor: Colors.white,
        elevation: 3,
        icon: const Icon(Icons.add),
        label: const Text(
          'Nuevo proyecto',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}