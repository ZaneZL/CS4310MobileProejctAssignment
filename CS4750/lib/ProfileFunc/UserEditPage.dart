import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../UserPages/UserPreference.dart';
import '../UserScreens/ProfilePage.dart';
class UserEditPage extends StatefulWidget {
  const UserEditPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UserEditPage> createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserEditPage> {
  TextEditingController UserEditController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    UserEditController.dispose();
    super.dispose();
  }
  void UserEditting()
  {
    FirebaseFirestore.instance.collection("Users").doc(UserPref.getUserID()).set(
        {"UserName": UserEditController.text}, SetOptions(merge: true));
    UserPref.setUserName(UserEditController.text);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePage(title: 'Profile Page')),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 350,
              margin: EdgeInsets.all(20),
              child: TextField(
              controller: UserEditController,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            )
            ),
          Container(
            margin: EdgeInsets.all(20),
            child: FlatButton(
                onPressed: UserEditting,
                child: Text(
                    'Confirm',
                    style: TextStyle(
                      fontSize:20,
                      color: Colors.deepPurple,
                    )
                )
            ),
          ),
          ]
        )
      )
    );
  }
}