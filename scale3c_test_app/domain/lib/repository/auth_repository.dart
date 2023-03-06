abstract class AuthRepository {
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signInWithFacebook();

  Future<void> signInWithTwitter();

  Future<void> signInWithLinkedIn();

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signUpWithFacebook();

  Future<void> signUpWithTwitter();

  Future<void> signUpWithLinkedIn();

  Future<void> signOut();
}
