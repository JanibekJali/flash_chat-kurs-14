import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/view/home/home_view.dart';
import 'package:flash_chat/view/register/register_view.dart';
import 'package:flash_chat/widgets/buttons/login_button_widget.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  static const String route = 'LoginView';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signIn() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      log('user credetial ==> ${credential.user!.uid}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromARGB(255, 3, 24, 182), Colors.black87],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'LOGIN VIEW',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 80.0),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4.0,
                  margin: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,

                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'E-mail',
                          ),
                          // validator: _validateEmail,
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.text,

                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(Icons.visibility),
                              onPressed: () {},
                            ),
                          ),

                          // validator: _validatePassword,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Don\'t have an account?'),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  RegisterView.route,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 7, 10, 100),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                              // onPressed: _submitForm,
                              child: Text('Register'),
                            ),
                          ],
                        ),
                        SizedBox(height: 32.0),
                        ElevatedButton(
                          onPressed: () {
                            signIn();
                            Navigator.of(context).pushNamed(HomeView.route);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 7, 10, 212),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          // onPressed: _submitForm,
                          child: Text('Login'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
