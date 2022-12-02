import 'package:oshpazuz/vars.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      initialIndex: 3,
      length: 4,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: kbottomNavColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              margin: const EdgeInsets.only(left: 12, top: 12),
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.menu),
                    Icon(Icons.search),
                    RotatedBox(
                      quarterTurns: 3,
                      child: TabBar(
                        indicatorColor: kbottomNavColor,
                        isScrollable: true,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          tabBar('Food'),
                          tabBar('Ichimliklar'),
                          tabBar('Fast food'),
                          tabBar('Ovqatlar')
                        ],
                      ),
                    ),
                  ]),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    const Text('Simple food with'),
                    Text(
                      'Oshpaz.uz',
                      style: GoogleFonts.oregano(
                        fontSize: 65,
                        color: const Color(0xFF43AEA4),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SizedBox(
                    width: maxWidth - 67,
                    child: TabBarView(
                      children: [
                        tabbarView(food, maxWidth, maxHeight),
                        tabbarView(drinks, maxWidth, maxHeight),
                        tabbarView(snacks, maxWidth, maxHeight),
                        tabbarView(foods, maxWidth, maxHeight),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
