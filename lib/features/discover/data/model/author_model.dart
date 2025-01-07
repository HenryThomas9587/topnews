import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:topnews/features/discover/domain/entity/author_entity.dart';

part 'author_model.freezed.dart';
part 'author_model.g.dart';

@freezed
class AuthorModel with _$AuthorModel {
  const factory AuthorModel({
    required String id,
    required String name,
    required String imageUrl,
    @Default(false) bool isFollowing,
  }) = _AuthorModel;

  factory AuthorModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorModelFromJson(json);
}

extension AuthorModelX on AuthorModel {
  AuthorEntity toEntity() {
    return AuthorEntity(
      id: id,
      name: name,
      imageUrl: imageUrl,
      isFollowing: isFollowing,
    );
  }
}
