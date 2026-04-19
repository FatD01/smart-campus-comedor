import "package:flutter/material.dart";
import "package:flutter_application_1/core/theme/extensions/AppRadiusExtension.dart";
import "package:flutter_application_1/core/theme/util.dart";

class AppTheme {
  const AppTheme();
  // --- SCHEMES ---

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff8e4d2d),
      surfaceTint: Color(0xff8e4d2d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdbcc),
      onPrimaryContainer: Color(0xff713718),
      secondary: Color(0xff76574a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdbcc),
      onSecondaryContainer: Color(0xff5c4033),
      tertiary: Color(0xff665f31),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffeee4a9),
      onTertiaryContainer: Color(0xff4d471b),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff221a16),
      onSurfaceVariant: Color(0xff52443d),
      outline: Color(0xff85736c),
      outlineVariant: Color(0xffd7c2ba),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2a),
      inversePrimary: Color(0xffffb694),
    );
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb694),
      surfaceTint: Color(0xffffb694),
      onPrimary: Color(0xff542105),
      primaryContainer: Color(0xff713718),
      onPrimaryContainer: Color(0xffffdbcc),
      secondary: Color(0xffe6bead),
      onSecondary: Color(0xff442a1f),
      secondaryContainer: Color(0xff5c4033),
      onSecondaryContainer: Color(0xffffdbcc),
      tertiary: Color(0xffd1c88f),
      onTertiary: Color(0xff363107),
      tertiaryContainer: Color(0xff4d471b),
      onTertiaryContainer: Color(0xffeee4a9),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1a120e),
      onSurface: Color(0xfff1dfd8),
      onSurfaceVariant: Color(0xffd7c2ba),
      outline: Color(0xffa08d85),
      outlineVariant: Color(0xff52443d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dfd8),
      inversePrimary: Color(0xff8e4d2d),
    );
  }

  // --- THEME DATA BUILDERS ---

  ThemeData light(BuildContext context) {
    // 1. Generamos el TextTheme personalizado (Inter para ambos en este caso)
    final textTheme = createTextTheme(context, "Inter", "Inter");
    
    // 2. Usamos el esquema de colores que ya tenías
    final colorScheme = lightScheme();

    return _buildTheme(colorScheme, textTheme);
  }

  ThemeData dark(BuildContext context) {
    final textTheme = createTextTheme(context, "Inter", "Inter");
    final colorScheme = darkScheme();

    return _buildTheme(colorScheme, textTheme);
  }

  ThemeData _buildTheme(ColorScheme colorScheme, TextTheme textTheme) {
    return ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,

      textTheme: textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,

      extensions: [
        AppRadiusExtension(xs: 12, s: 16, m: 28, l: 36, xl: 40)
      ]



    );
  }
}