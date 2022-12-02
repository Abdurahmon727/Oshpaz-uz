import 'package:flutter/material.dart';
import 'package:oshpazuz/vars.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Icon(
                    Icons.notifications,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add,
                        size: 30,
                      ),
                      SizedBox(width: 15),
                      Icon(
                        Icons.more_vert,
                        size: 30,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: SizedBox(
                      child: Image.asset('images/download.png'),
                      height: 130,
                      width: 130,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Jasurbek Nigmanov',
                    style: GoogleFonts.workSans(fontSize: 18),
                  ),
                  Text(
                    '@inha_studentN123',
                    style:
                        GoogleFonts.workSans(color: Colors.grey, fontSize: 12),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 100,
                  width: 85,
                  decoration: mainDecoration(),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '1.2K',
                          style: GoogleFonts.workSans(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Text(
                          'Followers',
                          style: GoogleFonts.workSans(fontSize: 13),
                        )
                      ]),
                ),
                Container(
                  height: 100,
                  width: 85,
                  decoration: mainDecoration(),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '38',
                          style: GoogleFonts.workSans(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Text(
                          'Recipies',
                          style: GoogleFonts.workSans(fontSize: 13),
                        )
                      ]),
                ),
                Container(
                  height: 100,
                  width: 85,
                  decoration: mainDecoration(),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '9.4K',
                          style: GoogleFonts.workSans(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Text(
                          'Views',
                          style: GoogleFonts.workSans(fontSize: 13),
                        )
                      ]),
                ),
              ],
            ),
            SizedBox(height: 20),
            TabBar(
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Text(
                  'Your Recipies',
                  style:
                      GoogleFonts.workSans(color: Colors.black, fontSize: 15),
                ),
                Text(
                  'Reviews',
                  style:
                      GoogleFonts.workSans(color: Colors.black, fontSize: 15),
                )
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => listYourRecipies),
                ListView.builder(
                  itemBuilder: (context, index) => listReviews,
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
