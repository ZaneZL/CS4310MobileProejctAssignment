import 'package:flutter/material.dart';
class UserLikesPage extends StatefulWidget {
  const UserLikesPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UserLikesPage> createState() => _UserLikesPageState();
}

class _UserLikesPageState extends State<UserLikesPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
          child: Text('This page is designed to allow users to add the '
              'attribute tags that they identify by for search function. ')
      ),


    );
  }
}