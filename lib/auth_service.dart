import 'package:firebase_auth/firebase_auth.dart';

class AuthenticatioService {
  final FirebaseAuth firebaseAuth;

  AuthenticatioService(
    this.firebaseAuth,
  );

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Signed in';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await firebaseAuth.currentUser!.updateDisplayName(name);
      return 'Signed up';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signOut() async {
    try {
      await firebaseAuth.signOut();
      return 'Signed out';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> forgotPassword({required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return 'Email Sent';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
