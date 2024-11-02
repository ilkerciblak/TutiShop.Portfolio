import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:suvido_eshop/presentation/onboarding/state/onboarding_state.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';
import 'package:go_router/go_router.dart';
import 'package:suvido_eshop/shared/services/shared_prefences.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit()
      : super(
          OnboardingState.initial(),
        ) {
    initPage();
  }

  late int pageCounter;
  late PageController pageController;
  final SharedPrefencesService sharedPrefencesService =
      GetIt.instance<SharedPrefencesService>();

  void initPage() {
    pageCounter = 0;
    pageController = PageController(initialPage: 0);
    sharedPrefencesService.saveBool('knownUser', true);
    emitNewState();
  }

  void onBtnPressed(BuildContext context) {
    OnboardingContent.content[pageCounter]['redirect'] == null
        ? changePhange()
        : context.goNamed(OnboardingContent.content[pageCounter]['redirect']!);
  }

  void changePhange() {
    pageController.nextPage(
      duration: Durations.short2,
      curve: Easing.standardAccelerate,
    );

    pageCounter++;
    emitNewState();
  }

  void emitNewState() {
    emit(
      state.copyWith(
        imgPath: OnboardingContent.content[pageCounter]['imgPath'],
        headline: OnboardingContent.content[pageCounter]['headline'],
        description: OnboardingContent.content[pageCounter]['description'],
        btnText: OnboardingContent.content[pageCounter]['btnText'],
      ),
    );
  }

  double dotIndicatorOpacity(int index) => pageCounter == index ? 1 : 0.5;
}
