import 'package:suvido_eshop/modules/catalog/domain/review.dart';

class ReviewModel {
  final int rating;
  final String comment;
  final String username;
  final String date;

  ReviewModel({
    required this.rating,
    required this.comment,
    required this.username,
    required this.date,
  });

  ReviewModel copyWith({
    int? rating,
    String? comment,
    String? username,
    String? date,
  }) {
    return ReviewModel(
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      username: username ?? this.username,
      date: date ?? this.date,
    );
  }

  Review toEntity() {
    return Review(
      rating: rating,
      comment: comment,
      username: username,
      date: date,
    );
  }

  @override
  bool operator ==(covariant ReviewModel other) {
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
