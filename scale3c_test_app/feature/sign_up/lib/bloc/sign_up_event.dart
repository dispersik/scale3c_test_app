abstract class SignUpEvent {}

class SignUpWithEmailAndPasswordEvent extends SignUpEvent {
  final String email;
  final String password;

  SignUpWithEmailAndPasswordEvent({
    required this.password,
    required this.email,
  });
}

class RouteToSignIn extends SignUpEvent {}

class Pop extends SignUpEvent {}

