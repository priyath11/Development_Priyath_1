import 'package:flutter/material.dart';

class CircularProgressIndicatorLearn extends StatefulWidget {
  const CircularProgressIndicatorLearn({super.key});

  @override
  State<CircularProgressIndicatorLearn> createState() => _CircularProgressIndicatorLearnState();
}

class _CircularProgressIndicatorLearnState extends State<CircularProgressIndicatorLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            Text('15')

          ],
        ),
      ),
    );
  }
}
