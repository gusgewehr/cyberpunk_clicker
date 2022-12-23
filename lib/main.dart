import 'package:cyberpunk_clicker/main_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'RubikGlitch',
        primarySwatch: const MaterialColor(
          0xFF024059, <int, Color>{
            50:Color(0xFF2BF0FB),
            100:Color(0xFF00F0FF),
            200:Color(0xFFFF003C),
            300:Color(0xFFF2E307),
            500:Color(0xFFF2CC0F),
            600:Color(0xFFBB2FBB),
            700:Color(0xFF822182),
            800:Color(0xFF6F1F84),
            900:Color(0xFF2E86AB),
          }),
        scaffoldBackgroundColor: const Color(0xFF050A0E),
        textTheme: const TextTheme(
          headline1: TextStyle(color: Color(0xFFF2CC0F)),
          headline2: TextStyle(color: Color(0xFF00F0FF)),
          headline4: TextStyle(color: Color(0xFF00F0FF)),
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
          subtitle1: TextStyle(color: Colors.white),
        )
      ),
      home: const HomePage(),
    );
  }
}



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            MainButton(assetImage: 'images/positivo.png'),
            Text('teste')
          ],
        ),
      )
    );

  }
}
