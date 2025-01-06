class CategoryEntity {
  final int id;
  final String name;
  final String label;
  final String? icon;
  final int order;
  final bool isActive;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.label,
    this.icon,
    this.order = 0,
    this.isActive = true,
  });
}
