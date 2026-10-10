import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../state/app_state.dart';
import '../theme/app_theme.dart';

class BuscarScreen extends StatefulWidget {
  final AppState appState;

  const BuscarScreen({
    super.key,
    required this.appState,
  });

  @override
  State<BuscarScreen> createState() => _BuscarScreenState();
}

class _BuscarScreenState extends State<BuscarScreen> {
  String textoBusqueda = "";

  @override
  Widget build(BuildContext context) {
    final appState = widget.appState;

    final proyectos = appState.proyectos.where((proyecto) {
      return proyecto.nombre
          .toLowerCase()
          .contains(textoBusqueda.toLowerCase());
    }).toList();

    final notas = appState.notas.where((nota) {
      return nota.titulo
          .toLowerCase()
          .contains(textoBusqueda.toLowerCase()) ||
          nota.descripcion
              .toLowerCase()
              .contains(textoBusqueda.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: AppTheme.fondo,
      appBar: AppBar(
        backgroundColor: AppTheme.fondo,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Buscar",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppTheme.texto,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            // CAMPO DE BÚSQUEDA
            TextField(
              style: const TextStyle(color: AppTheme.texto),
              decoration: InputDecoration(
                hintText: "Buscar...",
                hintStyle: const TextStyle(color: AppTheme.textoSecundario),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppTheme.textoSecundario,
                ),
                filled: true,
                fillColor: AppTheme.tarjeta,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: AppTheme.borde),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: AppTheme.borde),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: AppTheme.principal),
                ),
              ),

              onChanged: (texto) {
                setState(() {
                  textoBusqueda = texto;
                });
              },
            ),

            const SizedBox(height: 20),

            // RESULTADOS
            Expanded(
              child: ListView(
                children: [

                  // PROYECTOS
                  //los 3 puntos es un spread operator, nos permite insertar varios widgets dentro de children
                  if (proyectos.isNotEmpty) ...[
                    const Text(
                      "Proyectos",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.texto,
                      ),
                    ),

                    const SizedBox(height: 10),

                    ...proyectos.map(
                          (proyecto) {
                        return Card(
                          color: AppTheme.tarjeta,
                          surfaceTintColor: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: const BorderSide(color: AppTheme.borde),
                          ),
                          child: ListTile(
                            leading: const Icon(
                              Icons.folder_outlined,
                              color: AppTheme.principal,
                            ),

                            title: Text(
                              proyecto.nombre,
                              style: const TextStyle(
                                color: AppTheme.texto,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            subtitle: Text(
                              proyecto.descripcion,
                              style: const TextStyle(
                                color: AppTheme.textoSecundario,
                              ),
                            ),

                            onTap: () {
                              context.push(
                                '/notas/${proyecto.id}',
                              );
                            },
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 20),
                  ],

                  // NOTAS
                  if (notas.isNotEmpty) ...[
                    const Text(
                      "Notas",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.texto,
                      ),
                    ),

                    const SizedBox(height: 10),

                    ...notas.map(
                          (nota) {
                        return Card(
                          color: AppTheme.tarjeta,
                          surfaceTintColor: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: const BorderSide(color: AppTheme.borde),
                          ),
                          child: ListTile(
                            leading: const Icon(
                              Icons.note_outlined,
                              color: AppTheme.principal,
                            ),

                            title: Text(
                              nota.titulo,
                              style: const TextStyle(
                                color: AppTheme.texto,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            subtitle: Text(
                              nota.descripcion,
                              style: const TextStyle(
                                color: AppTheme.textoSecundario,
                              ),
                            ),

                            onTap: () {
                              context.push(
                                '/detalles_notas/${nota.id_notas}',
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],

                  // SIN RESULTADOS
                  if (textoBusqueda.isNotEmpty &&
                      proyectos.isEmpty &&
                      notas.isEmpty)
                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Center(
                        child: Text(
                          "No se encontraron resultados",
                          style: TextStyle(
                            color: AppTheme.textoSecundario,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
