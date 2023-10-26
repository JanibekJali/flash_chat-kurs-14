import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/view/home/home_view.dart';
import 'package:flash_chat/view/login/login_view.dart';
import 'package:flash_chat/widgets/buttons/login_button_widget.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  static const String route = 'RegisterView';
  TextEditingController fullName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference elektronika =
      FirebaseFirestore.instance.collection('elektronika');

  Future<void> addUser() {
    return users
        .add({
          'fullName': fullName.text,
          'email': _email.text,
          'password': _password.text,
        })
        .then((value) => log("User Added"))
        .catchError((error) => log("Failed to add user: $error"));
  }

  Future<void> register() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: _email.text,
            password: _password.text,
          )
          .then((value) => {
                addUser(),
              });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (e) {
      log('$e');
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
                    'REGISTER VIEW',
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
                        TextFormField(
                          controller: fullName,
                          keyboardType: TextInputType.emailAddress,

                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Full Name',
                          ),
                          // validator: _validateEmail,
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: _email,
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
                          controller: _password,
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
                            Text('Already have an account?'),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  LoginView.route,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 7, 10, 100),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                              // onPressed: _submitForm,
                              child: Text('Login'),
                            ),
                          ],
                        ),
                        SizedBox(height: 32.0),
                        ElevatedButton(
                          onPressed: () {
                            register();

                            Navigator.of(context).pushNamed(HomeView.route);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 7, 10, 212),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          // onPressed: _submitForm,
                          child: Text('Register'),
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
