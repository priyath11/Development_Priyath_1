import 'package:flutter/material.dart';

class NotificationAnimation extends StatefulWidget {
  const NotificationAnimation({super.key});

  @override
  State<NotificationAnimation> createState() => _NotificationAnimationState();
}

class _NotificationAnimationState extends State<NotificationAnimation> {
  bool isBig = false;
  bool isVisible = false;
  bool isAlign = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GestureDetector(
        child: Center(
            child:
              AnimatedContainer(
              color: Colors.amberAccent.shade100,
              height: isBig?200:50,
                width: isBig?300:100,
                duration: Duration(
                  seconds: 2,
                ),
                child: Stack
                  (
                    children:
                    [
                    AnimatedAlign(
                    alignment: isAlign?Alignment.topRight:Alignment.topLeft,
                    duration: Duration(seconds: 2),
                    child: Icon(Icons.notifications),),
                    AnimatedOpacity(
                    opacity:isVisible?1.0:0.0,
                    duration: Duration(seconds: 2),
                    child: Column(
                    children: [
                    Text('Your order has been successfully delivered.Thank you for shopping with us'),
                    ],
                    ),
                    ),
                    ]
                ),
              ),
        ),

        onTap:(){
          setState(() {
            isBig = !isBig;
            isVisible = !isVisible;
            isAlign = !isAlign;
          });
        },
      ),





    );
  }
}
