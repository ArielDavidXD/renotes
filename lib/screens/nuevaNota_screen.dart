
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/nota.dart';
import '../state/app_state.dart';
import '../theme/app_theme.dart';

class NuevanotaScreen extends StatefulWidget {
    final AppState appState;
  final String idProyecto;
  final Nota? nota;

  const NuevanotaScreen({
    super.key,
    required this.appState,
    required this.idProyecto,
    this.nota,
  });

  @override
  State<NuevanotaScreen> createState() => _NuevanotaScreenState();
}

class _NuevanotaScreenState extends State<NuevanotaScreen> {
  final nombreController = TextEditingController();
  final descripcionController = TextEditingController();

  bool get estaEditando => widget.nota != null;

  @override
  void initState() {
    super.initState();

    // Si estamos editando, cargamos los datos existentes.
    if (widget.nota != null) {
      nombreController.text = widget.nota!.titulo;
      descripcionController.text = widget.nota!.descripcion;
    }
  }

  @override
  void dispose() {
    nombreController.dispose();
    descripcionController.dispose();
    super.dispose();
  }

  void guardarNota() {
    final nombre = nombreController.text.trim();
    final descripcion = descripcionController.text.trim();

    if (nombre.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Escribe un nombre para la nota'),
        ),
      );
      return;
    }

    if (descripcion.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Escribe una descripción para la nota'),
        ),
      );
      return;
    }

    final ahora = DateTime.now();

    if (estaEditando) {
      // Modificamos la nota existente.
      final nota = widget.nota!;

      nota.titulo = nombre;
      nota.descripcion = descripcion;
      nota.fecha_ult_mod = ahora;

      // Conservamos su ID, proyecto, fecha de creación
      // y etiquetas originales.
    } else {
      // Creamos una nota nueva.
      final nuevaNota = Nota(
        id_notas: ahora.microsecondsSinceEpoch.toString(),
        id_proyecto: widget.idProyecto,
        titulo: nombre,
        descripcion: descripcion,
        fecha_creacion: ahora,
        fecha_ult_mod: ahora,
        lista_etiquetas: [],
      );

      widget.appState.notas.add(nuevaNota);
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
          estaEditando ? 'Editar nota' : 'Crear nueva nota',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppTheme.texto,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
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
                  textInputAction: TextInputAction.next,
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
                ),
              ),

              const SizedBox(height: 15),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppTheme.borde),
                ),
                child: TextField(
                  controller: descripcionController,
                  minLines: 8,
                  maxLines: 15,
                  style: const TextStyle(color: AppTheme.texto),
                  decoration: InputDecoration(
                    hintText: 'Escribe la descripción de tu nota...',
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
                ),
              ),

              const SizedBox(height: 20),

              OutlinedButton(
                onPressed: () {
                  // La selección de etiquetas la conectaremos
                  // con AppState en el siguiente paso.
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.principal,
                  side: const BorderSide(color: AppTheme.principal),
                ),
                child: const Text('Seleccionar etiquetas'),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: guardarNota,
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
                    estaEditando ? 'Guardar cambios' : 'Crear nota',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
