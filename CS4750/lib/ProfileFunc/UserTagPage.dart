import 'package:flutter/material.dart';

class UserTagPage extends StatefulWidget {
  const UserTagPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UserTagPage> createState() => _UserTagPageState();
}

class _UserTagPageState extends State<UserTagPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
          child: Text('ArtworkPages')
      ),

    );
  }
}