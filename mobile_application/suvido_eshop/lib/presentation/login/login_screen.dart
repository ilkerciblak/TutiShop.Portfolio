// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suvido_eshop/presentation/login/bloc/login_state.dart';
import 'package:suvido_eshop/presentation/login/bloc/login_cubit.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginCubit cubit;

  @override
  void initState() {
    cubit = LoginCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: BlocBuilder<LoginCubit, LoginState>(
            bloc: cubit,
            builder: (context, state) => Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: AppSpacing.veryHuge,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'SivuShop',
                        style: AppFontStyles.boldWhite23,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSpacing.veryHuge,
                ),
                ConditionalAlertContainer(
                  alertMessage: state.errorMessage,
                  condition: state.status.isFailed,
                  success: false,
                  iconOnTap: cubit.onMessageIconPressed,
                ),
                const SizedBox(
                  height: AppSpacing.veryHuge,
                ),
                TextField(
                  maxLines: 1,
                  style: AppFontStyles.regularWhite13,
                  controller: cubit.usernameController,
                  onChanged: cubit.onUsernameEntered,
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: AppFontStyles.regularWhite13.withOpacity(0.7),
                    filled: true,
                    fillColor: AppColors.primaryGrey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSpacing.small,
                ),
                TextField(
                  obscureText: true,
                  maxLines: 1,
                  style: AppFontStyles.regularWhite13,
                  controller: cubit.passwordController,
                  onChanged: cubit.onPasswordEntered,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: AppFontStyles.regularWhite13.withOpacity(0.7),
                    filled: true,
                    fillColor: AppColors.primaryGrey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.visibility,
                        color: AppColors.primaryWhite,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSpacing.medium,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedStatefullButton(
                        backgroundColor: AppColors.primaryBlue,
                        btnText: 'Login',
                        onTap: () => cubit.onLoginBtnPressed(context),
                        status: state.status,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: AppSpacing.medium,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "By continuing, you agree to Grow's Terms of Service and Privacy Policy",
                        textAlign: TextAlign.center,
                        style: AppFontStyles.regularSubtitles13,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: AppSpacing.medium,
                ),
                Divider(
                  color: AppColors.primaryGrey,
                ),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton.icon(
                      iconAlignment: IconAlignment.start,
                      style: ElevatedButton.styleFrom(
                        iconColor: AppColors.primaryWhite,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: AppColors.primaryWhite,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      label: Text(
                        'Sign In With Email',
                        style: AppFontStyles.boldWhite13,
                      ),
                      icon: Icon(Icons.email_outlined),
                    ))
                  ],
                ),
                const SizedBox(
                  height: AppSpacing.small,
                ),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton.icon(
                      iconAlignment: IconAlignment.start,
                      style: ElevatedButton.styleFrom(
                        iconColor: AppColors.primaryWhite,
                        backgroundColor: AppColors.primaryWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide.none,
                        ),
                      ),
                      onPressed: () {},
                      label: Text(
                        'Sign In With Apple',
                        style: AppFontStyles.boldBlack13,
                      ),
                      icon: Icon(
                        Icons.apple_outlined,
                        color: AppColors.primaryBlack,
                      ),
                    ))
                  ],
                ),
                const SizedBox(
                  height: AppSpacing.small,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        iconAlignment: IconAlignment.start,
                        style: ElevatedButton.styleFrom(
                          iconColor: AppColors.primaryWhite,
                          backgroundColor: AppColors.primaryBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide.none,
                          ),
                        ),
                        onPressed: () {},
                        label: Text(
                          'Sign In With Facebook',
                          style: AppFontStyles.boldWhite13,
                        ),
                        icon: Icon(Icons.facebook_outlined),
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't you have an account?",
                      style: AppFontStyles.regularWhite13,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign in!",
                        style: AppFontStyles.boldWhite13,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
