import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/core/navigation/app_routes.dart';

class PostsView extends StatefulWidget {
  const PostsView({super.key});

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  String seleccion = "Pollo al Curry";

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topRow(colors),
              const SizedBox(height: 24),
              _titleRow(colors),
              const SizedBox(height: 24),
              _menuCard(colors),
              const SizedBox(height: 32),
              _votingSection(colors),
              const SizedBox(height: 24),
              _submitButton(colors),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _tabBar(colors),
    );
  }

  Widget _topRow(ColorScheme colors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Hola, Walter 👋',
          style: TextStyle(
            color: colors.onSurfaceVariant,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: colors.outlineVariant, width: 1),
          ),
          child: Center(
            child: Icon(
              Icons.logout_rounded,
              color: colors.onSurface,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _titleRow(ColorScheme colors) {
    // Para insignias de estado (como el badge 12 disp.), solemos usar tertiaryContainer
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '¿Qué almorzamos?',
          style: TextStyle(
            color: colors.onSurface,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontFamily: 'Inter',
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: colors.tertiaryContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(
                Icons.confirmation_number_rounded,
                color: colors.onTertiaryContainer,
                size: 14,
              ),
              const SizedBox(width: 4),
              Text(
                '12 disp.',
                style: TextStyle(
                  color: colors.onTertiaryContainer,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _menuCard(ColorScheme colors) {
    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.outlineVariant, width: 1),
      ),
      child: Column(
        children: [
          // Espacio para la imagen principal de la tarjeta
          Container(
            height: 100,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/generated-1774925077667.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.restaurant_rounded,
                      color: colors.primary,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Menú Ejecutivo de Hoy',
                      style: TextStyle(
                        color: colors.onSurface,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  height: 1,
                  color: colors.outlineVariant.withOpacity(0.5),
                ),
                const SizedBox(height: 16),
                _menuItem(
                  colors,
                  'ENTRADA',
                  'Sopa de la casa',
                  false,
                  'images/generated-1774930160038.png',
                ),
                _menuItem(
                  colors,
                  'ENTRADA',
                  'Ensalada Caprese con pesto',
                  false,
                  'images/generated-1774930180343.png',
                ),
                _menuItem(
                  colors,
                  'PRINCIPAL',
                  'Carne punto cabrito',
                  true,
                  'images/generated-1774930194871.png',
                ),
                _menuItem(
                  colors,
                  'PRINCIPAL',
                  'Lasaña especial de carne',
                  true,
                  'images/generated-1774930217072.png',
                ),
                _menuItem(
                  colors,
                  'POSTRE',
                  'Tarta de manzana casera',
                  false,
                  'images/generated-1774930232240.png',
                  isLast: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuItem(
    ColorScheme colors,
    String tipo,
    String nombre,
    bool highlighted,
    String imagePath, {
    bool isLast = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 16),
      child: Row(
        children: [
          // Espacio para la imagen redonda del ítem del menú
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(26),
              border: highlighted
                  ? Border.all(color: colors.primary, width: 2)
                  : null,
              boxShadow: highlighted
                  ? [
                      BoxShadow(
                        color: colors.primary.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tipo,
                  style: TextStyle(
                    color: colors.outline,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  nombre,
                  style: TextStyle(
                    color: colors.onSurface,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _votingSection(ColorScheme colors) {
    final options = [
      {
        'nom': 'Pollo al Curry',
        'porcentajeD': 0.45,
        'porcentajeS': '45%',
        'barColor': colors.primaryContainer,
      },
      {
        'nom': 'Lasaña de Carne',
        'porcentajeD': 0.25,
        'porcentajeS': '25%',
        'barColor': colors.outlineVariant,
      },
      {
        'nom': 'Pescado',
        'porcentajeD': 0.15,
        'porcentajeS': '15%',
        'barColor': colors.outlineVariant,
      },
      {
        'nom': 'Ensalada',
        'porcentajeD': 0.10,
        'porcentajeS': '10%',
        'barColor': colors.outlineVariant,
      },
      {
        'nom': 'Pasta',
        'porcentajeD': 0.05,
        'porcentajeS': '5%',
        'barColor': colors.outlineVariant,
      },
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Elige para mañana',
              style: TextStyle(
                color: colors.onSurface,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter',
              ),
            ),
            Text(
              '249 votos',
              style: TextStyle(
                color: colors.onSurfaceVariant,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Column(
          children: options.map((opt) {
            bool isSelected = seleccion == opt['nom'];
            return GestureDetector(
              onTap: () => setState(() => seleccion = opt['nom'] as String),
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 52,
                decoration: BoxDecoration(
                  color:
                      colors.surfaceContainerHighest ??
                      colors.outlineVariant.withOpacity(0.2),
                  // Fallback for older flutter
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    FractionallySizedBox(
                      widthFactor: opt['porcentajeD'] as double,
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected
                              ? colors.primaryContainer
                              : (opt['barColor'] as Color),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              if (isSelected) ...[
                                Icon(
                                  Icons.check_circle_rounded,
                                  color: colors.primary,
                                  size: 18,
                                ),
                                const SizedBox(width: 8),
                              ],
                              Text(
                                opt['nom'] as String,
                                style: TextStyle(
                                  color: colors.onSurface,
                                  fontSize: 14,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          ),
                          Text(
                            opt['porcentajeS'] as String,
                            style: TextStyle(
                              color: isSelected
                                  ? colors.onSurface
                                  : colors.onSurfaceVariant,
                              fontSize: 14,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _submitButton(ColorScheme colors) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          elevation: 0,
        ),
        child: Text(
          'Enviar voto',
          style: TextStyle(
            color: colors.onPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
      ),
    );
  }

  Widget _tabBar(ColorScheme colors) {
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
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: Center(
                    child: Icon(Icons.home_rounded, color: colors.onPrimary),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => context.go(AppRoutes.ticket),
                child: Center(
                  child: Icon(
                    Icons.confirmation_number_outlined,
                    color: colors.outline,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => context.go(AppRoutes.history),
                child: Center(
                  child: Icon(Icons.history_rounded, color: colors.outline),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
