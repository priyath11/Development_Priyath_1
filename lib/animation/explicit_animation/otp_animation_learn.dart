import 'package:flutter/material.dart';

class OtpAnimationLearn extends StatefulWidget {
  const OtpAnimationLearn({super.key});

  @override
  State<OtpAnimationLearn> createState() => _OtpAnimationLearnState();
}

class _OtpAnimationLearnState extends State<OtpAnimationLearn>
    with SingleTickerProviderStateMixin
{
  late AnimationController controller;
  int totalSeconds = 15;
  int get remainingSeconds{
    return (totalSeconds * (1-controller.value)).ceil();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(
          seconds: 15,
        )
    )..forward();
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

      body: Center(

        child: AnimatedBuilder(
            animation: controller,
            builder: (context,child){
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    strokeWidth: 10,
                    backgroundColor: Colors.pink,
                    value:controller.value,
                  ),
                  Text('$remainingSeconds seconds'),
                ],
              );
            },

      ),
      )

    );
  }
}
