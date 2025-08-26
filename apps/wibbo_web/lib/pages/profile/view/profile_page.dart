import 'package:flutter/material.dart';
import 'package:wibbo_web/pages/profile/view/profile_view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static Page<void> page() => const MaterialPage<void>(
    fullscreenDialog: true,
    child: ProfilePage(),
  );

  @override
  Widget build(BuildContext context) {
    return const ProfileView();
  }
}
