import 'package:flutter/material.dart';

class CustomImplicitLearn extends StatefulWidget {
  const CustomImplicitLearn({super.key});

  @override
  State<CustomImplicitLearn> createState() => _CustomImplicitLearnState();
}

class _CustomImplicitLearnState extends State<CustomImplicitLearn> {

  bool isBig = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<double>(
            tween: Tween(
              begin: 100,
              end: isBig?200:100,
            ),
            duration: Duration(
              seconds: 3,
            ),
            builder: (context,value,child){
              return Container(
                width: value,
                height: value,
                color: Colors.amberAccent,
              );
            },
      ),
      ),
      
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              isBig = !isBig;
            });
          },
        child: Icon(Icons.add),
      )
        




    );
  }
}
