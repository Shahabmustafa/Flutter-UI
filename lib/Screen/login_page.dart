import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:piza_app/Screen/home_page.dart';
import 'package:piza_app/Screen/signup_screen.dart';
import 'package:piza_app/Widget/red_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         Row(
           children: const [
             SizedBox(
               width: 20.0,
             ),
             Text('Login In',
               style: TextStyle(
                   color: Colors.grey,
                   fontSize: 40.0,
                   fontWeight: FontWeight.bold
               ),
             ),
           ],
         ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Form(
              key: _formKey,
                child: Column(
                  children: [
                   TextFormField(
                     autovalidateMode: AutovalidateMode.onUserInteraction,
                     controller: emailController,
                     style: const TextStyle(
                       color: Colors.grey
                     ),
                     decoration: const InputDecoration(
                       hintText: 'Email',
                       hintStyle: TextStyle(
                           color: Colors.grey
                       ),
                       enabledBorder: UnderlineInputBorder(
                         borderSide: BorderSide(
                           color: Colors.grey,
                         ),
                       ),
                       prefixIcon: Icon(Icons.email),
                     ),
                     validator: MultiValidator(
                       [
                         RequiredValidator(errorText: 'Email Required'),
                         EmailValidator(errorText: 'Enter Your Valid Email'),
                       ]
                     ),
                   ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: passwordController,
                      obscureText: true,
                      style: const TextStyle(
                          color: Colors.grey
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                            color: Colors.grey
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        prefixIcon: Icon(Icons.password),
                      ),
                      validator: MultiValidator(
                        [
                          RequiredValidator(errorText: 'Password Required'),
                          MinLengthValidator(8, errorText: 'Password Must be at least 8 digits long'),
                          PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
                        ]
                      ),
                    ),
                  ],
                ),
            ),
          ),
          Column(
            children: [
              RedButton(
                  title: 'LogIn',
                  onTap: ()async{
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                    );
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    _formKey.currentState?.validate();
                  }
              ),
              TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupScreen()));
                  },
                  child: const Text('Signup Your Account?',style: TextStyle(color: Colors.blue),)
              ),
            ],
          ),
        ],
      ),
    );
  }
}
