import 'package:flutter/material.dart';
class UserNetworkPage extends StatefulWidget {
  const UserNetworkPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UserNetworkPage> createState() => _UserNetworkPageState();
}

class _UserNetworkPageState extends State<UserNetworkPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
          child: Text('This page is designed to show the user\'s connected people list')
      ),

    );
  }
}