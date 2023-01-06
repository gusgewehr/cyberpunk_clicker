import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String assetImage = 'images/positivo.png';

  int money = 0;

  void _incrementMoney(){
    setState(() {
      money++;
    });

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
              onPressed: _incrementMoney,
              child: Image.asset(assetImage),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              color: const Color(0xFFF2CC0F),
              alignment: Alignment.center,
              child: Text(money.toString(), style: TextStyle(fontSize: 42)),
            ),

            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: _incrementMoney,
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF2E86AB),
                        foregroundColor: const Color(0xFF2BF0FB)
                      ),
                      child: const Text('Store', style: TextStyle( fontSize: 28)),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: _incrementMoney,
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF2E86AB),
                          foregroundColor: const Color(0xFF2BF0FB)
                      ),
                      child: const Text('Config', style: TextStyle( fontSize: 28)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );

  }
}
