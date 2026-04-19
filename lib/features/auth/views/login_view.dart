import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/navigation/app_routes.dart';
import 'package:flutter_application_1/core/theme/extensions/AppRadiusExtension.dart';
import 'package:flutter_application_1/features/auth/views/widgets/google_button.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customRadius = Theme.of(context).extension<AppRadiusExtension>()!;
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.vertical,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),
                  Text(
                    textAlign: TextAlign.center,
                    "Comedor Tecsup",
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 36,
                      letterSpacing: -0.5,
                    ),
                  ),
                  Container(
                    height: 380,
                    decoration: BoxDecoration(
                      color: color.onSurfaceVariant,
                      boxShadow: [
                        BoxShadow(
                          color: color.shadow.withAlpha(45),
                          blurRadius: 40,
                          offset: const Offset(0, 20),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(customRadius.xl),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/generated-1774929899926.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 155,
                      child: Text(
                        textAlign: TextAlign.center,
                        'Tu almuerzo diario a un toque, sin filas.',
                        style: textTheme.bodyMedium?.copyWith(
                          color: color.outline,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  GoogleSignInButton(
                    onPressed: () {
                      print("Google Sign In");
                      context.goNamed(AppRoutes.postsName);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
