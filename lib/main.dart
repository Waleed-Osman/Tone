import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MusicWidget());
}

class MusicWidget extends StatelessWidget {
  MusicWidget({super.key});

  Future<void> playMusic(int mN) async {
    final player = AudioPlayer();
    await player.play(AssetSource('music-$mN.mp3'));
  }

  Expanded myButton(int num, Color textColor) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: () async {
            playMusic(num);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Icon(
                  Icons.music_note,
                  color: textColor,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Play Tone $num ',
                  style: TextStyle(
                    fontSize: 20,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('نغمات'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            myButton(1, Colors.black),
            myButton(2, Colors.purple),
            myButton(3, Colors.yellow),
            myButton(4, Colors.deepOrange),
            myButton(5, Colors.tealAccent),
            myButton(6, Colors.green),
            myButton(7, Colors.purpleAccent),
          ],
        ),
      ),
    );
  }
}
