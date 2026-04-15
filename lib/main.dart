
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/navigation/app_router.dart';
import 'package:flutter_application_1/core/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // usamos el texTheme por defecto de flutter como base
    final themeFactory = AppTheme();

    return MaterialApp.router(
      routerConfig: AppRouter.router,
      title: 'Comedor Tecsup',
      debugShowCheckedModeBanner: false,
      // --------------------------------
      // Asignamos los temas usando los métodos de la clase
      theme: themeFactory.light(context),
      darkTheme: themeFactory.dark(context),
      themeMode: ThemeMode.system,
    );
  }
}
