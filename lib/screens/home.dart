import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

double heighPlayerTop = 400;
double heighPlayerBottom = 400;
String winner = "";

checkwinner() {
  if (heighPlayerTop == 0) {
    AudioPlayer().play(AssetSource('audio/winner.wav'));
    winner = "Red is the winner";
  } else if (heighPlayerBottom == 0) {
    AudioPlayer().play(AssetSource('audio/winner.wav'));
    winner = "Green is the winner";
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  AudioPlayer().play(AssetSource('audio/tap.wav'));
                  setState(() {
                    heighPlayerTop = heighPlayerTop + 10;
                    heighPlayerBottom = heighPlayerBottom - 10;
                    checkwinner();
                  });
                },
                child: Container(
                  color: Colors.red,
                  height: heighPlayerTop,
                ),
              ),
              InkWell(
                onTap: () {
                  AudioPlayer().play(AssetSource('audio/tap.wav'));
                  setState(() {
                    heighPlayerTop = heighPlayerTop - 10;
                    heighPlayerBottom = heighPlayerBottom + 10;
                    checkwinner();
                    print(heighPlayerBottom);
                  });
                },
                child: Container(
                  color: Colors.green,
                  height: heighPlayerBottom,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
