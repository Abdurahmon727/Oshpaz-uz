import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oshpazuz/vars.dart';

class InsideRecipe extends StatelessWidget {
  final Recipe currentRecipe;
  InsideRecipe(this.currentRecipe);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 100,
                backgroundColor: const Color(0xffC0F4F0),
                leading: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(30),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.share),
                                SizedBox(width: 10),
                                Icon(Icons.favorite)
                              ],
                            ),
                            Icon(Icons.bookmark),
                          ]),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SizedBox(
                            height: 200,
                            child: Image.asset(currentRecipe.photo)),
                      ),
                      Center(
                        child: Text(
                          currentRecipe.name,
                          style: GoogleFonts.oregano(fontSize: 35),
                        ),
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
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Text(
                        currentRecipe.briefDescription,
                        style: GoogleFonts.oregano(fontSize: 16),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Let\'s make it:',
                        style: GoogleFonts.oregano(fontSize: 20),
                      ),
                      Text(
                        currentRecipe.fullDescription,
                        style: GoogleFonts.oregano(fontSize: 16),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
