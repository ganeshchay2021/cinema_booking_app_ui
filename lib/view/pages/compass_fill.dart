import 'package:flutter/material.dart';

class CompassFill extends StatefulWidget {
  const CompassFill({super.key});

  @override
  State<CompassFill> createState() => _CompassFillState();
}

class _CompassFillState extends State<CompassFill> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Image.network("https://static.vecteezy.com/system/resources/previews/053/292/700/non_2x/smiling-face-with-eyes-emoji-realistic-free-png.png")
      ),
    );
  }
}