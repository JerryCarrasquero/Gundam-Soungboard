import 'package:flutter/services.dart';
import '../model/soundboard_item.dart';
import 'soundboard_data.dart';

class SoundboardRepository {
  Future<List<SoundboardItem>> loadItems() async {
    final List<SoundboardItem> items = [];
    for (final fileName in SoundboardData.audioFiles) {
  final String audioPath = 'soundboard/$fileName';
      final String imagePath = 'assets/images/${fileName.split('.').first}.png';
      final String title = fileName.split('.').first.replaceAll('_', ' ');
      print('audioPath: ' + audioPath);
      print('imagePath: ' + imagePath);
      print('title: ' + title);
      items.add(SoundboardItem(
        imagePath: imagePath,
        title: title,
        audioPath: audioPath,
      ));
    }
    return items;
  }
}
