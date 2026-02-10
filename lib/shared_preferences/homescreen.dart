import 'package:development/Practice/login_sharedpref.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomescreenSharedPref extends StatefulWidget {
  const HomescreenSharedPref({super.key});

  @override
  State<HomescreenSharedPref> createState() => _HomescreenSharedPrefState();
}

class _HomescreenSharedPrefState extends State<HomescreenSharedPref> {

  void logOut(BuildContext context)async
  {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LogInSharedPref()),
        (route)=>false);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.pink.shade800,
        centerTitle: true,
        title: Text('HomeScreen',
        style: TextStyle(
          color: Colors.black,
        ),),
        
        actions: [
            IconButton(onPressed: (){
              logOut(context);

            },
                icon: Icon(Icons.logout_outlined))
        ],
      ),

      drawer: Drawer(),

    );
  }
}
