import 'package:flutter/material.dart';
import 'package:renotes/router/app_router.dart';
import 'package:renotes/state/app_state.dart';

void main() {
  final appState = AppState();

  runApp(
    ReNotesApp(
      appState: appState,
    ),
  );
}

class ReNotesApp extends StatelessWidget {
  final AppState appState;

  const ReNotesApp({
    super.key,
    required this.appState,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "ReNotes",
      routerConfig: crearRouter(appState),
    );
  }
}