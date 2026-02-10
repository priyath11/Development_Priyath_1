import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_sharedpref.dart';

class RegpageSharedpref extends StatefulWidget {
  const RegpageSharedpref({super.key});

  @override
  State<RegpageSharedpref> createState() => _RegpageSharedprefState();
}

class _RegpageSharedprefState extends State<RegpageSharedpref> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void register(BuildContext context)async
  {
    if(!_formKey.currentState!.validate())
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration Failed')));
    }
    else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', nameController.text);
      await prefs.setString('email', emailController.text);
      await prefs.setString('phone', phoneNumberController.text);
      await prefs.setString('username', userNameController.text);
      await prefs.setString('password', passwordController.text);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration Successful'),duration: Duration(seconds: 2),));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LogInSharedPref()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(left: 200, right: 200),
                child: TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'A name is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Name',
                    hintStyle: TextStyle(color: Colors.blueGrey),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(left: 200, right: 200),
                child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'An email is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.blueGrey),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(left: 200, right: 200),
                child: TextFormField(
                  controller: phoneNumberController,
                  validator:(value){
                    if(value == null || value.isEmpty)
                    {
                      return 'A phone number is required';
                    }
                    return null;
                  },

                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(color: Colors.blueGrey),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(left: 200, right: 200),
                child: TextFormField(
                  controller: userNameController,
                  validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return 'A username is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: TextStyle(color: Colors.blueGrey),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(left: 200, right: 200),
                child: TextFormField(
                  controller: passwordController,
                  validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return 'A password is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.blueGrey),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(left: 200, right: 200),
                child: TextFormField(
                  controller: confirmPasswordController,
                  validator:(value){
                    if(value == null || value.isEmpty)
                    {
                      return 'A password is required';
                    }
                    if(passwordController.text != confirmPasswordController.text)
                      {
                        return 'Password mismatched';
                      }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(color: Colors.blueGrey),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade800,
                  ),
                  onPressed: () {
                    register(context);
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
