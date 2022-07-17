import 'package:oshpazuz/Screens/insideRecipe.dart';
import 'package:oshpazuz/vars.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<Color> differ_section = [
  Colors.black,
  Colors.grey,
  Colors.grey,
  Colors.grey,
];

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

List<Recipe>? currentSection;

class _HomePageState extends State<HomePage> {
  @override
  List<Recipe> currentSection = salads;
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: kbottomNavColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
            margin: const EdgeInsets.only(left: 12, top: 12),
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.menu),
                  const Icon(Icons.search),
                  InkWell(
                    onTap: () {
                      if (differ_section[0] != Colors.black) {
                        setState(() {
                          currentSection = salads;
                          changeSection(differ_section, 0);
                        });
                      }
                    },
                    child: RotatedBox(
                        quarterTurns: 3,
                        child: Text('Salads',
                            style: TextStyle(
                                fontSize: 20, color: differ_section[0]))),
                  ),
                  InkWell(
                    onTap: () {
                      if (differ_section[1] != Colors.black) {
                        setState(() {
                          currentSection = snacks;
                          changeSection(differ_section, 1);
                        });
                      }
                    },
                    child: RotatedBox(
                        quarterTurns: 3,
                        child: Text('Snacks',
                            style: TextStyle(
                                fontSize: 20, color: differ_section[1]))),
                  ),
                  InkWell(
                    onTap: () {
                      if (differ_section[2] != Colors.black) {
                        setState(() {
                          currentSection = drinks;
                          changeSection(differ_section, 2);
                        });
                      }
                    },
                    child: RotatedBox(
                        quarterTurns: 3,
                        child: Text('Drinks',
                            style: TextStyle(
                                fontSize: 20, color: differ_section[2]))),
                  ),
                  InkWell(
                    onTap: () {
                      if (differ_section[3] != Colors.black) {
                        setState(() {
                          currentSection = food;
                          changeSection(differ_section, 3);
                        });
                      }
                    },
                    child: RotatedBox(
                        quarterTurns: 3,
                        child: Text('Food',
                            style: TextStyle(
                                fontSize: 20, color: differ_section[3]))),
                  )
                ]),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Column(children: [
              const Text('Simple food with'),
              Text('Oshpaz.uz',
                  style: GoogleFonts.oregano(
                      fontSize: 65, color: const Color(0xFF43AEA4)))
            ]),
            Expanded(
              child: Container(
                //height: maxHeight * 0.5,
                width: maxWidth - 66,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: currentSection.length,
                    itemBuilder: ((context, index) {
                      return SizedBox(
                        width: 250,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 70.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          InsideRecipe(currentSection[index])));
                            },
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFC0F4EF),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  width: maxWidth * 0.5,
                                  height: maxHeight * 0.5,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 0),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(currentSection[index].name,
                                                  style: GoogleFonts.oregano(
                                                      fontSize: 30)),
                                              Text(
                                                  currentSection[index]
                                                      .briefDescription,
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(children: [
                                                const Icon(Icons.outdoor_grill),
                                                Text(
                                                    '${currentSection[index].cookingTime} min',
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 14))
                                              ]),
                                              const SizedBox(width: 5),
                                              InkWell(
                                                child: Row(children: [
                                                  const Icon(Icons.thumb_up),
                                                  Text(
                                                    currentSection[index]
                                                        .numOfLikes
                                                        .toString(),
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 14),
                                                  )
                                                ]),
                                              ),
                                            ],
                                          )
                                        ]),
                                  ),
                                ),
                                Positioned(
                                  bottom: maxHeight * 0.5,
                                  right: -maxWidth * 0.01,
                                  child: Image.asset(
                                    currentSection[index].photo,
                                    width: 200,
                                    height: 200,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
              ),
            )
          ])
        ],
      ),
    );
  }
}
