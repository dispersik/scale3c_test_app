import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sign_in/bloc/sign_in_bloc.dart';
import 'package:sign_in/bloc/sign_in_event.dart';

class MockAuthInteractor extends Mock implements AuthInteractor {}

NavigatorState navigator = NavigatorState();

void main() {
  SignInBloc signInBloc;
  AuthInteractor authInteractor = MockAuthInteractor();

  blocTest('sign in - happy flow', build: () {
    serviceLocator.registerFactory<AuthInteractor>(() => authInteractor);

    when(() => authInteractor.signInWithEmailAndPassword(
        email: 'email', password: 'password')).thenAnswer((_) async {});
    signInBloc = SignInBloc(navigator: navigator);
    return signInBloc;
  }, act: (SignInBloc bloc) {
    bloc.add(
        SignInWithEmailAndPasswordEvent(password: 'password', email: 'email'));
  }, verify: (_) {
    verify(() => authInteractor.signInWithEmailAndPassword(
        email: 'email', password: 'password')).called(1);
    verifyNoMoreInteractions(authInteractor);
  });

}
