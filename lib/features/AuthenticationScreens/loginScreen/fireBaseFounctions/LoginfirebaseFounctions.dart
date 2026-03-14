import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Loginfirebasefounctions {
  static Future<void> signIn(
    String email,
    String password, {
    required Function(User) onSucces,
    required Function(String) onError,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        onSucces(credential.user!);
      } else {
        onError('User is null after sign in');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        onError('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        onError('Wrong password provided for that user.');
      } else if (e.code == 'invalid-credential') {
        onError('Invalid email or password.');
      } else if (e.code == 'invalid-email') {
        onError('The email address is not valid.');
      } else if (e.code == 'user-disabled') {
        onError('This account has been disabled.');
      } else if (e.code == 'too-many-requests') {
        onError('Too many attempts. Please try again later.');
      } else {
        onError(e.message ?? "Unknown error");
      }
    }
  }

  static Future<User?> signInWithGoogleSafe() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Error: ${e.code} - ${e.message}");
      return null;
    } catch (e) {
      print("Google Sign-In Error: $e");
      return null;
    }
  }
}
