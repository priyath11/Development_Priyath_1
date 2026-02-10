import 'package:development/animation/custom_implicit_animation/zoom_in_page_for_hero_animation.dart';
import 'package:flutter/material.dart';

class HeroAnimationLearn extends StatelessWidget {
  const HeroAnimationLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.pink,
      ),
      
      body: Center(
        child: InkWell(
          onTap: (){
            //Navigator.push(context, MaterialPageRoute(builder: (context)=>ZoomInPage()));
            Navigator.push(context, PageRouteBuilder(
                transitionDuration: Duration(
                  microseconds: 3,
                ),
                pageBuilder: (_,_,_)=>ZoomInPage())); //PageRouteBuilder is for custom page routing and 'underscores' are for giving required parameters but we dont want use anything from there.
          },
          child: Hero(
              tag: "Profile Picture", 
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://cdn.shopify.com/s/files/1/0086/0795/7054/files/Golden-Retriever.jpg?v=1645179525'),
                radius: 40,
              )),
        ),
        
      ),
      
    );
  }
}
