import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MaterialApp(home: XylophonePage()));
}

class XylophonePage extends StatefulWidget {
  const XylophonePage({super.key});

  @override
  State<XylophonePage> createState() => _XylophonePageState();
}

class _XylophonePageState extends State<XylophonePage> {
  void playSound(int soundNumber) async {
    final player = AudioPlayer();
    final soundFiles = [
      '4092-mango-phonk.mp3',
      'anak-ka-ng-puuu.mp3',
      'ding-dong-eat-it-up-indian-version.mp3',
      'indian-scammer-raging.mp3',
      'indian-songs.mp3',
      'indian-sorry.mp3',
      'mr-incredible-becoming-uncanny-phase-1.mp3',
      'ph-intro-x-see-you-again.mp3',
      'phonmk-brr.mp3',
      'photo.mp3',
      'sad-meow-song.mp3',
      'shocked-sound-effect.mp3',
    ];
    await player.play(AssetSource('newaudio/${soundFiles[soundNumber - 1]}'));
  }

  Widget buildPad({required int soundNumber, required Color color}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
          side: const BorderSide(color: Color(0xFF374151), width: 2),
        ),
      ),
      onPressed: () {
        playSound(soundNumber);
      },
      child: const SizedBox.expand(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttonColors = <Color>[
      const Color(0xFF67E457),
      const Color(0xFF8BE979),
      const Color(0xFFB8F2AE),
      const Color(0xFFE9D7AE),
      const Color(0xFFE9C67A),
      const Color(0xFFEDB85A),
      const Color(0xFFE95663),
      const Color(0xFFE79AA2),
      const Color(0xFFEED4DA),
      const Color(0xFFB4A7D6),
      const Color(0xFF92C5DE),
      const Color(0xFFFFC857),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 360,
            height: 680,
            margin: const EdgeInsets.all(18),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(42),
              border: Border.all(color: const Color(0xFF1F2937), width: 5),
            ),
            child: Column(
              children: [
                Container(
                  width: 92,
                  height: 20,
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: const Color(0xFF111827),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const Text(
                  'CEtO SOUNDBOARD',
                  style: TextStyle(
                    fontSize: 38,
                    letterSpacing: 2,
                    color: Color(0xFF374151),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 26),
                Expanded(
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 12,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 14,
                      childAspectRatio: 1.05,
                    ),
                    itemBuilder: (context, index) {
                      return buildPad(
                        soundNumber: index + 1,
                        color: buttonColors[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}