import 'package:flutter/material.dart';

class AnimatedContainerLearn extends StatefulWidget {
  const AnimatedContainerLearn({super.key});

  @override
  State<AnimatedContainerLearn> createState() => _AnimatedContainerLearnState();
}

class _AnimatedContainerLearnState extends State<AnimatedContainerLearn> {
  bool isBig = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber),
      body: Center(
          child: AnimatedContainer(
              duration: Duration(seconds: 3),
            height: isBig?100:20,
            width: isBig?100:20,
            color: Colors.amberAccent,
          )
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          isBig = !isBig;
        }
        );
      },
        child: Icon(Icons.text_increase),
      ),
    );
  }
}
