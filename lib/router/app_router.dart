import 'package:renotes/screens/buscar_screen.dart';
import 'package:renotes/screens/detalles_notas.dart';
import 'package:renotes/screens/etiquetas_screen.dart';
import 'package:renotes/screens/notas_screen.dart';
import 'package:renotes/screens/nuevaEtiqueta_screen.dart';
import 'package:renotes/screens/nuevaNota_screen.dart';
import 'package:renotes/screens/nuevoProyecto.dart';
import 'package:renotes/screens/proyectos_screen.dart';
import 'package:renotes/state/app_state.dart';
import 'package:go_router/go_router.dart';

import '../widgets/main_shell.dart';

GoRouter crearRouter(AppState appState) {
  return GoRouter(
    initialLocation: '/proyectos',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/proyectos',
            builder: (context, state) {
              return ProyectosScreen(appState: appState);
            },
          ),

          GoRoute(
            path: '/notas/:idProyecto',
            builder: (context, state) {
              final idProyecto = state.pathParameters['idProyecto']!;

              return NotasScreen(
                appState: appState,
                idProyecto: idProyecto,
              );
            },
          ),

          GoRoute(
            path: '/detalles_notas/:idNota',
            builder: (context, state) {
              final idNota = state.pathParameters['idNota']!;
              return DetallesNotas(
                appState: appState,
                idNota: idNota,

              );
            },
          ),

          GoRoute(
            path: '/nuevaNota',
            builder: (context, state) {
              final idProyecto =
              state.uri.queryParameters['idProyecto']!;

              final idNota =
              state.uri.queryParameters['idNota'];

              final nota = idNota == null
                  ? null
                  : appState.notas.firstWhere(
                    (nota) => nota.id_notas == idNota,
              );

              return NuevanotaScreen(
                appState: appState,
                idProyecto: idProyecto,
                nota: nota,
              );
            },
          ),

          GoRoute(
            path: '/nuevoProyecto',
            builder: (context, state) {
              final idProyecto =
              state.uri.queryParameters['idProyecto'];
              final proyecto = idProyecto == null
                  ? null
                  : appState.proyectos.firstWhere(
                    (proyecto) => proyecto.id == idProyecto,
              );
              return Nuevoproyecto(
                appState: appState,
                proyecto: proyecto,
              );
            },
          ),

          GoRoute(
            path: '/etiquetas',
            builder: (context, state) {
              return  EtiquetasScreen(appState: appState);
            },
          ),

          GoRoute(
            path: '/nuevaEtiqueta',
            builder: (context, state) {
              final idEtiqueta =
              state.uri.queryParameters['idEtiqueta'];
              final etiqueta = idEtiqueta == null
                  ? null
                  : appState.etiquetas.firstWhere(
                    (etiqueta) => etiqueta.id_etiqueta == idEtiqueta,
              );
              return NuevaEtiquetaScreen(
                appState: appState,
                etiqueta: etiqueta,
              );
            },
          ),

          GoRoute(
            path: '/buscar',
            builder: (context, state) {
              return BuscarScreen(appState: appState);
            },
          ),
        ],
      ),
    ],
  );
}
