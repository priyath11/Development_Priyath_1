import 'package:flutter/material.dart';

class ZoomInPage extends StatelessWidget {
  const ZoomInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
            tag: "Profile Picture", 
            child: Container(
              height: 500,
              width: 500,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(image: NetworkImage('https://cdn.shopify.com/s/files/1/0086/0795/7054/files/Golden-Retriever.jpg?v=1645179525'),
                fit: BoxFit.cover,
                ),

              ),
            )),
      ),
    );
  }
}
