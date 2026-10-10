import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:renotes/models/proyecto.dart';

import '../state/app_state.dart';
import '../theme/app_theme.dart';

class Nuevoproyecto extends StatefulWidget {
  final AppState appState;
  final Proyecto? proyecto;

  const Nuevoproyecto({
    super.key,
    required this.proyecto,
    required this.appState
  });

  @override
  State<Nuevoproyecto> createState() => _NuevoProyectoState();
}

class _NuevoProyectoState extends State<Nuevoproyecto> {
  final nombreController = TextEditingController();
  final descripcionController = TextEditingController();

  bool get estaEditando => widget.proyecto != null;

  @override
  void initState() {
    super.initState();

    // Si estamos editando, cargamos los datos existentes.
    if (widget.proyecto != null) {
      nombreController.text = widget.proyecto!.nombre;
      descripcionController.text = widget.proyecto!.descripcion;
    }
  }

  @override
  void dispose() {
    nombreController.dispose();
    descripcionController.dispose();
    super.dispose();
  }

  void guardarProyecto() {
    final nombre = nombreController.text.trim();
    final descripcion = descripcionController.text.trim();

    if (nombre.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Escribe un nombre para el proyecto'),
        ),
      );
      return;
    }

    if (descripcion.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Escribe una breve descripcion para el proyecto'),
        ),
      );
      return;
    }

    final ahora = DateTime.now();

    if (estaEditando) {
      // Modificamos la nota existente.
      final nota = widget.proyecto!;

      nota.nombre = nombre;
      nota.descripcion = descripcion;
      nota.fechaModificacion = ahora;

      // Conservamos su ID, proyecto, fecha de creación
      // y etiquetas originales.
    } else {
      // Creamos una nota nueva.
      final nuevoProyecto = Proyecto(
        id: ahora.microsecondsSinceEpoch.toString(),
        nombre: nombre,
        descripcion: descripcion,
        fechaCreacion: ahora,
        fechaModificacion: ahora
      );

      widget.appState.proyectos.add(nuevoProyecto);
    }

    widget.appState.notifyListeners();

    context.pop();
}

    @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.fondo,
        appBar: AppBar(
          backgroundColor: AppTheme.fondo,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Crear nuevo proyecto",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppTheme.texto,
            ),
          ),
        ),

        body:SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.borde),
                  ),
                  child: TextField(
                    controller: nombreController,
                    textInputAction: TextInputAction.done,
                    style: const TextStyle(color: AppTheme.texto),
                    decoration: InputDecoration(
                      hintText: 'Ej. Inteligencia Artificial',
                      hintStyle: const TextStyle(
                        color: AppTheme.textoSecundario,
                      ),
                      filled: true,
                      fillColor: AppTheme.tarjeta,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: (_) {
                      guardarProyecto();
                    },
                  ),
                ),

                SizedBox(height: 15,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.borde),
                  ),
                  child: TextField(
                    minLines: 8,
                    maxLines: 15,
                    controller: descripcionController,
                    textInputAction: TextInputAction.done,
                    style: const TextStyle(color: AppTheme.texto),
                    decoration: InputDecoration(
                      hintText: 'Ej. Inteligencia Artificial..................asdkjashdaskhdas',
                      hintStyle: const TextStyle(
                        color: AppTheme.textoSecundario,
                      ),
                      filled: true,
                      fillColor: AppTheme.tarjeta,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: (_) {
                      guardarProyecto();
                    },
                  ),
                ),

                SizedBox(height: 50,),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: guardarProyecto,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.principal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(
                      estaEditando ? 'Guardar cambios' : 'Crear proyecto',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ) ,
        )
    );
  }
}
