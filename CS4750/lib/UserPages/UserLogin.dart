import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'UserHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'UserPreference.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController PassWordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    EmailController.dispose();
    PassWordController.dispose();
    super.dispose();
  }
  void LoggingIn()
  {
    FirebaseAuth.instance.signInWithEmailAndPassword(email: EmailController.text, password: PassWordController.text).then((value) {
      UserPref.imageUrlList.clear();
      UserPref.setUserAID(value.user!.uid.toString());
      //parsing the query
      FirebaseFirestore.instance.collection("Users").where("AuthID",isEqualTo: value.user!.uid.toString()).get().then((QueryDocs) {
        QueryDocs.docs.forEach((element) {
          UserPref.setUserID(element.get("UserID").toString());
          UserPref.setUserName(element.get("UserName").toString());
          UserPref.setUserEmail(element.get("UserEmail").toString());

          //GetProfilePicture Link
          FirebaseFirestore.instance.collection("ProfileImage").where("UserID",isEqualTo: element.get("UserID").toString()).get().then((QD){
            QD.docs.forEach((element2) {
              UserPref.setUserPic(element2.get("ImageURL").toString());
            });
          }).catchError((error){
            UserPref.setUserPic("https://firebasestorage.googleapis.com/v0/b/zena-e8d15.appspot.com/o/UsersImage%2F2022-07-02%2001%3A31%3A23.704221.jpg?alt=media&token=92ea3f64-1662-410e-a03b-c35e94ba939e");
          });
          //getArtworks Link
          FirebaseFirestore.instance.collection("Artworks").where("UserID",isEqualTo: element.get("UserID").toString()).get().then((QD2){
            QD2.docs.forEach((element3) {
              UserPref.setImageUrlList(element3.get("ImageURL").toString());
              print(element3.get("ImageURL").toString());
            });
          }).catchError((error){
            print(error.toString());
          });


          print("Logged-in successful");
        });
      }).catchError((onError){
        print(onError.toString());
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const UserHomePage(title: 'User Home Page')),
      );
    }).catchError((error){
      print(error.toString());
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: const Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize:40,
                    fontStyle: FontStyle.italic,
                    color: Colors.deepPurple,
                  )
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
            FlatButton(
                onPressed: LoggingIn,
                child: Text(
                    'Confirm',
                    style: TextStyle(
                      fontSize:20,
                      color: Colors.deepPurple,
                    )
                )
            )
          ],
        ),
      ),

    );
  }
}