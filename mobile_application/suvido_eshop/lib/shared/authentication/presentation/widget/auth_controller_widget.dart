import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:suvido_eshop/shared/authentication/_authentication_exporter.dart';
import 'package:suvido_eshop/shared/authentication/presentation/bloc/auth_cubit.dart';
import 'package:suvido_eshop/shared/enums/authentication_status.dart';

class AuthControllerWidget extends StatefulWidget {
  final Widget widget;
  final Widget authScreen;
  const AuthControllerWidget({
    super.key,
    this.widget = const Placeholder(),
    this.authScreen = const Placeholder(),
  });

  @override
  State<AuthControllerWidget> createState() => _AuthControllerWidgetState();
}

class _AuthControllerWidgetState extends State<AuthControllerWidget> {
  late AuthCubit authCubit;

  @override
  void initState() {
    authCubit = AuthCubit(
      // authManager: GetIt.instance<AuthManager>(),
      authentication: GetIt.instance<Authentication>(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, Authentication>(
      bloc: authCubit,
      listener: (context, state) {},
      builder: (context, state) => switch (state.authenticationStatus) {
        AuthenticationStatus.authenticated => widget.widget,
        _ => widget.authScreen,
      },
    );
  }
}
