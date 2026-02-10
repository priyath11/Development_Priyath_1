import 'package:development/shared_preferences/shared_login_screen.dart';
import 'package:development/shared_preferences/shared_register_screen.dart';
import 'package:development/shared_preferences/splash_screen_learn.dart';
import 'package:flutter/material.dart';

import 'Practice/notification_animation.dart';
import 'Practice/regpage_sharedpref.dart';
import 'animation/custom_implicit_animation/custom_implicit_learn.dart';
import 'animation/custom_implicit_animation/gradient_animation_learn.dart';
import 'animation/custom_implicit_animation/hero_animation_learn.dart';
import 'animation/explicit_animation/explicit_animation_learn.dart';
import 'animation/explicit_animation/otp_animation_learn.dart';
import 'animation/explicit_animation/otp_example/circular_progress_indicator.dart';
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
      debugShowCheckedModeBanner: false,
      home:SplashScreenLearn(),
    );
  }
}
