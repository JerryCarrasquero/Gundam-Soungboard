import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gundam_sound_board/feature/mainPage/presentation/provider/soundboard_provider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:gundam_sound_board/feature/mainPage/presentation/widget/image_button.dart';
import 'package:gundam_sound_board/theming/soundboard_toolbar.dart';

class SoundboardListScreen extends StatefulWidget {
  @override
  State<SoundboardListScreen> createState() => _SoundboardListScreenState();
}

class _SoundboardListScreenState extends State<SoundboardListScreen> {
  int? playingIndex;
  AudioPlayer? _player;

  @override
  void dispose() {
    _player?.dispose();
    super.dispose();
  }

  void playSound(String audioPath, int index) async {
    print('audioPath: ' + audioPath);
    _player?.dispose();
    final player = AudioPlayer();
    setState(() {
      playingIndex = index;
      _player = player;
    });
    await player.play(AssetSource(audioPath));
    player.onPlayerComplete.listen((_) {
      setState(() {
        playingIndex = null;
      });
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SoundboardProvider()..loadSoundboardItems(),
      child: Consumer<SoundboardProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.error != null) {
            return Center(child: Text('Error: [provider.error}'));
          }
          final items = provider.items;
          if (items == null || items.isEmpty) {
            return const Center(child: Text('No soundboard items found.'));
          }
          return Scaffold(
            appBar: const SoundboardToolbar(title: 'Soundboard'),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  const minButtonWidth = 120.0;
                  final crossAxisCount = (constraints.maxWidth / minButtonWidth).floor().clamp(1, 8);
                  final aspectRatio = constraints.maxWidth / constraints.maxHeight;
                  final isPanoramic = aspectRatio > 1.8;
                  final mainAxisSpacing = isPanoramic ? 10.0 : 2.0;
                  return Container(
                    margin: const EdgeInsets.only(top: 0),
                    child: GridView.builder(
                      padding: const EdgeInsets.only(top: 16.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        mainAxisSpacing: mainAxisSpacing,
                        crossAxisSpacing: 8,
                        childAspectRatio: 1.1,
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return ImageButton(
                          imagePath: item.imagePath,
                          title: item.title,
                          onPressed: () => playSound(item.audioPath, index),
                          imageSize: 120.0,
                          isPlaying: playingIndex == index,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
