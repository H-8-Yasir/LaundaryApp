import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth facebook=FacebookAuth.instance;
  bool isLoggedIn = false;
  User? user;
   
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
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // User cancelled the sign-in
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,  
        accessToken: googleAuth.accessToken    
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

  Future<User?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken!.token);

        final userCredential =
            await _auth.signInWithCredential(credential);

        return userCredential.user;
      } else {
        print("Facebook Login Failed: ${result.message}");
        return null;
      }
    } catch (e) {
      throw Exception("Error: $e");
      
    }
  }
}