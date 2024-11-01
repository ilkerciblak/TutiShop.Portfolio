// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
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
              TextField(
                maxLines: 1,
                style: AppFontStyles.regularWhite13,
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
                    child: ElevatedTextButton(
                      backgroundColor: AppColors.primaryBlue,
                      btnText: 'Login',
                      onPressed: () {},
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
            ],
          ),
        ),
      ),
    );
  }
}