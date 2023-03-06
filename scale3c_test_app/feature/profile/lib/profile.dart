library profile;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/profile_screen.dart';

import 'bloc/profile_bloc.dart';

class ProfilePage extends Page<void> {
  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute<void>(builder: (BuildContext context) {
      return BlocProvider<ProfileBloc>(
        create: (_) => ProfileBloc(),
        child: ProfileScreen(),
      );
    });
  }
}
