import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../ProfileFunc/UserArtworkPage.dart';
import '../ProfileFunc/UserCVPage.dart';
import '../ProfileFunc/UserTagPage.dart';
import '../ProfileFunc/UserEditPage.dart';
import '../ProfileFunc/UserPicPage.dart';
import '../ProfileFunc/UserLikesPage.dart';
import '../ProfileFunc/UserNetworkPage.dart';
import '../UserPages/UserPreference.dart';
import 'package:firebase_storage/firebase_storage.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
  void UserCV() {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserCVPage(title: 'User CV Page')),
    );
  }
  void UserArtworks() {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserArtWorkPage(title: 'User Artwork Page')),
    );
  }
  void UserTags() {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserTagPage(title: 'UserTag Page')),
    );
  }
  void UserEdit(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserEditPage(title: 'User Edit Page')),
    );
  }

  void UserPic() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserPicPage(title: 'User Pic Page')),
    );
  }
  void UserLikes() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserLikesPage(title: 'User Likes Page')),
    );
  }

    void UserNetworks() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const UserNetworkPage(title: 'User Network Page')),
      );
    }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 14,
              child: Container(
                margin: EdgeInsets.all(10),
                child: FlatButton(
                  onPressed: UserPic,
                  child:CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(UserPref.getUserPic().toString()),
                  ),
                )
              )
            ),
            Expanded(
              flex:14,
              child: Container(
                     margin: EdgeInsets.all(20),
                      child:FlatButton(
                        onPressed: UserEdit,
                      child:
                      Text( UserPref.getUserName().toString(),
                      style: TextStyle(
                        fontSize:40,
                        color: Colors.deepPurple,
                      )
                  )
              ),
              )
            ),
            Expanded(
                flex: 14,
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: FlatButton(
                      onPressed: UserTags,
                      child: Text('Style Tags',
                      style: TextStyle(
                        fontSize:40,
                        color: Colors.deepPurple,
                      )
                  )
               ),
                )
            ),
          Expanded(
              flex: 14,
              child: Container(
                margin: EdgeInsets.all(20),
                child: FlatButton(
                      onPressed: UserArtworks,
                      child: Text(
                          'Artworks',
                          style: TextStyle(
                            fontSize:40,
                            color: Colors.deepPurple,
                          )
                      )
                  ),
              )),
          Expanded(
              flex: 14,
              child: Container(
                margin: EdgeInsets.all(20),
                child: FlatButton(
                  onPressed: UserCV,
                  child: Text(
                      'Intro/CV',
                      style: TextStyle(
                        fontSize:40,
                        color: Colors.deepPurple,
                      )
                  )
            ),
              )
          ),
            Expanded(
                flex: 14,
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: FlatButton(
                      onPressed: UserNetworks,
                      child: Text(
                          'Network',
                          style: TextStyle(
                            fontSize:40,
                            color: Colors.deepPurple,
                          )
                      )
                  ),
                )
            ),
            Expanded(
                flex: 14,
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: FlatButton(
                      onPressed: UserLikes,
                      child: Text(
                          'Likes',
                          style: TextStyle(
                            fontSize:40,
                            color: Colors.deepPurple,
                          )
                      )
                  ),
                )
            ),


          ]
        )
      )

    );
  }
}
