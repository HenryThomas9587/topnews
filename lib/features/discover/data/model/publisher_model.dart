import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:topnews/features/discover/domain/entity/publisher_entity.dart';

part 'publisher_model.freezed.dart';
part 'publisher_model.g.dart';

@freezed
class PublisherModel with _$PublisherModel {
  const factory PublisherModel({
    required String id,
    required String name,
    required String imageUrl,
    @Default(false) bool isFollowing,
  }) = _PublisherModel;

  factory PublisherModel.fromJson(Map<String, dynamic> json) =>
      _$PublisherModelFromJson(json);
}

extension PublisherModelX on PublisherModel {
  PublisherEntity toEntity() {
    return PublisherEntity(
      id: id,
      name: name,
      imageUrl: imageUrl,
      isFollowing: isFollowing,
    );
  }
}
