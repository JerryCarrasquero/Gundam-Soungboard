import 'package:flutter/material.dart';

class SoundboardThemeBuilder extends StatelessWidget {
  final Widget child;
  final ThemeData? theme;

  const SoundboardThemeBuilder({
    Key? key,
    required this.child,
    this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme ?? Theme.of(context),
      child: child,
    );
  }
}
