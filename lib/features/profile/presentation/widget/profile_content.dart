import 'package:flutter/material.dart';
import 'package:topnews/features/profile/domain/entity/user_profile_entity.dart';

class ProfileContent extends StatelessWidget {
  final UserProfileEntity user;

  const ProfileContent({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // TODO: 显示用户的文章列表
    return const Placeholder(
      fallbackHeight: 200,
    );
  }
}
