import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:laundaryapp/Widgets/customTextField/customTextField.dart';
import 'package:laundaryapp/Widgets/customTextField/customtext.dart';
import 'package:laundaryapp/Widgets/custom_sub_text.dart';
import 'package:laundaryapp/bar/bottomBar.dart';
import 'package:laundaryapp/services/auth_services.dart';

class Signupscreen extends StatefulWidget{
  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {

  final TextEditingController name=TextEditingController();
  final TextEditingController email=TextEditingController();
  final TextEditingController password=TextEditingController();
  final TextEditingController confirmPassword=TextEditingController();
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  bool _isLoading1 = false;
  bool _isLoading2 = false;
  final AuthService _facebookService = AuthService();
  User? _user;

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => BottomBar()),
    );
  }

  // --- 1. Email/Password Sign Up ---
  Future<void> _handleSignUp() async {
    if (email.text.isEmpty || password.text.isEmpty) return;

    setState(() { _isLoading = true; });

    try {
      final user = await _authService.signUpWithEmailPassword(
        email.text.trim(),
        password.text.trim(),
      );
      
      if (user != null) {
        // Sign-up successful. Show verification message.
        _showError('Verification email sent to ${user.email}');
        // NOTE: You typically don't navigate until the email is verified, 
        // but for demo purposes, we navigate immediately.
        _navigateToHome(); // ⬅️ NAVIGATION ON SUCCESS
      }
    } catch (e) {
      _showError(e.toString().replaceAll('Exception: ', ''));
    } finally {
      setState(() { _isLoading = false; });
    }
  }

  // --- 2. Google Sign In ---
  Future<void> _handleGoogleSignIn() async {
    setState(() { _isLoading1 = true; });

    try {
      final user = await _authService.signInWithGoogle();

      if (user != null) {
        _showError('Signed in with Google as ${user.displayName ?? user.email}');
        _navigateToHome(); // ⬅️ NAVIGATION ON SUCCESS
      } else {
        // User cancelled sign-in
        _showError('Google sign in cancelled.');
      }
    } catch (e) {
      _showError(e.toString().replaceAll('Exception: ', ''));
    } finally {
      setState(() { _isLoading1 = false; });
    }
  }

  Future<void> handleFacebookLogin() async {
    setState((){ _isLoading2 = true;});

     try {
    // 1️⃣ Trigger Facebook sign-in flow
    final LoginResult result = await FacebookAuth.instance.login();

    // 2️⃣ Check login status
    if (result.status == LoginStatus.success) {
      // 3️⃣ Get credential from Facebook access token
      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);

      // 4️⃣ Sign in to Firebase with that credential
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final user = userCredential.user;

      if (user != null) {
        // ✅ Successfully signed in — navigate to home
        _showError('Signed in with Facebook as ${user.displayName ?? user.email}');
        _navigateToHome();
      } else {
        _showError('Facebook sign-in failed.');
      }
    } else if (result.status == LoginStatus.cancelled) {
      _showError('Facebook sign-in cancelled.');
    } else {
      _showError('Facebook sign-in error: ${result.message}');
    }
  } catch (e) {
    _showError(e.toString().replaceAll('Exception: ', ''));
  } finally {
    setState(() { _isLoading2 = false; });
  }
  }


  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }  

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFF7F3EE),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Form(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Create Account",textAlign: TextAlign.center, style: TextStyle(
                            color: Color(0xFFD4AF37),
                            fontSize: 24
                          ),),
                        ],
                      ),
                  const SizedBox(height: 7),
                  customsubtext("Create your Akoya account to enjoy personalized services and premium laundry care."),
                  const SizedBox(height: 12),
                  customText("Name"),
            customTextField(labelText: "Name", 
                  controller: name, 
                  textInputType: TextInputType.text),
                  customText("Email"),
            customTextField(labelText: "Email", 
                  controller: email, 
                  textInputType: TextInputType.text),
                  customText("Password"),
            customTextField(labelText: "Password", 
                  controller: password, 
                  textInputType: TextInputType.text,
                  isPassword: true,
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),),
                  customText("Confirm Password"),
           customTextField(labelText: "Confirm Password", 
                  controller: confirmPassword, 
                  textInputType: TextInputType.text,
                  isPassword: true),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Checkbox(value: false, 
                      onChanged: (bool? value){}),
                    ),
                    const SizedBox(width: 7),
                    const Text("Agree with ",style: TextStyle(color: Color.fromARGB(255, 126, 124, 124)),),
                    const Text("terms & conditions",style: TextStyle(
                      color: Color(0xFFD4AF37)
                    ))
                ]),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 10),
                child: _isLoading ? CircularProgressIndicator() : ElevatedButton(onPressed: _handleSignUp, 
                style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD4AF37),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)
                      )
                    ),
                child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
                    fontSize: 16)))
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                 const Expanded(child: Divider(color: Colors.black,)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: const Text("or sign up with",style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                 const Expanded(child: Divider(color: Colors.black)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _isLoading1 ? CircularProgressIndicator() : InkWell(
                    onTap: _handleGoogleSignIn,
                    child: ClipOval(
                      child: Image.asset('assets/images/download.png',height: 50,width: 50,fit: BoxFit.cover),
                      ),
                  ),
                    const SizedBox(width: 32),
                  _isLoading2 ? CircularProgressIndicator() : InkWell(
                    onTap: handleFacebookLogin,
                    child: ClipOval(
                      child: Image.asset('assets/images/facebook.png',height: 50,width: 50,fit: BoxFit.cover),
                      ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? ",style: TextStyle(color: Color.fromARGB(255, 95, 94, 94))),
                  const Text("Sign in",style: TextStyle(color: Color(0xFFD4AF37)))
                ],
              )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}