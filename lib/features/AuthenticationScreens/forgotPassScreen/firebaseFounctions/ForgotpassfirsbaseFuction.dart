import 'package:firebase_auth/firebase_auth.dart';

class Forgotpassfirsbasefuction {
  static Future<void> resetPassword(
    String email, {
    required void Function() onSuccess,
    required void Function(String message) onError,
  }) async {
    try {
      final methods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(
        email,
      );

      if (methods.isEmpty) {
        onError('No user found with this email.');
        return;
      }

      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError('Something went wrong. Please try again.');
    } catch (e) {
      onError('Unexpected error occurred.');
    }
  }
}
