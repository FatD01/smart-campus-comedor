import 'dart:async';
import 'package:flutter/material.dart';

/// Puente entre un [Stream] y el [refreshListenable] de GoRouter.
///
/// GoRouter solo acepta [Listenable] (ej. ChangeNotifier) para saber
/// cuándo re-evaluar el [redirect]. Como Supabase expone los cambios
/// de sesión como un [Stream], esta clase escucha ese stream y llama
/// [notifyListeners] cada vez que emite un evento, disparando así
/// la lógica de redirección automáticamente.
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
