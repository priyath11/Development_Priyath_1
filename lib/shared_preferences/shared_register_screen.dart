import 'package:development/shared_preferences/shared_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Practice/notification_animation.dart';

class SharedRegisterScreen extends StatefulWidget {
  const SharedRegisterScreen({super.key});

  @override
  State<SharedRegisterScreen> createState() => _SharedRegisterScreenState();
}

class _SharedRegisterScreenState extends State<SharedRegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void register(BuildContext context)async{
    if(!_formKey.currentState!.validate())
      {
        return;
      }
    final prefs = await SharedPreferences.getInstance();
    //Fetching memory to get our data
    await prefs.setString('username', usernameController.text);
    await prefs.setString('password', passwordController.text);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration Successful')));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SharedLoginScreen()));
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:150,right:150),
              child: TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'Username',
                  hintStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                  )
                ),
                validator: (value){
                  if(value == null || value.isEmpty)
                    {
                      return "Username is required";
                    }
                  return null;
                },
              ),
            ),

            SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.only(left:150, right: 150),
              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color:Colors.blueGrey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                  )
                ),
                validator: (value){
                  if(value == null || value.isEmpty)
                    {
                      return "Password is required";
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
                  register(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text('Register',
                style: TextStyle(
                  color: Colors.white,
                ),)),
          ],
        ),
      )



    );
  }
}
