import 'package:development/shared_preferences/shared_register_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Practice/notification_animation.dart';

class SharedLoginScreen extends StatefulWidget {
  const SharedLoginScreen({super.key});

  @override
  State<SharedLoginScreen> createState() => _SharedLoginScreenState();
}

class _SharedLoginScreenState extends State<SharedLoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void logIn(BuildContext context)async
  {
    final prefs = await SharedPreferences.getInstance();
    String savedUsername = prefs.getString('username')??' ';
    String savedPassword = prefs.getString('password')??' ';

    if(usernameController.text == savedUsername && passwordController.text == savedPassword)
      {
        await prefs.setBool('isLoggedIn', true);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NotificationAnimation()));
      }
    else
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Credentials')));
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        title: Text("Log In",
        style: TextStyle(
          color: Colors.white,
        ),),
      ),


      body: Form(
        key:_formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:100, right: 100),
              child: TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'Username',
                    hintStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),),
                validator: (value){
                  if(value == null || value.isEmpty)
                    {
                      return 'Username is required to proceed';
                    }
                  return null;
                },
                ),
            ),

            SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.only(left:100, right: 100),
              child: TextFormField(
                controller: passwordController,
              decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(
              color: Colors.blueGrey,
              )
              ),
              validator: (value){
                if(value == null || value.isEmpty)
                  {
                    return 'Password is required to proceed';
                  }
                return null;
              },

              ),

            ),

            SizedBox(
              height: 30,
            ),

            ElevatedButton(
                onPressed: (){
                  // if(_formKey.currentState!.validate())
                  //   {
                  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Success')));
                  //   }

                  logIn(context);

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                 )   ,
                child: Text('Log In',
                style: TextStyle(
                  color: Colors.white,
                ),)
            ),

            SizedBox(
              height: 30,
            ),

            TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SharedRegisterScreen()));
                },
                child: Text('Create Account')),

          ],
        ),
      ),

    );
  }
}
