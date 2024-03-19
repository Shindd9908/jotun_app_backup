import 'package:flutter/material.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TextWidget(text: "Login"),
      ),
    );
  }
}
