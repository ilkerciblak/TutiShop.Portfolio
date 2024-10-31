// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:suvido_eshop/presentation/onboarding/state/onboarding_state.dart';
import 'package:suvido_eshop/shared/theme/app_spacing.dart';

class OnboardingView extends StatelessWidget {
  final OnboardingState state;
  const OnboardingView({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Image(
          image: AssetImage(
            state.imgPath,
          ),
        ),
        const SizedBox(
          height: AppSpacing.small,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                state.headline,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: AppSpacing.tiny,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                state.description,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
