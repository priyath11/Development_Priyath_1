import 'package:flutter/material.dart';

import 'Practice/notification_animation.dart';
import 'animation/custom_implicit_animation/custom_implicit_learn.dart';
import 'animation/implicit_animation/animated_align.dart';
import 'animation/implicit_animation/animated_container.dart';
import 'animation/implicit_animation/animated_opacity.dart';


void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotificationAnimation(),
    );
  }
}
