library sign_up;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_up/bloc/sign_up_bloc.dart';
import 'sign_up_screen.dart';

class SignUpPage extends Page<void> {
  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute<void>(builder: (BuildContext context) {
      return BlocProvider<SignUpBloc>(
        create: (_) => SignUpBloc(navigator: Navigator.of(context)),
        child: SignUpScreen(),
      );
    });
  }
}
