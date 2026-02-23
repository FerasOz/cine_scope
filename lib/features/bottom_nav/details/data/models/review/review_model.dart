import 'package:json_annotation/json_annotation.dart';

part 'review_model.g.dart';

@JsonSerializable()
class ReviewModel {
  final String author;
  final String content;

  @JsonKey(name: 'author_details')
  final AuthorDetails? authorDetails;

  ReviewModel({
    required this.author,
    required this.content,
    this.authorDetails,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);

  String get imageUrl {
    final avatarPath = authorDetails?.avatarPath;
    if (avatarPath == null) return "";

    if (avatarPath.startsWith("/http")) {
      return avatarPath.substring(1);
    }

    return "https://image.tmdb.org/t/p/w500$avatarPath";
  }
}

@JsonSerializable()
class AuthorDetails {
  @JsonKey(name: 'avatar_path')
  final String? avatarPath;

  AuthorDetails({this.avatarPath});

  factory AuthorDetails.fromJson(Map<String, dynamic> json) =>
      _$AuthorDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorDetailsToJson(this);
}
