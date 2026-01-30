import 'package:flutter/material.dart';

class AnimatedAlignLearn extends StatefulWidget {
  const AnimatedAlignLearn({super.key});

  @override
  State<AnimatedAlignLearn> createState() => _AnimatedAlignLearnState();
}

class _AnimatedAlignLearnState extends State<AnimatedAlignLearn> {
  bool isTop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: AnimatedAlign(
          alignment: isTop ? Alignment.topLeft : Alignment.bottomLeft,
          duration: Duration(seconds: 3),
          child: Container(height: 200, width: 200, color: Colors.amberAccent),
        ),
        onTap:(){Navigator.push(context,MaterialPageRoute(builder:(context)=>AnimatedAlignLearn()));}
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isTop = !isTop;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
