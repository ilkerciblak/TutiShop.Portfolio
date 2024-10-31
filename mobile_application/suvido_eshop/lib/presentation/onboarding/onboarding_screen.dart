// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suvido_eshop/presentation/onboarding/state/onboarding_cubit.dart';
import 'package:suvido_eshop/presentation/onboarding/state/onboarding_state.dart';
import 'package:suvido_eshop/presentation/onboarding/view/onboarding_view.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late OnboardingCubit cubit;

  @override
  void initState() {
    cubit = OnboardingCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBody: true,
      body: SafeArea(
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          bloc: cubit,
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: cubit.pageController,
                        allowImplicitScrolling: false,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: OnboardingContent.content.length,
                        itemBuilder: (context, index) {
                          return OnboardingView(
                            state: state,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    List.generate(OnboardingContent.content.length, (index) {
                  return Container(
                    height: 13,
                    width: 13,
                    margin: EdgeInsets.only(left: 3, right: 3),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlack
                          .withOpacity(cubit.dotIndicatorOpacity(index)),
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: AppSpacing.medium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedTextButton(
                    btnText: state.btnText,
                    onPressed: () => cubit.onBtnPressed(context),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
