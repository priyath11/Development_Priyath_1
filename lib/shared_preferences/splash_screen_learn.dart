import 'package:development/shared_preferences/shared_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homescreen.dart';

class SplashScreenLearn extends StatefulWidget {
  const SplashScreenLearn({super.key});

  @override
  State<SplashScreenLearn> createState() => _SplashScreenLearnState();
}

class _SplashScreenLearnState extends State<SplashScreenLearn> {

  void navigateNext(BuildContext context)async
  {
    await Future.delayed(Duration(seconds: 3));     //To create a delay in future
    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn')?? false;
    if(isLoggedIn)
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomescreenSharedPref()));
      }
    else
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SharedLoginScreen()));
      }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateNext(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(

        child: Icon(
          Icons.directions_bike_rounded,
          size: 50,
          color: Colors.pink.shade800,
        )

      ),
    );
  }
}
