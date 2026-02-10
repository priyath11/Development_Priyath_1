import 'package:flutter/material.dart';

class ExplicitAnimationLearn extends StatefulWidget {
  const ExplicitAnimationLearn({super.key});

  @override
  State<ExplicitAnimationLearn> createState() => _ExplicitAnimationLearnState();
}

class _ExplicitAnimationLearnState extends State<ExplicitAnimationLearn>
with SingleTickerProviderStateMixin                                     //Synchronising mobile refresh and animation
{
  late AnimationController controller;
  late Animation <double>sizeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 3
      )
    );
    sizeAnimation = Tween<double>(
      begin: 100,
      end: 200,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    controller.addListener((){
      setState(() {

      });
    });
    //controller.forward();
    controller.repeat(
      reverse: true,
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Explicit Animation',
        style:TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        )),
      ),
      body: Center(
        child: Container(
          width: sizeAnimation.value,
          height: sizeAnimation.value,
          color: Colors.yellow,
        ),
      ),

    );
  }
}
