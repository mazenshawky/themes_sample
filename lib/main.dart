import 'package:flutter/material.dart';
import 'package:themes_sample/screens/main_screen.dart';
import 'package:themes_sample/utils/app_theme.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  final AppTheme appTheme = di.sl<AppTheme>();
  runApp(MyApp(appTheme: appTheme));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.appTheme});

  final AppTheme appTheme;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    widget.appTheme.addListener(_themeListener);
    super.initState();
  }

  @override
  void dispose() {
    widget.appTheme.removeListener(_themeListener);
    super.dispose();
  }

  _themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
      theme: AppTheme.getLightTheme(),
      darkTheme: AppTheme.getDarkTheme(),
      themeMode: widget.appTheme.getThemeMode(),
    );
  }
}
