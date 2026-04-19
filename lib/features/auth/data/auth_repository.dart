import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  // Método para login
  Future<void> signInWithGoogle() async {
    await _supabaseClient.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: 'io.supabase.flutter://login-callback/',
    );
  }


  User? getCurrentUser() {
    return _supabaseClient.auth.currentUser;
  }
  Future<void> signOut() async => await _supabaseClient.auth.signOut();
}
