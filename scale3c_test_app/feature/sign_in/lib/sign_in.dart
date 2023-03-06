library sign_in;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in/bloc/sign_in_bloc.dart';
import 'sign_in_screen.dart';

class SignInPage extends Page<void> {
  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute<void>(builder: (_) => SignInScreen());
  }
}

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInBloc>(
      create: (BuildContext context) => SignInBloc(
        navigator: Navigator.of(context),
      ),
      child: SignInScreenInternal(),
    );
  }
}
