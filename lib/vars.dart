import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import 'pages/inside_recipe.dart';

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

List<Recipe> foods = [
  Recipe(
    '"Domashnie" chuchvaralari',
    "Ushbu retsept bulonli chuchvaralar ixlosmandlari uchun. Mazali bulon tayyorlash qiyin emas. Kerakli mahsulotlar:- 2 o'ram \"Kulinar\"ning \"Domashnie\" chuchvaralari;1ta piyoz;- dafna yaprog'i bargi, tuz, ta'bga ko'ra murch.",
    "1. Qozonga suv soling va olovga qo'ying \n2. Bir bosh po'sti archilgan piyoz, dafna yaprog'i, tuz va ta'bga ko'ra murch qo'shing \n3. Suv qaynab chiqqach, \"Kulinar\"ning \"Domashnie\" chuchvaralarini soling\n4. Chuchvaralar suv yuzida suzib chiqishini kuting. Keyin yana 5-6 daqiqa davomida pishiring\n5. Tayyor!Ushbu bulonni bir osh qoshiq sirka yoki qatiq bilan dasturxonga tortish mumkin.",
    20,
    203,
    true,
    'images/chuchvara.png',
    150,
  ),
  Recipe(
    'Tovuq oyoqchalari',
    'Ha tovuq oyoqchalari kundalik hayotimizda tansiq taomlar turiga allaqachon qo\'shlib bo\'lgan, qa\'ni siz ham bu ovqatni tayyorlay olasizmi?\n Kerakli mahsulotlar: kungaboqar yog\'i - 1 stakan, un - ta\'bga ko\'ra, tuz - 0,5 choy qoshiq, sarimsoqpiyoz donasi - 1 dona, tovuq boldiri - 3-4 dona, pektin - murch- bir chimdim ',
    'Tovuqni maydaroq bo\'laklarga bo\'lib olib, suvda bir yuvib yuboramiz.Murch, tuz, maydalangan chesnok qo\'shib aralashtiramiz. Tog\'orachaga un soib tovuq bo\'lakchalarini yaxshilab botirib, qizgan yog\'ga solamiz.(yog\' tovuq bo\'lakchalarini ko\'mishi kerak).Xuddi ovqat qaynatgandey yog\'da biqir-biqir qaynaydi(10-12 daqiqa).Tayyor. Yoqimli ishtaha!\n Olov judayam baland bo\'lmasligi kerak, ichi pishmay qoladi',
    35,
    359,
    false,
    'images/chicken.png',
    200,
  ),
  Recipe(
    'Pitsa',
    "Ha o\'sha kun keldi pitsa uy sahroitida tayyorlash\nKerakli mahsulotlar: pomidor - 1 dona, kungaboqar yog'i - 100 gr, bulg'or qalampir - 1 dona, un - ta'bga ko'ra, shakar - 1 osh qoshiq, tuz - 1 choy qoshiq, xamirturush - 1 osh qoshiq, ko'k piyoz - 2 dona, sut - 250 gr, pishloq - 100 gr, qaynatilgan suv - 250 gr, ismaloq - 100 gr, ketchup - ta'bga ko'ra sosiska - 2 dona",
    "Sutni ilitamiz. Iliq sutga xamirturush va shakar solib 10 daqiqaga olib qo'yamiz. Suv, tuz, yog' qo'shib aralashtiramiz. Unni elab solamiz. 5 daqiqa xamirni mushtlaymiz va o'rab qo'yamiz. Xamir oshgandan so'ng 2 bo'lakka bo'lamiz. Xar birini o'qlov yordamida yoyib chiqamiz. Yoyilgan xamirlarni ustini yopib yana 10 daqiqa dam oldiramiz. Xamir yuziga ketma-ket masalliqlarni terib chiqamiz: Ketchup Qirg'ichdan chiqarilgan pishloq Parrak-parrak to'g'ralgan sosiska Pishirib olingan ismaloq omoncha to'g'ralgan qizil bulg'or qalampiri Oxirida yana pishloq. Bu masalliqlar 1- xamiri uchun. 2-xamir yuziga: -Ketchup -Qirg'ichdan chiqarilgan pishloq -Kubik to'g'ralgan bulg'or qalampiri -Tilim-tilim kesilgan pomidor -Ko'k piyoz -Pishloq  Pitsani 200 darajada qizdirilgan duxovkada 20 daqiqa davomida pishiramiz. Pitsamiz tayyor. Yoqimli ishtaha! Pitsani xoxishga qarab istalgan sabzavot yoki mevalardan tayyorlash mumkin.",
    75,
    123,
    true,
    'images/pizza.png',
    180,
  ),
  Recipe(
      'Qovurilgan lag\'mon',
      "Juda tez tayyorlanadigan va mazalari bo\'gan O\'zbekcha lag\'mon\nKerakli mahsulotlar: mol go'shti - 230 gr, sabzi - 1 dona, piyoz - 1 dona, pomidor - 2 dona, kungaboqar yog'i - 35 ml, bulg'or qalampir - 1 dona, un - 200 gr, tuxum - 2 dona, tuz - 8 gr, zira - 1 gr ",
      "Qovurilgan lag‘mon tayyorlash uchun, mol yoki qo‘y go‘shti, piyoz, shirin bulg‘or qalampiri, sabzi, tuxum, ko‘kat, o‘simlik yog‘i, pomidor kerak bo‘ladi. Go‘sht mayda to‘tburchak shaklida to‘g‘raladi. Go‘sht o‘simlik yog‘ida 15 daqiqa davomida qovuriladi. Agar go‘sht qattiqroq bo‘lsa idishning qopqog‘ini yopib bir oz yumshatiladi. So‘ng tuz va achchiq murch solinadi. Piyoz, sabzi va bulg‘or qalampiri somoncha shaklida to‘g‘raladi. Go‘shtga to‘g‘ralgan piyoz solib 15 daqiqa davomida qovuriladi. So‘ng to‘g‘ralgan bulg‘or qalampiri va sabzi solinib, yumshoq bo‘lgunga qadar qo‘vuriladi va tabga ko‘ra tuz solinadi. Endi pomidorga navbat. Pomidorni mayda qilib to‘g‘raladi. Ushbu taom uchun shirin pomidorni tanlash maqsadga muvofiqdir. Agar bunday pomidor bo‘lmasa, tomat pastasi qo‘shish mumkin. Tayyor xamirni (ugra) sovuq holda bo‘lsa yarim daqiqaga (isitib olish olish uchun)qaynoq suvda qaynatib olinadi. Ugrani qovurilgan massaga qo‘shib 7-10 daqiqa davomida qovuriladi va tuz va zirovarlari tami rostlanadi. Tuxum chaqib aralashtirilib yog‘da qovurib olinadi. Tayyor omletni mayda somoncha shaklida to‘g‘raladi. Katta laganga tayyor lag‘mon suziladi va ustiga ko‘katlar hamda to‘g‘ralgan omlet sepiladi. \nYoqimli ishtaxa!",
      20,
      12503,
      true,
      'images/lag\'mon.png',
      100),
  Recipe(
      'Kara-Age',
      'Asli vatani Xitoy bo\'lgan bu taom yapon oshxonasida \"Kara-age\" deb nomlanib, o\'zbek tiliga \"xitoycha qovurma\" deb tarjima qilinadi. Taomni tayyorlanishi ikki bosqichdan iborat. Birinchi bosqichda tovuq go\'shti marinadlanadi va ikkinchi bosqichda uni yog\'da qovurib olinadi. Doimiy usulda qovuriladigan tovuqqa nisbatan Kara-age nihoyatda boy vamazali ta\'mga ega. Tabiat qo\'ynida dam olganda marinadlangan yoki qovurilgan xolda olib chiqib tanovvul qilish uchun ham qulay. Tovuqni kerakli kattalikda to\'g\'rab olamiz. Sarimsoq va zanjabilni qirg\'ichning mayda tishlaridan o\'tkazib olamiz. Ko\'k piyozni mayda to\'g\'rab olamiz. \nKerakli mahsulotlar: un - 0.5 stakan, asal - 3 osh qoshiq, tuz - 1 choy qoshiq, ko\'k piyoz - 5 dona, tovuq filesi - 1 kg, zanjabil - 0.5 bog‘, sirka (musallaslik) - 50 ml',
      "1. Hamma masalliqlarni tovuq bilan aralashtiramiz.\n2. Tayyor bo'lgan aralashmani ustiga zich qilib tselofan yopib, kamida 1 soatga muzlatgichga marinadlashga qo'yamiz. Lekin qancha ko'p tursa shuncha go'shti va mazasi mayin bo'ladi.\n3. Qozonda yog'ni qizdirib go'sht bo'lakchalarini solamiz.\n4. Bir tomoni qizargach ikkinchi tomonini o'girib pishirib olamiz. Har bir tarafini qovurish uchun 2 - 3 daqiqa ketadi.\n5. Go'sht bo'lakchalari mayin jigarrang bo'lganda yog'dan ko'tarib olinadi.\nTaom tayyor. Yoqimli ishtaxa",
      40,
      1232,
      false,
      'images/chicken2.png',
      100),
];
List<Recipe> snacks = [
  Recipe(
      'Qaynatilgan tuxumlar',
      "Ha aslida tuxumni qaynatish ham bir mahorat, \Kerakli mahsulotlar: tabga ko'ra tuxumlar, bir choy qoshiq tuz, suv ",
      "Tovuq tuxumlarini pishirishdan oldin suv ostida yuvish kerak. Tuxumlarni yirtqichlardan joylashtiring va sovuq suv bilan to'kib tashlang, shunda u tuxumni yaxshi yopadi. Bu sovuq suv kerak va agar siz qaynayotgan yoki juda issiq suv ishlatsangiz, chig'anoqlar yorilib, nonushta ko'rinishini buzishi mumkin. Agar siz shoshayotgan bo'lsangiz, chovgumdan qaynoq suv va ozgina musluk suvini to'kib tashlang, shunda tuxum pishganda yorilib ketmasligi uchun, bir osh qoshiq tuz qo'shing yoki 9% sirka suvini to'kib tashlang. Tuxum bilan panani olovga qo'ying, 7-10 daqiqa davomida pishiring. Qaynatgandan keyin tuxum ustiga sovuq suv quying.",
      15,
      120,
      false,
      'images/egg.png',
      120),
  Recipe(
    'Kartoshka Qovurdoq',
    'Barchamiz birdek sevadigan ovqat, Kerakli mahsulotlar: 1kg kartoshka, 1 osh qoshiq osh tuzi, zira va tabga ko\'ra ziravorlar',
    "Avvalo kartoshkalarimizni 2mm-5mm oralig' qalinlikda kesib olamiz, bungacha esa qozonimdagi yog' oxirigacha qizib oladi. So'ngra asta sekin qizib turgan yo'g'ga kartoshkalarimizni tashlaymiz, ko'rinishiga sariq rang ura boshlagan zahoti kartoshalarimizni olamiz, bundan avval esa tuz va ziravorlarni qo'shishni unitmang.\nYoqimli ishtaha! ",
    20,
    23450,
    true,
    'images/chip oil fried.png',
    70,
  ),
  Recipe(
    'Makkajo’xori qovurg’achalari',
    'Makkajo’xorini qaynatilgan holda iste’mol qilishga kichikligimizdan odatlanganmiz. Ammo bu, o’zgacha tayyorlash usuli o’z ta’mi va osonligi bilan barchani hayratda qoldiradi.',
    'Makkajo’xorini tik qo’yib, o’tkir pichoq yordamida ikkiga bo’lamiz, so’ng har bir qismni yana 2 qismga bo’lamiz.4 ta, qovurg’aga o’xshaydigan, bir xil xajm va shakldagi qismlar hosil bo’lishi kerak.Idishda zaytun yog’i va ziravorlarni aralshtiramiz.«Qovurg’achalarni» pergament qog’ozi solingan patnisga qo’yamiz va har birini ziravorlik yog’ bilan surtamiz.190-200С gacha qizdirilgan pechga 10 daqiqaga qo’yamiz. Idishda mayonez, ketchup va limon sharbatini aralashtiramiz.Tayyor makkajo’xorilar ustiga limon sharbati quyib, sous bilan dasturxonga tortamiz.\nYoqimli ishtaha!',
    25,
    3451,
    true,
    'images/corn.png',
    110,
  ),
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
    65,
  ),
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

