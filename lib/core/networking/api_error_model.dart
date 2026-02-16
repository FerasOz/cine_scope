import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  @JsonKey(name: 'success')
  final bool? success;

  @JsonKey(name: 'status_code')
  final int? statusCode;

  @JsonKey(name: 'status_message')
  final String? statusMessage;

  ApiErrorModel({
    this.success,
    this.statusCode,
    this.statusMessage,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  String get errorMessage {
    return statusMessage ?? "Unknown error occurred";
  }
}