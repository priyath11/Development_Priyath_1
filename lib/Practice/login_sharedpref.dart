import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard_shared_pref.dart';

class LogInSharedPref extends StatefulWidget {
  const LogInSharedPref({super.key});

  @override
  State<LogInSharedPref> createState() => _LogInSharedPrefState();
}

class _LogInSharedPrefState extends State<LogInSharedPref> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void logInNow(BuildContext context)async
  {
    final prefs = await SharedPreferences.getInstance();
    String savedUsername = prefs.getString('username')??' ';
    String savedPassword = prefs.getString('password')??' ';

    if(savedUsername == usernameController.text && savedPassword == passwordController.text)
      {
        await prefs.setBool('isLoggedIn', true);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> DashboardSharedPref()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Welcome, Virat'), duration: Duration( seconds: 4),));
      }
    else
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Credentials')));
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Log In',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),

          SizedBox(height: 100),

          Padding(
            padding: const EdgeInsets.only(left: 200, right: 200),
            child: TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: 'Username',
                hintStyle: TextStyle(color: Colors.blueGrey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),

          SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.only(left: 200, right: 200),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.blueGrey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),

          SizedBox(
            height:30,
          ),

          ElevatedButton(
              onPressed: (){
                logInNow(context);
              },
              child: Text('Log In',style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink.shade800,
              )

              ),
        ],
      ),
    );
  }
}
