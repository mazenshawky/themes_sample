import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themes_sample/utils/app_theme.dart';
import 'package:themes_sample/injection_container.dart' as di;

class CheckIcon extends StatefulWidget {
  const CheckIcon({super.key});

  @override
  State<CheckIcon> createState() => _CheckIconState();
}

class _CheckIconState extends State<CheckIcon> {
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
    return isDarkMode
        ? SvgPicture.asset('assets/icons/check_dark.svg')
        : SvgPicture.asset('assets/icons/check_light.svg');
  }
}
