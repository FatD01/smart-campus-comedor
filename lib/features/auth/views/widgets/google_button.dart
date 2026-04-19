import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/extensions/AppRadiusExtension.dart';

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPressed; // Recibimos la acción desde la View

  const GoogleSignInButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final customRadius = Theme.of(context).extension<AppRadiusExtension>()!;

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(customRadius.m),
        ),
        side: BorderSide(color: color.outlineVariant),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/google_logo.png', height: 24),
          const SizedBox(width: 12),
          const Text('Continuar con Google'),
        ],
      ),
    );
  }
}