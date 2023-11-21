import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const Xylophone());
}

class Xylophone extends StatelessWidget {
  const Xylophone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(
          title: const Center(child: Text('Xylophone')),
          backgroundColor: Colors.grey[800],
        ),

        body: const SafeArea(
          child: Xylo(),
        ),
      ),
    );
  }
}

class Xylo extends StatefulWidget {
  const Xylo({super.key});

  @override
  State<Xylo> createState() => _XyloState();
}

class _XyloState extends State<Xylo> {

  Expanded playMusic(int n, Color bgColor){
    return Expanded(
      child: ElevatedButton(
        onPressed: () async{
          final player = AudioPlayer();
          player.play(AssetSource('note$n.wav'));
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: bgColor,
        ),
        child: Text('Touch me: Key $n'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        playMusic(1, Colors.blue.shade200),
        playMusic(2, Colors.blue.shade300),
        playMusic(3, Colors.blue.shade400),
        playMusic(4, Colors.blue.shade500),
        playMusic(5, Colors.blue.shade600),
        playMusic(6, Colors.blue.shade700),
        playMusic(7, Colors.blue.shade800),
      ],
    );
  }
}
