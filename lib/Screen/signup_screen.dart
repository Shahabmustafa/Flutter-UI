import 'package:flutter/material.dart';
import 'package:piza_app/Widget/red_button.dart';

import '../Widget/MytextField.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.grey,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false, // <-- Step 2. SEE HERE
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Sign Up',
            style: TextStyle(
                color: Colors.grey,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Form(
              child: Column(
                children: [
                  MyTextField(
                    obscureText: false,
                    hintText: 'First Name',
                    icon: Icons.person,
                    controller: firstNameController,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  MyTextField(
                    obscureText: false,
                    hintText: 'Last Name',
                    icon: Icons.person,
                    controller: lastNameController,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  MyTextField(
                    obscureText: false,
                    hintText: 'Email',
                    icon: Icons.email,
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  MyTextField(
                    obscureText: true,
                    hintText: 'Password',
                    icon: Icons.password,
                    controller: passwordController,
                  ),
                ],
              ),
            ),
          ),
          RedButton(
              title: 'SignUp',
              onTap: (){}
          ),
        ],
      ),
    );
  }
}
