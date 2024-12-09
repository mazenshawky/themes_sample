import 'package:flutter/material.dart';
import 'package:themes_sample/screens/components/check_icon.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: CheckIcon()),
      ],
    );
  }
}
