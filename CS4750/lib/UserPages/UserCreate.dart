import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'UserHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'UserPreference.dart';
class UserCreatePage extends StatefulWidget {
  const UserCreatePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UserCreatePage> createState() => _UserCreatePageState();
}

class _UserCreatePageState extends State<UserCreatePage> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController UserNameController = TextEditingController();
  TextEditingController PassWordController = TextEditingController();
  TextEditingController PhoneNumController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    EmailController.dispose();
    PassWordController.dispose();
    UserNameController.dispose();
    PhoneNumController.dispose();
    super.dispose();
  }

  void UserCreating()
  {
    String dum="";
    //create user in Firebase authentication
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: EmailController.text, password: PassWordController.text).then((value){
      print("success");
      UserPref.imageUrlList.clear();
    //create user in FireStore
      FirebaseFirestore.instance.collection("Users").add({
        "AuthID": value.user!.uid.toString(),
        "UserName": UserNameController.text,
        "UserEmail": EmailController.text,
        "UserPhoneNumber": PhoneNumController.text,
      }).then((values){
        UserPref.setUserID(values.id.toString());

        FirebaseFirestore.instance.collection("Users").doc(values.id.toString()).set(
            {"UserID": values.id.toString()}, SetOptions(merge: true)).then((value) {
          print("Success");
        }).catchError((e){print(e.toString());});

      }).catchError((error){
        print(error.toString());
      });

      UserPref.setUserAID(value.user!.uid.toString());
      UserPref.setUserName(UserNameController.text);
      UserPref.setUserEmail(EmailController.text);
      UserPref.setUserPic("https://firebasestorage.googleapis.com/v0/b/zena-e8d15.appspot.com/o/UsersImage%2F2022-07-02%2001%3A31%3A23.704221.jpg?alt=media&token=92ea3f64-1662-410e-a03b-c35e94ba939e");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const UserHomePage(title: 'User Home Page')),
      );
    }).catchError((onError){
      print(onError.toString());
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome To Zena:',
              style:  TextStyle(
                fontSize:30,
                fontStyle: FontStyle.italic,
                color: Colors.deepPurple,
              ),
            ),
          Container(
            width: 350,
            margin: EdgeInsets.all(20),
            child: TextField(
              controller: UserNameController,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
          ),
          Container(
            width: 350,
            margin: EdgeInsets.all(20),
            child: TextField(
              controller: EmailController,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
            Container(
              width: 350,
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: PassWordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
              width: 350,
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: PhoneNumController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'PhoneNumber',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: FlatButton(
                  onPressed: UserCreating,
                  child: Text(
                      'Confirm',
                      style: TextStyle(
                        fontSize:20,
                        color: Colors.deepPurple,
                      )
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}