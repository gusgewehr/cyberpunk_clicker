import 'package:flutter/material.dart';

class Botao extends StatefulWidget {
  final String imagem;
  final void Function()? incrementMoney;
  final double screenHeight;
  Botao({Key? key, required this.imagem, required this.incrementMoney, required this.screenHeight}) : super(key: key);

  @override
  State<Botao> createState() => _BotaoState();
}

class _BotaoState extends State<Botao> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
    height: widget.screenHeight * 0.8,
    width: double.infinity,
child: Padding(
padding: const EdgeInsets.all(8.0),
child: ElevatedButton(
onPressed: widget.incrementMoney,
child: Image.asset(widget.imagem),
),
),
);
  }
}
