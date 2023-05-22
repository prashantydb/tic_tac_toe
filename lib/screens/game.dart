import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool oTurn = true;
  List<String> displayXO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  static var customFontWhite = GoogleFonts.coiny(
    textStyle: TextStyle(
      color: Colors.white,
      letterSpacing: 3,
      fontSize: 20,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Maincolor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(flex: 1, child: Center(child: Text('Score Board'))),
            Expanded(
                flex: 3,
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 5,
                              color: Maincolor.primaryColor,
                            ),
                            color: Maincolor.secondaryColor),
                        child: Center(
                          child: Text(
                            displayXO[index],
                            style: GoogleFonts.coiny(
                              textStyle: TextStyle(
                                  fontSize: 64, color: Maincolor.primaryColor),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )),
            Expanded(flex: 2, child: Text('Timmer')),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
      } else {
        displayXO[index] = 'X';
      }
      oTurn = !oTurn;
    });
  }
}
