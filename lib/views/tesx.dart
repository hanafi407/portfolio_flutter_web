import 'package:flutter/material.dart';

class Tesx extends StatefulWidget {
  const Tesx({super.key});

  @override
  State<Tesx> createState() => _TesxState();
}

class _TesxState extends State<Tesx> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Text("data"),
              Text("data"),
              Row(
                children: [Text('data'), Text("ok")],
              )
            ],
          )
        ],
      ),
    );
  }
}
