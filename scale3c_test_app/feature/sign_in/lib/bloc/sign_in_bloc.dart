import 'package:common_presentation/common_presentation.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/profile.dart';
import 'package:sign_up/sign_up.dart';

import 'sign_in_event.dart';
import 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>
    with EmailAndPasswordValidatorMixin {
  final NavigatorState _navigator;
  final AuthInteractor _authInteractor = serviceLocator.get();

  SignInBloc({required NavigatorState navigator})
      : _navigator = navigator,
        super(SignInState(badCredentials: false)) {
    on<SignInWithEmailAndPasswordEvent>(_signIn);
    on<RouteToSignUpEvent>(_routeToSignUp);
  }

  Future<void> _signIn(
      SignInWithEmailAndPasswordEvent event, Emitter<SignInState> emit) async {
    // if (!isEmailValid(event.email)) {
    //   emit();
    // } else if (!isPasswordValid(event.password)) {
    //   emit();
    // }

    try {
      await _authInteractor.signInWithEmailAndPassword(
          email: event.email, password: event.password);

      emit(SignInState(badCredentials: false));

      _navigator.push(ProfilePage().createRoute(_navigator.context));
    } catch (_) {
      emit(SignInState(badCredentials: true));
    }
  }

  void _routeToSignUp(_, __) {
    _navigator.push(SignUpPage().createRoute(_navigator.context));
  }
}