Widget tabBar(String text) {
  return Tab(
    height: 20,
    iconMargin: EdgeInsets.zero,
    //text: text,
    child: Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),
    ),
  );
}

Widget tabbarView(List<Recipe> a, double maxWidth, double maxHeight) {
  return ListView.separated(
    physics: BouncingScrollPhysics(),
    scrollDirection: Axis.horizontal,
    itemCount: a.length,
    separatorBuilder: (__, _) => const SizedBox(width: 50),
    itemBuilder: (context, index) {
      if (index == 0) {
        return Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InsideRecipe(a[index]),
                ),
              );
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Color(0xFFC0F4EF),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  width: maxWidth * 0.5,
                  height: 380,
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
                            Row(
                              children: [
                                const Icon(Icons.outdoor_grill),
                                Text('${a[index].cookingTime} min',
                                    style: GoogleFonts.roboto(fontSize: 14))
                              ],
                            ),
                            const SizedBox(width: 5),
                            Row(children: [
                              const Icon(Icons.thumb_up),
                              Text(
                                a[index].numOfLikes.toString(),
                                style: GoogleFonts.roboto(fontSize: 14),
                              )
                            ]),
                          ],
                        )
                      ]),
                ),
                Positioned(
                  top: -115,
                  right: -50,
                  child: Image.asset(
                    a[index].photo,
                    width: 200,
                    height: 200,
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (index == a.length - 1) {
        return Padding(
          padding: const EdgeInsets.only(top: 100.0, right: 50),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InsideRecipe(a[index]),
                ),
              );
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      color: Color(0xFFC0F4EF),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  width: maxWidth * 0.5,
                  height: 380,
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
                Positioned(
                  top: -115,
                  right: -50,
                  child: Image.asset(
                    a[index].photo,
                    width: 200,
                    height: 200,
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InsideRecipe(a[index]),
                ),
              );
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Color(0xFFC0F4EF),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  width: maxWidth * 0.5,
                  height: 380,
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
                Positioned(
                  top: -115,
                  right: -50,
                  child: Image.asset(
                    a[index].photo,
                    width: 200,
                    height: 200,
                  ),
                ),
              ],
            ),
          ),
        );
      }
    },
  );
}
