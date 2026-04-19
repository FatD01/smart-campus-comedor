import 'package:flutter/material.dart';
import '../data/auth_repository.dart';
import '../../../core/services/storage_service.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();
  final StorageService _storageService = StorageService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  // Método principal de Login
  Future<void> loginWithGoogle() async {
    _setLoading(true);
    _errorMessage = null;

    try {
      await _authRepository.signInWithGoogle();
      
      // Si el login es exitoso, Supabase guarda la sesión internamente,
      // pero nosotros también guardaremos una referencia.
      final user = _authRepository.getCurrentUser();
      if (user != null) {
        await _storageService.saveToken(user.id);
      }
    } catch (e) {
      _errorMessage = "Error al iniciar sesión: $e";
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}