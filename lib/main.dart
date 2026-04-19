
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/navigation/app_router.dart';
import 'package:flutter_application_1/core/theme/theme.dart';
import 'package:flutter_application_1/features/auth/view_models/login_view_model.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: 'https://txuztmhbgqexpecxdptx.supabase.co', anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR4dXp0bWhiZ3FleHBlY3hkcHR4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzY1NzY2NTUsImV4cCI6MjA5MjE1MjY1NX0.ZdRDwWiL2DPe1KX_fWO3aX93Sa-x39BYfrENWt0dpwI");
  runApp(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (_)=> LoginViewModel())], 
        child: const MyApp())
    );
}


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
