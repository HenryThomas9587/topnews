import 'package:freezed_annotation/freezed_annotation.dart';

part 'publisher_entity.freezed.dart';

@freezed
class PublisherEntity with _$PublisherEntity {
  const factory PublisherEntity({
    required String id,
    required String name,
    required String imageUrl,
    required bool isFollowing,
  }) = _PublisherEntity;
}