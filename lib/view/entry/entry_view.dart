import 'package:flash_chat/view/home/home_view.dart';
import 'package:flash_chat/view/login/login_view.dart';
import 'package:flash_chat/view/register/register_view.dart';
import 'package:flash_chat/widgets/buttons/login_button_widget.dart';
import 'package:flutter/material.dart';

class EntryView extends StatefulWidget {
  static const String route = 'EntryView';
  @override
  _EntryViewState createState() => _EntryViewState();
}

class _EntryViewState extends State<EntryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            LoginButtonWidget(
              text: 'Login',
              onTap: () {
                Navigator.pushNamed(
                  context,
                  LoginView.route,
                );
              },
            ),
            SizedBox(
              height: 30,
            ),
            LoginButtonWidget(
              text: 'Register',
              horizontal: 115,
              color: Colors.lightBlueAccent,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RegisterView.route,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
