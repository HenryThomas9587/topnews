import 'package:freezed_annotation/freezed_annotation.dart';

part 'author_entity.freezed.dart';

@freezed
class AuthorEntity with _$AuthorEntity {
  const factory AuthorEntity(
      {required String id,
      required String name,
      required String imageUrl,
      required bool isFollowing,
      required String userType}) = _AuthorEntity;
}
