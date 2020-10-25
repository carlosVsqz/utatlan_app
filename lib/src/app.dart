import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utatlan_app/src/resources/repository/user_repository.dart';
import 'package:utatlan_app/src/ui/common/common.dart';
import 'package:utatlan_app/src/ui/home/home.dart';
import 'package:utatlan_app/src/ui/login/login_page.dart';
import 'package:utatlan_app/src/ui/splash/splash.dart';

import 'blocs/auth/authentication_bloc.dart';

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationUnintialized) {
            // ignore: missing_return
            return SplashPage();
          }
          // ignore: missing_return
          if (state is AuthenticationAuthenticated) {
            return HomePage();
          }
          // ignore: missing_return
          if (state is AuthenticationUnauthenticated) {
            return LoginPage(
              userRepository: userRepository,
            );
          }
          // ignore: missing_return
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
        },
      ),
    );
  }
}
