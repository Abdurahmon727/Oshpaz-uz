import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import 'pages/insideRecipe.dart';

var localStorage = Hive.box('myBox');

void settingsOnChangedHive() {
  localStorage.put('settingsInfo', {
    'language': currentLanguage,
    'theme': currentTheme,
    'appFontSize': currentFontSize,
    'recipeFontSize': currentRecipeFontSize
  });
}

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
final kActiveBarTextStyle = TextStyle(fontSize: 20, color: Colors.black);
final kUnactiveBarTextStyle = TextStyle(fontSize: 20, color: Colors.grey);

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
      '1.Make the dressing: In a small bowl, whisk together the olive oil, vinegar, garlic, oregano, mustard, salt, and several grinds of pepper.\n\n2.On a large platter, arrange the cucumber, green pepper, cherry tomatoes, feta cheese, red onions, and olives. Drizzle with the dressing and very gently toss. Sprinkle with a few generous pinches of oregano and top with the mint leaves. Season to taste and serve.',
      20,
      203,
      true,
      'images/geekSalad.png',
      150),
  Recipe(
      'Olivie',
      'This Olivier Salad (Russian Potato Salad) recipe is a traditional dish in the Russian cuisine and served in most restaurants and parties. This salad is commonly known as the Russian salad and Olivye in the Ukrainian community.',
      '1.In a large pot, add potatoes and carrots. Cover completely with water. Bring to a boil and cook about 20-25 minutes or until a knife pierces through easily. (Don’t overcook. Remove carrots and potatoes from water, set aside to cool).\n\n2.In a small pot, add eggs, cover eggs will water and bring to a boil cook. Cook eggs 8-10 minutes. \n\n3.Cube all of the ingredients. \n\n4.Combine everything, mix. Add mayo to taste. You may need a little more than 1 cup, depending on sizes of your ingredients.\n\n5.Season with salt, pepper and sugar. Add fresh dill, mix. ',
      35,
      359,
      false,
      'images/olivie.png',
      200)
];
List<Recipe> snacks = [
  Recipe(
      'Browni',
      'A delicious and decadent Brownie Cake made from scratch. This moist and tender cake is made using real chocolate and boasts a crackly, meringue-like crust. This chocolate cake is one of the best things to come out of the Sweetest Menu kitchen this year. Just like a regular brownie, it has a that soft centre that tastes oh-so-chocolately. Mine is also studded with chocolate chips and crunchy walnuts - optional of course, but totally worth it.',
      '1.I recommend making this cake in a springform pan as it is very delicate and fragile. Removing it from a regular cake pan can be difficult (but not impossible).\n2.Just like a regular brownie, this recipe begins by melting together butter and dark chocolate. I recommend using a good quality dark chocolate, between 45-70% cocoa.\n3.Carefully separate your eggs, ensuring no egg yolk falls into the egg whites.\n4.Start beating your egg whites and your caster sugar using an electric mixer on medium speed. If you don’t have caster sugar, you can use granulated sugar instead.\n5.You want to beat your eggs until thick and voluminous. They should turn white in colour and be thick enough to hold their shape and not drip – you should be able to turn the bowl upside down without anything falling out.\n6.Meanwhile, add your egg yolks to your melted butter and chocolate mixture. Stir to combine. Then add your flour, cocoa powder and salt.\n7.Carefully and slowly fold in your egg whites by hand, making sure you don\'t deflate all the air out of the egg whites.\n7.Finally, fold through chocolate chips and walnuts if using.\n8.Bake cake for approximately 40-50 minutes or until it’s cracked on top and no longer wobbles in the middle. Leave your cake in the cake pan to cool completely – it will be very fragile when you first take it out of the oven.\n9.You can enjoy the cake once it’s cooled or place it in the fridge until you are ready to serve. It’ll go extra fudgy in the fridge!',
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

Container tabBar(String text) {
  return Container(
    height: 20,
    width: 70,
    child: Center(
      child: Text(text, style: TextStyle(fontSize: 20)),
    ),
  );
}

ListView tabbarView(List<Recipe> a, double maxWidth, double maxHeight) {
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: a.length,
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
                        builder: (context) => InsideRecipe(a[index])));
              },
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Color(0xFFC0F4EF),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    width: maxWidth * 0.5,
                    height: maxHeight * 0.5,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(a[index].name,
                                    style: GoogleFonts.oregano(fontSize: 30)),
                                Text(
                                  a[index].briefDescription,
                                  style: GoogleFonts.roboto(fontSize: 14),
                                  maxLines: (maxWidth * 0.4 / 14).ceil(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(children: [
                                  const Icon(Icons.outdoor_grill),
                                  Text('${a[index].cookingTime} min',
                                      style: GoogleFonts.roboto(fontSize: 14))
                                ]),
                                const SizedBox(width: 5),
                                InkWell(
                                  child: Row(children: [
                                    const Icon(Icons.thumb_up),
                                    Text(
                                      a[index].numOfLikes.toString(),
                                      style: GoogleFonts.roboto(fontSize: 14),
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
                      a[index].photo,
                      width: 200,
                      height: 200,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }));
}
