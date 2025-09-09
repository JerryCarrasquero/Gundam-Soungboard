import 'package:flutter/material.dart';
import 'package:gundam_sound_board/feature/mainPage/presentation/screen/soundboard_list_screen.dart';
import 'package:gundam_sound_board/theming/soundboard_theme_builder.dart';
import 'package:gundam_sound_board/theming/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SoundboardThemeBuilder(
      theme: materialTheme,
      child: MaterialApp(
        title: 'Gundam sound board',
        theme: materialTheme,
        home: SoundboardListScreen(),
      ),
    );
  }
}
