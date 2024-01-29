import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationProvider extends ChangeNotifier {
  final _fireAuth = FirebaseAuth.instance;
  bool _isLoading = false;

  UserCredential? userCredential;

  bool get isLoading => _isLoading;

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> emailSignUp({
    required String email,
    required String password,
    required Function onError,
    required Function onSuccess,
  }) async {
    setIsLoading(true);
    try {
      userCredential = await _fireAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //Send email verfication
      await userCredential!.user!.sendEmailVerification();

      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError(e.message ?? "Error registering user");
      if (kDebugMode) {
        print(e);
      }
    } catch (e) {
      onError(e.toString());
    }

    setIsLoading(false);
  }

  Future<void> signInWithGoogle({
    required Function onError,
    required Function onSuccess,
  }) async {
    setIsLoading(true);
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      setIsLoading(false);

      onSuccess();
    } on FirebaseAuthException catch (e) {
      setIsLoading(false);

      onError(e.message ?? "Error authenticating user");
      if (kDebugMode) {
        print(e);
      }
    }
    setIsLoading(false);
  }

  Future<void> login({
    required String email,
    required String password,
    required Function onError,
    required Function onSuccess,
  }) async {
    setIsLoading(true);
    try {
      userCredential = await _fireAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      //check if user is verfied
      if (userCredential!.user!.emailVerified) {
        onSuccess();
      } else {
        onError("Please verify your email. We have sent you an email");
      }
    } on FirebaseAuthException catch (e) {
      onError(e.message ?? "Error registering user");
      if (kDebugMode) {
        print(e);
      }
    }
    setIsLoading(false);
  }
}
