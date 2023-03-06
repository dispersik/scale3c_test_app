import 'package:domain/domain.dart';

class AuthInteractor {
  final AuthRepository _authRepository;

  AuthInteractor({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _authRepository.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _authRepository.signUpWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    return _authRepository.signOut();
  }
}
