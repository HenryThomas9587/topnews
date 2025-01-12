enum UserType {
  personal(name: 'personal', label: 'Personal'),
  publisher(name: 'publisher', label: 'Publisher'),
  author(name: 'author', label: 'Author');

  final String name;
  final String label;
  const UserType({required this.name, required this.label});

  static UserType fromString(String? name) {
    if (name == null) return UserType.personal;
    return UserType.values.firstWhere(
      (e) => e.name == name,
      orElse: () => UserType.personal,
    );
  }
}
