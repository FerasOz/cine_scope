import 'package:json_annotation/json_annotation.dart';
import 'review_model.dart';

part 'reviews_response_model.g.dart';

@JsonSerializable()
class ReviewsResponseModel {
  final List<ReviewModel> results;

  ReviewsResponseModel({required this.results});

  factory ReviewsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewsResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ReviewsResponseModelToJson(this);
}