import 'package:flutter/material.dart';

class AppRadiusExtension extends ThemeExtension<AppRadiusExtension> {
  // Definimos tus variables de Pencil
  final double xs; // 12
  final double s;  // 16
  final double m;  // 28
  final double l;  // 36
  final double xl; // 40

  AppRadiusExtension({
    required this.xs,
    required this.s,
    required this.m,
    required this.l,
    required this.xl,
  });

  @override
  ThemeExtension<AppRadiusExtension> copyWith() => this; 

  @override
  ThemeExtension<AppRadiusExtension> lerp(ThemeExtension<AppRadiusExtension>? other, double t) {
    if (other is! AppRadiusExtension) return this;
    return AppRadiusExtension(
      xs: t < 0.5 ? xs : other.xs,
      s: t < 0.5 ? s : other.s,
      m: t < 0.5 ? m : other.m,
      l: t < 0.5 ? l : other.l,
      xl: t < 0.5 ? xl : other.xl,
    );
  }
}