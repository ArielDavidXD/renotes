import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/etiqueta.dart';
import '../state/app_state.dart';
import '../theme/app_theme.dart';

class NuevaEtiquetaScreen extends StatefulWidget {
  final AppState appState;
  final Etiqueta? etiqueta;

  const NuevaEtiquetaScreen({
    super.key,
    required this.appState,
    required this.etiqueta
});

  @override
  State<NuevaEtiquetaScreen> createState() => _NuevaEtiquetaScreenState();
}

class _NuevaEtiquetaScreenState extends State<NuevaEtiquetaScreen> {
  final nombreController = TextEditingController();
  bool get estaEditando => widget.etiqueta !=null;


  @override
  void initState() {
    super.initState();

    // Si estamos editando, cargamos los datos existentes.
    if (widget.etiqueta != null) {
      nombreController.text = widget.etiqueta!.nombre;
    }
  }

  @override
  void dispose() {
    nombreController.dispose();
    super.dispose();
  }

  void crearEtiqueta() {
    final nombre = nombreController.text.trim();

    if (nombre.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Escribe un nombre para la etiqueta'),
        ),
      );
      return;
    }

    final ahora = DateTime.now();

    if (estaEditando) {
      // Modificamos la nota existente.
      final etiqueta = widget.etiqueta!;

      etiqueta.nombre = nombre;


    } else {
      final nuevaEtiqueta = Etiqueta(
          id_etiqueta: ahora.microsecondsSinceEpoch.toString(),
          nombre: nombre,
        color: null
      );

      widget.appState.etiquetas.add(nuevaEtiqueta);
    }

    widget.appState.notifyListeners();
    // Aquí después agregaremos la etiqueta al AppState.

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
        title: const Text(
          'Nueva etiqueta',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppTheme.texto,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            const Text(
              'Crea una etiqueta para organizar tus notas.',
              style: TextStyle(
                  fontSize: 18,
                  color: AppTheme.textoSecundario
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Nombre',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppTheme.texto,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
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
                  borderSide: const BorderSide(color: AppTheme.borde),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: AppTheme.borde),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: AppTheme.principal),
                ),
              ),
              onSubmitted: (_) {
                crearEtiqueta();
              },
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: crearEtiqueta,
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
                child:  Text(
                  estaEditando ?
                  'Crear etiqueta' : "Renombrar etiqueta",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
