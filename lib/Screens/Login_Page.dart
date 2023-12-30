import 'package:flutter/material.dart';
import 'package:plant_based_app/constants/constants.dart';



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Constants.primaryColor,
        title: Text('Login_Page'),
      ),
    );
  }
}
