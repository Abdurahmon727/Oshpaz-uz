import 'package:flutter/material.dart';
import 'package:oshpazuz/pages/introScreen.dart';
import 'package:oshpazuz/pages/bottom_navigationbar.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/rendering.dart';
import 'package:oshpazuz/vars.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  debugPaintSizeEnabled = false;
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //Hive
  await Hive.initFlutter();
  await Hive.openBox('myBox');

  var n = localStorage.get('settingsInfo');
  if (n != null) {
    currentLanguage = n['language'];
    currentTheme = n['theme'];
    currentFontSize = n['appFontSize'];
    currentRecipeFontSize = n['recipeFontSize'];
  }

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();

    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));

    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/mainPage',
      routes: {
        // '/introPage': (context) => const IntroScreen(),
        '/mainPage': (context) => MainPage(),
      },
      themeMode: ThemeMode.light,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}
