library sign_in;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in/bloc/sign_in_bloc.dart';
import 'sign_in_screen.dart';

class SignInPage extends Page<void> {
  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute<void>(builder: (BuildContext context) {
      return BlocProvider<SignInBloc>(
        create: (_) => SignInBloc(initialState),
        child: SignInScreen(),
      );
    });
  }
}
