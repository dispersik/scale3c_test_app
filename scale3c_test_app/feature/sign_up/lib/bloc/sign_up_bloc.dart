import 'package:common_presentation/common_presentation.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/profile.dart';
import 'package:sign_in/sign_in.dart';

import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState>
    with EmailAndPasswordValidatorMixin {
  final NavigatorState _navigator;
  final AuthInteractor _authInteractor = serviceLocator.get();

  SignUpBloc({required NavigatorState navigator})
      : _navigator = navigator,
        super(SignUpState()) {
    on<SignUpWithEmailAndPasswordEvent>(_signUpWithEmailAndPassword);
    on<PopEvent>(_pop);
    on<RouteToSignIn>(_routeToSignIn);
  }

  void _pop(_, __) {
    _navigator.pop();
  }

  void _routeToSignIn(_, __) {
    _navigator.push(SignInPage().createRoute(_navigator.context));
  }

  Future<void> _signUpWithEmailAndPassword(
    SignUpWithEmailAndPasswordEvent event,
    Emitter<SignUpState> emit,
  ) async {
    // if (event.)

    try {
      await _authInteractor.signUpWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(SignUpState(errorMessage: null));
      _navigator.push(ProfilePage().createRoute(_navigator.context));
    } catch (_) {
      emit(SignUpState(errorMessage: 'Something went wrong'));
    }
  }
}
