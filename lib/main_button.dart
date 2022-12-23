import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  const MainButton({super.key, required this.assetImage});

  final String assetImage;


  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  int money = 0;

  void _incrementMoney(){
    setState(() {
      money++;
    });

  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: _incrementMoney,
        child: Image.asset(widget.assetImage),
    );
  }
}
