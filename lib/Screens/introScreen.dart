import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF43AEA4),
      body: Center(
          child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/mainPage');
        },
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Container(
              width: 330.0,
              height: 330.0,
              decoration: const BoxDecoration(
                color: Color(0xFF2DCBBC),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 270.0,
              height: 270.0,
              decoration: const BoxDecoration(
                color: Color(0xFF75F4E8),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 200.0,
              height: 200.0,
              decoration: const BoxDecoration(
                color: Color(0xFFC5F9F4),
                shape: BoxShape.circle,
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Text('Oshpaz.uz',
                    style: GoogleFonts.oregano(
                        fontSize: 65, color: const Color(0xFF43AEA4)))
              ],
            )
          ],
        ),
      )),
    );
  }
}
