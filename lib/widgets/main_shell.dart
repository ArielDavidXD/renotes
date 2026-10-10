import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_theme.dart';

class MainShell extends StatelessWidget {
  final Widget child;

  const MainShell({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,

      bottomNavigationBar: BottomNavigationBar(currentIndex: _getCurrentIndex(context),
        backgroundColor: AppTheme.tarjeta,
        selectedItemColor: AppTheme.principal,
        unselectedItemColor: AppTheme.textoSecundario,
        type: BottomNavigationBarType.fixed,

        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/proyectos');
              break;

            case 1:
              context.go('/etiquetas');
              break;

            case 2:
              context.go('/buscar');
              break;

          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: "Proyectos",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Etiquetas",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Buscar",
          ),

        ],
      ),
    );
  }

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    if (location.startsWith('/etiquetas')) {
      return 1;
    }

    if (location.startsWith('/buscar')) {
      return 2;
    }


    return 0;
  }
}
