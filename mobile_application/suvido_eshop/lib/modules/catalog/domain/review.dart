class Review {
  final int rating;
  final String comment;
  final String _username;
  final String date;

  Review({
    required this.rating,
    required this.comment,
    required String username,
    required this.date,
  }) : _username = username;

  String get username => _username.replaceAllMapped(
        RegExp(r'\b\w+'),
        (match) {
          String word = match.group(0) ?? '';
          if (word.length <= 1) return word; // Tek harfli kelimeler için
          return '${word[0]}${'*' * (word.length - 1)}';
        },
      );

  @override
  bool operator ==(covariant Review other) {
    if (identical(this, other)) return true;

    return other.rating == rating &&
        other.comment == comment &&
        other.username == username &&
        other.date == date;
  }

  @override
  int get hashCode {
    return rating.hashCode ^
        comment.hashCode ^
        username.hashCode ^
        date.hashCode;
  }
}
