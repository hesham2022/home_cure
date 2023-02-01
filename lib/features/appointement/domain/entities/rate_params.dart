import 'dart:convert';

class RatingParams {
  RatingParams({
    required this.review,
    required this.rating,
    required this.service,
    required this.appointmentId,
  });

  final String review;
  final double rating;
  final String service;
  final String appointmentId;

  RatingParams copyWith({
    String? review,
    double? rating,
    String? service,
    String? appointmentId,
  }) {
    return RatingParams(
      review: review ?? this.review,
      rating: rating ?? this.rating,
      service: service ?? this.service,
      appointmentId: appointmentId ?? this.appointmentId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'review': review,
      'rating': rating,
      'service': service,
      'appointmentId': appointmentId
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'RatingParams(review: $review, rating: $rating, service: $service)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RatingParams &&
        other.review == review &&
        other.rating == rating &&
        other.service == service;
  }

  @override
  int get hashCode => review.hashCode ^ rating.hashCode ^ service.hashCode;
}
