import 'package:flutter/services.dart';

class SoundboardData {
  static const List<String> audioFiles = [
    'alert.mp3',
    'Explosion.wav',
    'arrival.wav',
    'high manuver.wav',
    'jump.wav',
    'kick.wav',
    'kill shot.wav',
    'lift off.wav',
    'newtype.mp3',
    'punch.wav',
    'shooting.wav',
    'shot.wav',
  ];

  static Future<List<ByteData>> loadAllAudio() async {
    List<ByteData> audioData = [];
    for (final file in audioFiles) {
      final data = await rootBundle.load('lib/src/soundboard/$file');
      audioData.add(data);
    }
    return audioData;
  }
}
