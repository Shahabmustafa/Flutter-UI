import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:piza_app/Screen/home_page.dart';
import 'package:piza_app/Widget/red_button.dart';

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
  final _formKey = GlobalKey<FormState>();

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 20.0,
                ),
                Text('Sign Up',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 80.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: firstNameController,
                      style: const TextStyle(
                          color: Colors.grey
                      ),
                      decoration: const InputDecoration(
                        hintText: 'First Name',
                        hintStyle: TextStyle(
                            color: Colors.grey
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: MultiValidator(
                        [
                          RequiredValidator(errorText: 'Enter your First Name'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: lastNameController,
                      style: const TextStyle(
                          color: Colors.grey
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Last Name',
                        hintStyle: TextStyle(
                            color: Colors.grey
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: MultiValidator(
                        [
                          RequiredValidator(errorText: 'Enter your First Name'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
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
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: passwordController,
                      style: const TextStyle(
                          color: Colors.grey
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Passwoed',
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
            const SizedBox(
              height: 40.0,
            ),
            RedButton(
                title: 'SignUp',
                onTap: ()async{
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text
                  );
                  await FirebaseFirestore.instance.collection('data').add({
                    'firstName' : firstNameController.text.toString(),
                    'lastName' : lastNameController.text.toString(),
                  });
                  print('User add');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                  _formKey.currentState?.validate();
                }
            ),
          ],
        ),
      ),
    );
  }
}
