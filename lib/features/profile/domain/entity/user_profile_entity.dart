class UserProfileEntity {
  final String id;
  final String fullName;
  final String username;
  final String bio;
  final String avatarUrl;
  final String website;
  final int stories;
  final int followers;
  final int following;

  const UserProfileEntity({
    required this.id,
    required this.fullName,
    required this.username,
    required this.bio,
    required this.avatarUrl,
    this.website = '',
    this.stories = 0,
    this.followers = 0,
    this.following = 0,
  });
}
