import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart';

class AuthService with ChangeNotifier {
  final firebase_auth.FirebaseAuth _firebaseAuth = firebase_auth.FirebaseAuth.instance;

  firebase_auth.User? get currentUser => _firebaseAuth.currentUser;

  Future<bool> register(String name, String email, String password) async {
    try {
      firebase_auth.UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Actualiza el perfil del usuario con el nombre proporcionado
      await userCredential.user?.updateDisplayName(name);
      await userCredential.user?.reload();  // Recarga el usuario para actualizar el perfil
      notifyListeners();
      return true;
    } catch (e) {
      print("Error en el registro: $e");
      return false;
    }
  }

  Future<bool> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      notifyListeners();
      return true;
    } catch (e) {
      print("Error en el inicio de sesión: $e");
      return false;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    notifyListeners();
  }
}
