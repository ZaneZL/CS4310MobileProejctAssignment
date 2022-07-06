import 'dart:io';

import 'package:demo/ProfileFunc/UserArtworkPage2.dart';
import 'package:flutter/material.dart';
import '../UserPages/UserPreference.dart';
import '../UserScreens/ProfilePage.dart';


class UserArtWorkPage extends StatefulWidget {
  const UserArtWorkPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UserArtWorkPage> createState() => _UserArtWorkPageState();
}

class _UserArtWorkPageState extends State<UserArtWorkPage> {

  void GoBack()
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePage(title: 'User Profile Page')),
    );
  }
  void UpLoad()
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserArtWork2Page(title: 'User Artwork2 Page')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Expanded(
            flex:16,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                    onPressed: UpLoad,
                    child: Text(
                        'Upload',
                        style: TextStyle(
                          fontSize:20,
                          color: Colors.deepPurple,
                        )
                    )
                ),
                FlatButton(
                    onPressed: GoBack,
                    child: Text(
                        'Back',
                        style: TextStyle(
                          fontSize:20,
                          color: Colors.deepPurple,
                        )
                    )
                ),
              ],
            )
          ),
          Expanded(
            flex:84,
            child: GridView.builder(
                  itemCount: UserPref.getImageUrlList().length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.55),
              itemBuilder: (BuildContext context, int index){
                return Image.network(UserPref.getImageUrlList().elementAt(index),fit: BoxFit.cover);
              },
            )
          )
        ]
      )
    );
  }
}