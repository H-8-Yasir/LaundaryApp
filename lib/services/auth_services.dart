// lib/services/auth_service.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
   

  // --- 1. Email/Password Sign Up ---
  Future<User?> signUpWithEmailPassword(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Optional: Send email verification after sign-up
      await userCredential.user?.sendEmailVerification();
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase errors (e.g., 'email-already-in-use', 'weak-password')
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('An account already exists for that email.');
      }
      throw Exception(e.message ?? 'Sign up failed.');
    } catch (e) {
      throw Exception('An unknown error occurred during sign up.');
    }
  }

 Future<User?> signInWithGoogle() async {
  
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.authenticate();
      if (googleUser == null) {
        // User cancelled the sign-in
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,      
      );

      final userCredential = await _auth.signInWithCredential(credential);

      return userCredential.user;

    } on FirebaseAuthException catch (e) {
      // Handle Firebase errors
      throw Exception(e.message ?? 'Google sign in failed.');
    } catch (e) {
     
      throw Exception('An unknown error occurred during Google sign in: $e');
    }
  }
}