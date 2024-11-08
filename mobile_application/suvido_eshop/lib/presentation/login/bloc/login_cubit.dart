import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:suvido_eshop/presentation/login/bloc/login_state.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthManager authManager =
      GetIt.instance<AuthManager>(instanceName: 'dummyAuthManager');
  LoginCubit()
      : super(
          LoginState.initial(),
        ) {
    initPage();
  }

  late TextEditingController usernameController;
  late TextEditingController passwordController;
  final SharedPrefencesService sharedPrefencesService =
      GetIt.instance<SharedPrefencesService>();

  void initPage() {
    var username = sharedPrefencesService.getString('username');
    var password = sharedPrefencesService.getString('password');
    emit(
      state.copyWith(
        username: username,
        password: password,
      ),
    );
    usernameController = TextEditingController(text: state.username);
    passwordController = TextEditingController(text: state.password);
  }

  void onLoginBtnPressed(BuildContext context) async {
    emit(
      state.copyWith(
        status: FetchStatus.loading,
      ),
    );
    var response = await authManager
        .login(username: state.username, password: state.password)
        .run();
    response.fold(
      (l) {
        emit(
          state.copyWith(
            status: FetchStatus.failed,
            errorMessage: l.toString(),
          ),
        );
      },
      (r) {
        // TODO: More secure structure
        sharedPrefencesService.saveString('username', state.username);
        sharedPrefencesService.saveString('password', state.password);
        context.goNamed('home');
      },
    );
  }

  void onUsernameEntered(String value) {
    emit(state.copyWith(username: value));
  }

  void onPasswordEntered(String value) {
    emit(state.copyWith(password: value));
  }

  void onMessageIconPressed() {
    emit(
      state.copyWith(
        status: FetchStatus.idle,
        errorMessage: '',
      ),
    );
  }
}
