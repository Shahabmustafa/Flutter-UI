
import 'package:flutter/material.dart';
import 'package:piza_app/Screen/signup_screen.dart';
import 'package:piza_app/Widget/MytextField.dart';
import 'package:piza_app/Widget/red_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Login In',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 40.0,
            fontWeight: FontWeight.bold
          ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Form(
              key: _form,
                child: Column(
                  children: [
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
          Column(
            children: [
              RedButton(
                  title: 'LogIn',
                  onTap: (){}
              ),
              TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                  },
                  child: Text('Signup Your Account?',style: TextStyle(color: Colors.blue),)
              ),
            ],
          ),
        ],
      ),
    );
  }
}
