import 'package:flutter/material.dart';

class DashboardSharedPref extends StatefulWidget {
  const DashboardSharedPref({super.key});

  @override
  State<DashboardSharedPref> createState() => _DashboardSharedPrefState();
}

class _DashboardSharedPrefState extends State<DashboardSharedPref> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink.shade800,
        title: Text('Welcome',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
      ),

      drawer: Drawer(
        backgroundColor: Colors.white,
      ),

      // body: Card(
      //   child: ,
      // ),

      // bottomNavigationBar: BottomNavigationBar(
      //     items: [
      //
      //
      //     ],
      //)

    );
  }
}
