
import 'package:flutter/foundation.dart';
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



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);



  @override
  State<HomePage> createState() => _HomePageState();
}

class Upgrade {
  String name;
  int value;
  int perk;
  String effect;
  String image;
  bool available;

  Upgrade (this.name, this.value, this.perk, this.effect,this.image, this.available);
}

class _HomePageState extends State<HomePage> {

  String assetImage = 'images/weapons/hjke11.webp';

  int money = 0;

  List<Upgrade> listUpgrades = [
    Upgrade('Skippy', 100, 9,'+ \$9 every click','images/weapons/skippy.webp', true),
    Upgrade('Achiles', 150, 20,'+ \$20 every click','images/weapons/achiles.webp', true),
    Upgrade('Kyubi', 500, 50,'+ \$50 every click','images/weapons/kyubi.webp', true),
    Upgrade('Prejudice', 1000, 100,'+ \$100 every click','images/weapons/prejudice.webp', true),
    Upgrade('HMG', 3000, 150,'+ \$150 every click','images/weapons/hmg.webp', true),
  ];


  void _incrementMoney(){
    int increaseBy = 1;

    for(Upgrade upgrade in listUpgrades){
      if(upgrade.available == false){
        increaseBy = increaseBy + upgrade.perk;
      }
    }
    setState(() {
      money = money + increaseBy;
    });
  }

  void _addUpgrade(int index,int value, String image){
    if(money >= value){
      listUpgrades.elementAt(index).available = false;
      setState(() {
        money = money - value;
        assetImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: screenHeight * 0.8,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                onPressed: _incrementMoney,
                child: Image.asset(assetImage),
                ),
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
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) {
                        return SimpleDialog(
                          title: const Text('Power UPs Store', style: TextStyle(color: Color(0xFF2BF0FB)),),
                          backgroundColor: const Color(0xFF024059),

                          children: <Widget>[
                            for(Upgrade upgrade in listUpgrades)
                              if(upgrade.available == true)
                                SimpleDialogOption(
                                  onPressed: () {
                                    _addUpgrade(listUpgrades.indexOf(upgrade), upgrade.value, upgrade.image);
                                    Navigator.pop(context);
                                  },
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(upgrade.image, width: screenWidth * 0.3 ,),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(upgrade.name, style: TextStyle(fontSize: 18),),

                                              Text('    \$${upgrade.value}', style: TextStyle(fontSize: 18),),
                                            ],
                                          ),
                                          Text(upgrade.effect, style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, fontFamily: 'Roboto'),)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                            ],
                          );
                        }
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF2E86AB),
                        foregroundColor: const Color(0xFF2BF0FB)
                      ),
                      child: const Text('Store', style: TextStyle( fontSize: 28)),
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),

    );

  }
}
