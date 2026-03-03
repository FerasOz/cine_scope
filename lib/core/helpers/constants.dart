import 'package:cine_scope/features/bottom_nav/home/data/models/media_model.dart';

enum RequestsStatus { initial, loading, success, error }

extension MediaTypeExtension on MediaType {
  String get value {
    switch (this) {
      case MediaType.movie:
        return "movie";
      case MediaType.tv:
        return "tv";
    }
  }
}
