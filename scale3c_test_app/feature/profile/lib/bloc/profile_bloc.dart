import 'package:core/di.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_event.dart';

import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final NavigatorState _navigator;
  final AuthInteractor _authInteractor = serviceLocator.get();
  final ProfileInteractor _profileInteractor = serviceLocator.get();

  ProfileBloc({
    required NavigatorState navigator,
  })  : _navigator = navigator,
        super(ProfileState(profile: null)) {
    on<InitEvent>(_init);
    on<PopEvent>(_onPopEvent);
    on<LogOutEvent>(_onLogOutEvent);

    add(InitEvent());
  }

  Future<void> _init(_, Emitter<ProfileState> emit) async {
    try {
      final Profile profile = await _profileInteractor.getCurrent();

      emit(ProfileState(profile: profile));
    } catch (_) {
      _authInteractor.signOut();
      _navigator.pop();
    }
  }

  Future<void> _onLogOutEvent(_, __) async {
    await _logOutAndPop();
  }

  Future<void> _onPopEvent(_, __) async {
    await _logOutAndPop();
  }

  Future<void> _logOutAndPop() async {
    await _authInteractor.signOut();
    _navigator.pop();
  }
}
