import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:topnews/features/news/domain/entity/category_entity.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
@HiveType(typeId: 2)
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
    @HiveField(2) required String label,
    @HiveField(3) String? icon,
    @HiveField(4) @Default(0) int order,
    @HiveField(5) @Default(true) bool isActive,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  const CategoryModel._();

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      label: label,
      icon: icon,
      order: order,
      isActive: isActive,
    );
  }

  static CategoryModel fromEntity(CategoryEntity entity) {
    return CategoryModel(
      id: entity.id,
      name: entity.name,
      label: entity.label,
      icon: entity.icon,
      order: entity.order,
      isActive: entity.isActive,
    );
  }
}
