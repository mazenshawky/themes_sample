import 'package:flutter/material.dart';
import 'package:themes_sample/utils/app_theme.dart';
import 'package:themes_sample/injection_container.dart' as di;

class MyText extends StatefulWidget {
  const MyText({super.key, required this.text});

  final String text;

  @override
  State<MyText> createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  final AppTheme appTheme = di.sl<AppTheme>();
  late bool isDarkMode;
  
  @override
  void initState() {
    appTheme.addListener(_themeListener);
    super.initState();
  }

  @override
  void dispose() {
    appTheme.removeListener(_themeListener);
    super.dispose();
  }

  _themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  // This helps to rebuild the widget with the new text color when device theme is changed
  @override
  void didChangeDependencies() {
    MediaQuery.of(context).platformBrightness;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode = appTheme.isDarkMode();
    return Text(
      widget.text,
      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
    );
  }
}
