import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/core/navigation/app_routes.dart';

class HistoryTicketsView extends StatelessWidget {
  const HistoryTicketsView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Historial de tickets',
                style: TextStyle(
                  color: colors.onSurface,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Resumen Mensual',
                    style: TextStyle(
                      color: colors.onSurface,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ),
                  ),
                  Text(
                    'Ver todo',
                    style: TextStyle(
                      color: colors.primary,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _ticketItem(colors, '29 Mar, 2026', 'Almuerzo de Viernes'),
              const SizedBox(height: 16),
              _ticketItem(colors, '28 Mar, 2026', 'Almuerzo de Jueves'),
              const SizedBox(height: 16),
              _ticketItem(colors, '27 Mar, 2026', 'Almuerzo de Miércoles'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _tabBar(context, colors),
    );
  }

  Widget _ticketItem(ColorScheme colors, String date, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.outlineVariant, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: TextStyle(
                  color: colors.onSurfaceVariant,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(
                  color: colors.onSurface,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: colors.tertiaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.check_rounded,
              color: colors.onTertiaryContainer,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabBar(BuildContext context, ColorScheme colors) {
    return Container(
      padding: const EdgeInsets.fromLTRB(21, 12, 21, 21),
      child: Container(
        height: 62,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(36),
          border: Border.all(color: colors.outlineVariant, width: 1),
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => context.go(AppRoutes.posts),
                child: Center(
                  child: Icon(Icons.home_rounded, color: colors.outline),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => context.go(AppRoutes.ticket),
                child: Center(
                  child: Icon(Icons.confirmation_number_outlined, color: colors.outline),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => context.go(AppRoutes.history),
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: Center(
                    child: Icon(Icons.history_rounded, color: colors.onPrimary),
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