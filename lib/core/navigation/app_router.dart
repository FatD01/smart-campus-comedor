import 'package:flutter_application_1/core/navigation/app_routes.dart';
import 'package:flutter_application_1/features/auth/views/login_view.dart';
import 'package:flutter_application_1/features/checkout/views/shop_e_ticket.dart';
import 'package:flutter_application_1/features/food/views/posts_view.dart';
import 'package:flutter_application_1/features/tickets/views/history_tickets_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.posts,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.loginName,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.posts,
        name: AppRoutes.postsName,
        builder: (context, state) => const PostsScreen(),
      ),
      GoRoute(
        path: AppRoutes.ticket,
        name: AppRoutes.ticketName,
        builder: (context, state) => const ShopETicket(),
      ),
      GoRoute(
        path: AppRoutes.history,
        name: AppRoutes.historyName,
        builder: (context, state) => const HistoryTicketScreen(),
      )
    ],
  );
}
