import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

double heighPlayerTop = 410;
double heighPlayerBottom = 410;
double increment = 10;

String winner = "";
bool isWinnerDeclared = false;

resetGame() {
  heighPlayerBottom = 410;
  heighPlayerTop = 410;
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  AudioPlayer().play(AssetSource('audio/tap2.wav'));
                  setState(
                    () {
                      heighPlayerTop = heighPlayerTop + increment;

                      heighPlayerBottom - increment >= 0
                          ? heighPlayerBottom = heighPlayerBottom - increment
                          : heighPlayerBottom;

                      //check winner
                      if (heighPlayerTop <= 0) {
                        isWinnerDeclared = true;
                        AudioPlayer().play(AssetSource('audio/winner.wav'));
                        winner = "Green is the winner";
                      } else if (heighPlayerBottom <= 0) {
                        isWinnerDeclared = true;
                        AudioPlayer().play(AssetSource('audio/winner.wav'));
                        winner = "Red is the winner";
                      }
                    },
                  );
                },
                child: Container(
                  color: Colors.red,
                  height: heighPlayerTop,
                ),
              ),
              InkWell(
                onTap: () {
                  AudioPlayer().play(AssetSource('audio/tap2.wav'));
                  setState(() {
                    heighPlayerTop - increment >= 0
                        ? heighPlayerTop = heighPlayerTop - increment
                        : heighPlayerTop;
                    heighPlayerBottom = heighPlayerBottom + increment;

                    //check winner
                    if (heighPlayerTop <= 0) {
                      AudioPlayer().play(AssetSource('audio/winner.wav'));
                      winner = "Green is the winner";
                    } else if (heighPlayerBottom <= 0) {
                      AudioPlayer().play(AssetSource('audio/winner.wav'));
                      winner = "Red is the winner";
                    }
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
