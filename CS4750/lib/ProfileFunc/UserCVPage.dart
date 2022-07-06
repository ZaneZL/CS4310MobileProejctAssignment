import 'package:flutter/material.dart';
class UserCVPage extends StatefulWidget {
  const UserCVPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UserCVPage> createState() => _UserCVPageState();
}

class _UserCVPageState extends State<UserCVPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
          child: Text('This page is designed to allow users to edit their Introduction and upload their CV or Resume')
      ),



    );
  }
}