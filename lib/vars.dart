import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String? currentLanguage = 'English';
String? currentTheme = 'Light';
int? currentFontSize = 12;
int? currentRecipeFontSize = 8;

const Color kbottomNavColor = Color.fromRGBO(239, 239, 239, 1);

Row getLinks(IconData icon, String string) => Row(
      children: [
        Icon(icon, size: 15),
        SizedBox(width: 5),
        Text(string, style: GoogleFonts.workSans(fontSize: 15))
      ],
    );

BoxDecoration mainDecoration() {
  return const BoxDecoration(
      color: Color(0xFFC0F4EF),
      borderRadius: BorderRadius.all(Radius.circular(15)));
}

TextStyle kmainStyle(double size) => GoogleFonts.workSans(
      fontSize: size,
    );
const Color kmainColor = Color(0xFFC0F4EF);

var listReviews = Container(
  padding: EdgeInsets.all(5),
  decoration: BoxDecoration(
    color: kmainColor,
    borderRadius: BorderRadius.circular(10),
  ),
  height: 85,
  width: double.infinity,
  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
  child: Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                child: ClipRRect(
                  child: Image.asset('images/avatar.png'),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                radius: 15,
              ),
              SizedBox(width: 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Emma Watson',
                    style: GoogleFonts.workSans(fontSize: 15),
                  ),
                  Text(
                    '43 min ago',
                    style: GoogleFonts.workSans(fontSize: 10),
                  )
                ],
              )
            ],
          ),
          Row(
            children: const [
              Icon(
                Icons.favorite,
                size: 15,
              ),
              SizedBox(width: 5),
              Icon(
                Icons.share,
                size: 15,
              ),
            ],
          )
        ],
      ),
      Text(
        'Today I tried to make kebab by your recipe. It was mouth-watering.Tomorrow i am going to make another food by your recipe, thanks a lot :)  ',
        textAlign: TextAlign.left,
        style: GoogleFonts.workSans(fontSize: 12),
      )
    ],
  ),
);
var listYourRecipies = Container(
  padding: EdgeInsets.all(5),
  decoration: BoxDecoration(
    color: kmainColor,
    borderRadius: BorderRadius.circular(10),
  ),
  height: 70,
  width: double.infinity,
  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
  child: Column(children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              child: ClipRRect(
                child: Image.asset('images/western food.png'),
                borderRadius: BorderRadius.circular(50.0),
              ),
              radius: 15,
            ),
            SizedBox(width: 2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'name Recipe',
                  style: GoogleFonts.workSans(fontSize: 15),
                ),
                Text(
                  '12 hours ago published',
                  style: GoogleFonts.workSans(fontSize: 10),
                )
              ],
            )
          ],
        ),
        Icon(Icons.edit, size: 15),
      ],
    ),
    Text(
      'By this recipe you can easily cook Western food as real chef. Do\'nt shy let\'s test it out',
      style: GoogleFonts.workSans(fontSize: 12),
    )
  ]),
);
var kActiveBarTextStyle = const TextStyle(fontSize: 20, color: Colors.black);
var kUnactiveBarTextStyle = const TextStyle(fontSize: 20, color: Colors.grey);

void changeSection(List<Color> a, int n) {
  for (int i = 0; i < 4; i++) {
    if (a[i] == Colors.black) a[i] = Colors.grey;
  }
  a[n] = Colors.black;
}

class Recipe {
  Recipe(
      this.name,
      this.briefDescription,
      this.fullDescription,
      this.cookingTime,
      this.numOfLikes,
      this.liked,
      this.photo,
      this.callories);
  String name;
  String briefDescription;
  String fullDescription;
  int cookingTime;
  int numOfLikes;
  bool liked;
  String photo;
  int callories;
}

List<Recipe> salads = [
  Recipe(
      'Greek Salad',
      'A traditional Greek salad dressing is really a Greek vinaigrette as it contains olive oil, red wine vinegar, lemon juice, Dijon mustard, minced garlic cloves and  dried oregano.',
      'full description for Greek salad\ndawdwa',
      20,
      203,
      true,
      'images/geekSalad.png',
      150),
  Recipe(
      'Olivie',
      'Bring a large pot of water to a boil; add potatoes and carrot. Return mixture to a boil and add eggs; cook until potatoes are tender, 20 to 30 minutes. ...',
      ' for Olivie',
      35,
      359,
      false,
      'images/olivie.png',
      200)
];
List<Recipe> snacks = [
  Recipe(
      'Browni',
      'This is so delicous amoung black snacks, it may take more time, but Trust me this snack deserves',
      'Unfortunately I don\'t know how to cook :((((((((((',
      50,
      6786,
      false,
      'images/browni snack.png',
      350),
  Recipe(
      'Butter cooky',
      'This snack is amoung my favourites too, due to less time to making it and its taste',
      'Actually I am not good recipe makes don\'t make me stressed',
      25,
      3451,
      true,
      'images/butter cookies.png',
      110),
  Recipe(
      'Chip oil fried',
      'This is best Fried i have ever tasted. But it takes little more time than regular frieds',
      'fullDescription',
      45,
      23415,
      false,
      'images/chip oil fried.png',
      130),
  Recipe(
      'French fries',
      'The most popular type of friy due to both less cooking time and taste',
      'fullDescription for French fries',
      35,
      23450,
      false,
      'images/french fries.png',
      70)
];
List<Recipe> drinks = [
  Recipe(
      'Cockail',
      'All of us want to drink coctails. But they are not cheap. By this recipe you can make your own cocktail',
      'fullDescription for coctail recipe',
      45,
      3456,
      false,
      'images/cockail.png',
      65),
  Recipe(
      'Iced milk tea',
      'Vey delicious tea i have ever drunk',
      'fullDescription for iced tea milk',
      15,
      3425,
      true,
      'images/iced milk tea.png',
      35),
  Recipe(
      'Orange juice',
      'Everyone love is here with full making prosecc',
      'fullDescription for orange juice',
      30,
      1235,
      false,
      'images/orange juice.png',
      50),
  Recipe(
      'Tequila cocktail',
      'If you want to taske more luxury and expansive cocktail this is for you',
      'fullDescription for tequila cocktail',
      50,
      23455,
      true,
      'images/tequila cocktail.png',
      75)
];
List<Recipe> food = [
  Recipe(
      'Northeast rice',
      'Just description',
      'fullDescription for This Northeast rice',
      60,
      450,
      true,
      'images/northeast rice.png',
      140),
  Recipe(
      'Western food 1',
      'briefDescription for Western food 1',
      'fullDescription for western food',
      90,
      45003,
      false,
      'images/western food.png',
      150)
];
