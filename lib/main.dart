import 'package:flutter/material.dart';
import 'package:oshpazuz/Screens/introScreen.dart';
import 'package:oshpazuz/Screens/bottomNavigationBAr.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = false;
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(myApp());
}

class myApp extends StatefulWidget {
  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 3));

    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/mainPage', routes: {
      '/introPage': (context) => const IntroScreen(),
      '/mainPage': (context) => MainPage(),
    });
  }
}
