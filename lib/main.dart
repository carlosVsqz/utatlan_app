import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utatlan_app/src/app.dart';
import 'package:utatlan_app/src/bloc_delegate.dart';
import 'package:utatlan_app/src/blocs/auth/authentication_bloc.dart';

import 'src/resources/repository/user_repository.dart';


void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();

  runApp(BlocProvider<AuthenticationBloc>(
    create: (context) {
      return AuthenticationBloc(userRepository: userRepository)
        ..add(AppStarted());
    },
    child: App(userRepository: userRepository),
  ));
}

