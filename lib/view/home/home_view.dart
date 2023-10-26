import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/view/home/widget/future_get.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key, this.senderEmail}) : super(key: key);
  static const String route = 'HomeView';
  final String? senderEmail;
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController smsController = TextEditingController();
  CollectionReference chatsCollection =
      FirebaseFirestore.instance.collection('chats');
  final userId = FirebaseAuth.instance.currentUser!.uid;
  Future<void> addSms() async {
    return chatsCollection.add({
      'id': userId,
      'sms': smsController.text,
      'senderEmail': widget.senderEmail,
    }).then(
      (value) {
        log("User Added");
        setState(() {});
      },
    ).catchError((error) => log("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home View'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GetFutureSms(),
            const SizedBox(),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: smsController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        hintText: 'Sms Zhaz...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      addSms();
                      FocusScope.of(context).unfocus();
                    },
                    child: const Text(
                      'Send',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
