import 'package:flutter/material.dart';
import 'package:themes_sample/screens/components/my_dialog.dart';
import 'package:themes_sample/utils/app_theme.dart';
import 'package:themes_sample/injection_container.dart' as di;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  final AppTheme appTheme = di.sl<AppTheme>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () async {
            final int? value = await showDialog<int>(
              context: context,
              builder: (context) {
                return const MyDialog();
              },
            );
            _setTheme(value);
          },
          title: const Text('Theme'),
          leading: const Icon(Icons.contrast),
        )
      ],
    );
  }

  _setTheme(int? value) {
    switch (value) {
      case 0:
        appTheme.setTheme(ThemeMode.system);
      case 1:
        appTheme.setTheme(ThemeMode.light);
      case 2:
        appTheme.setTheme(ThemeMode.dark);
      case null:
        return;
      default:
        appTheme.setTheme(ThemeMode.system);
    }
  }
}
