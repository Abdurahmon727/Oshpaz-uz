import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oshpazuz/vars.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(InsideRecipe(salads[0]));
}

class InsideRecipe extends StatelessWidget {
  final Recipe currentRecipe;
  InsideRecipe(this.currentRecipe);
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffC0F4F0),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.share),
                              SizedBox(width: 10),
                              Icon(Icons.favorite)
                            ],
                          ),
                          Icon(Icons.bookmark),
                        ]),
                    Container(
                        height: 200, child: Image.asset(currentRecipe.photo)),
                    Text(
                      currentRecipe.name,
                      style: GoogleFonts.oregano(fontSize: 35),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.outdoor_grill),
                            Text('${currentRecipe.cookingTime} min',
                                style: GoogleFonts.roboto(fontSize: 16))
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.local_fire_department),
                            Text(
                              '${currentRecipe.callories} cal',
                              style: GoogleFonts.roboto(fontSize: 16),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          currentRecipe.fullDescription,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.oregano(fontSize: 16),
                        )
                      ],
                    )
                  ]),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
