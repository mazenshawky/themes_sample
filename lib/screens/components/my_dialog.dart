import 'package:flutter/material.dart';
import 'package:themes_sample/utils/app_theme.dart';
import 'package:themes_sample/injection_container.dart' as di;

class MyDialog extends StatefulWidget {
  const MyDialog({super.key});

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  late int? value;

  final themeModes = [
    'System',
    'Light',
    'Dark',
  ];

  final AppTheme appTheme = di.sl<AppTheme>();

  @override
  void initState() {
    final ThemeMode themeMode = appTheme.getThemeMode();
    switch (themeMode) {
      case ThemeMode.system:
      value = 0;
      case ThemeMode.light:
      value = 1;
      case ThemeMode.dark:
      value = 2;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      alignment: Alignment.centerLeft,
      title: const Text('Choose theme'),
      content: SizedBox(
        height: 200,
        width: MediaQuery.sizeOf(context).width * 0.8,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: themeModes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {
                        setState(() => value = index);
                      },
                      leading: Radio(
                        activeColor: Colors.green,
                        value: index,
                        groupValue: value,
                        onChanged: (i) {
                          setState(() => value = i);
                        },
                      ),
                      title: Text(
                        themeModes[index],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.green),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(value);
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.green),
          ),
        ),
      ],
    );
  }
}
