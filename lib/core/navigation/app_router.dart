import 'package:flutter_application_1/core/navigation/app_routes.dart';
import 'package:flutter_application_1/core/navigation/go_router_refresh_stream.dart';
import 'package:flutter_application_1/features/auth/views/login_view.dart';
import 'package:flutter_application_1/features/checkout/views/shop_e_ticket.dart';
import 'package:flutter_application_1/features/food/views/posts_view.dart';
import 'package:flutter_application_1/features/tickets/views/history_tickets_view.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppRouter {
  // Rutas que no requieren autenticación
  static const _publicRoutes = [AppRoutes.login];

  static final router = GoRouter(
    initialLocation: AppRoutes.login,
    debugLogDiagnostics: true,
    // Escucha el stream de sesión de Supabase para re-evaluar el redirect
    refreshListenable: GoRouterRefreshStream(
      Supabase.instance.client.auth.onAuthStateChange,
    ),
    redirect: (context, state) {
      final session = Supabase.instance.client.auth.currentSession;
      final isLoggedIn = session != null;
      final isPublicRoute = _publicRoutes.contains(state.matchedLocation);

      // Si está autenticado y está en una ruta pública (login) → ir a posts
      if (isLoggedIn && isPublicRoute) return AppRoutes.posts;

      // Si NO está autenticado y está en una ruta protegida → ir a login
      if (!isLoggedIn && !isPublicRoute) return AppRoutes.login;

      // De lo contrario, no redirigir
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.loginName,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.posts,
        name: AppRoutes.postsName,
        builder: (context, state) => const PostsView(),
      ),
      GoRoute(
        path: AppRoutes.ticket,
        name: AppRoutes.ticketName,
        builder: (context, state) => const ShopETicket(),
      ),
      GoRoute(
        path: AppRoutes.history,
        name: AppRoutes.historyName,
        builder: (context, state) => const HistoryTicketsView(),
      ),
    ],
  );
}
