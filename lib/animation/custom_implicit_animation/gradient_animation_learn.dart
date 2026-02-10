import 'package:flutter/material.dart';

import '../../Practice/notification_animation.dart';

class GradientAnimationLearn extends StatefulWidget {
  const GradientAnimationLearn({super.key});

  @override
  State<GradientAnimationLearn> createState() => _GradientAnimationLearnState();
}

class _GradientAnimationLearnState extends State<GradientAnimationLearn> {
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Gradient Animation',
                style: TextStyle(
                  color: Colors.white,
        ),

        ),
      ),

      body: Center(
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationAnimation()));
          },
          child: TweenAnimationBuilder(
            onEnd: (){                            //For repeating the animation effect
              setState(() {
              toggle = !toggle;
            }
            );},
              tween: DecorationTween(
                begin: BoxDecoration(
                  gradient: LinearGradient(
                      colors:toggle?[Colors.pink,Colors.black]:[Colors.yellow,Colors.white]),
                      //colors: [Colors.pinkAccent, Colors.black])
                ),
                end: BoxDecoration(
                  gradient: LinearGradient(
                      colors: toggle?[Colors.yellow,Colors.white]:[Colors.pink,Colors.black]),
                ),
              ),
              duration: Duration(
                seconds: 3,
              ),

              child:Text('Button',
                //textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),),

              builder: (context,decoration,child){
                return Container(
                  width: 250,
                  height: 55,
                  decoration:decoration,
                  alignment: Alignment.center,
                  child:child,
                );

              },
          ),
        ),
      )




    );
  }
}
