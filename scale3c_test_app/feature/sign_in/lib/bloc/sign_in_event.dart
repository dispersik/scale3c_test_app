abstract class SignInEvent {}

class SignInWithEmailAndPasswordEvent extends SignInEvent {
  final String email;
  final String password;

  SignInWithEmailAndPasswordEvent({
    required this.password,
    required this.email,
  });
}

class RouteToSignUpEvent extends SignInEvent {}
