import 'package:flutter/material.dart';

class AnimatedOpacityLearn extends StatefulWidget {
  const AnimatedOpacityLearn({super.key});

  @override
  State<AnimatedOpacityLearn> createState() => _AnimatedOpacityLearnState();
}

class _AnimatedOpacityLearnState extends State<AnimatedOpacityLearn> {

  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: AnimatedOpacity(
            opacity: isVisible?1.0:0.0,
            duration: Duration(
              seconds: 3,
            ),
          child: Container(
            height: 200,
            width: 200,
            color: Colors.amberAccent,
          ),

        ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          isVisible = !isVisible;
        });
      },
      child: Icon(Icons.add),
      ),
    );
  }
}
