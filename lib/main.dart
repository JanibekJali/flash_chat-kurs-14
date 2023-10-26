import 'package:flash_chat/view/home/home_view.dart';
import 'package:flash_chat/view/login/login_view.dart';
import 'package:flash_chat/view/register/register_view.dart';
import 'package:flutter/material.dart';

import 'view/entry/entry_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: EntryView.route,
      routes: {
        EntryView.route: (context) => EntryView(),
        HomeView.route: (context) => const HomeView(),
        LoginView.route: (context) => LoginView(),
        RegisterView.route: (context) => RegisterView(),
      },
    );
  }
}
