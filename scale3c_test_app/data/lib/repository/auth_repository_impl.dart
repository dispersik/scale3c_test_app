import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _fbAuthInstance = FirebaseAuth.instance;

  @override
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _fbAuthInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (_) {
      throw Exception('Wrong credentials');
    }
  }

  @override
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _fbAuthInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print(e);

      throw Exception('Email in use');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _fbAuthInstance.signOut();
    } catch (_) {}
  }

  @override
  Future<void> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithLinkedIn() {
    // TODO: implement signInWithLinkedIn
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithTwitter() {
    // TODO: implement signInWithTwitter
    throw UnimplementedError();
  }

  @override
  Future<void> signUpWithFacebook() {
    // TODO: implement signUpWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<void> signUpWithLinkedIn() {
    // TODO: implement signUpWithLinkedIn
    throw UnimplementedError();
  }

  @override
  Future<void> signUpWithTwitter() {
    // TODO: implement signUpWithTwitter
    throw UnimplementedError();
  }
}
