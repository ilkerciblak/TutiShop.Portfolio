class OnboardingState {
  final String imgPath;
  final String headline;
  final String description;
  final String btnText;

  OnboardingState({
    required this.imgPath,
    required this.headline,
    required this.description,
    required this.btnText,
  });

  factory OnboardingState.initial() => OnboardingState(
        imgPath: '',
        headline: '',
        description: '',
        btnText: '',
      );

  OnboardingState copyWith({
    String? imgPath,
    String? headline,
    String? description,
    String? btnText,
  }) {
    return OnboardingState(
      imgPath: imgPath ?? this.imgPath,
      headline: headline ?? this.headline,
      description: description ?? this.description,
      btnText: btnText ?? this.btnText,
    );
  }

  @override
  bool operator ==(covariant OnboardingState other) {
    if (identical(this, other)) return true;

    return other.imgPath == imgPath &&
        other.headline == headline &&
        other.description == description &&
        other.btnText == btnText;
  }

  @override
  int get hashCode {
    return imgPath.hashCode ^
        headline.hashCode ^
        description.hashCode ^
        btnText.hashCode;
  }
}
