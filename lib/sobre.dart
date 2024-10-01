import 'package:flutter/material.dart';

class Sobre extends StatefulWidget {
  const Sobre({super.key});

  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Sobre"),
    );
  }
}
