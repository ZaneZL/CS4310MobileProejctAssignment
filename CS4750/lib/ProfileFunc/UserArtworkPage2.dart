import 'dart:io';

import 'package:demo/ProfileFunc/UserArtworkPage.dart';
import 'package:demo/UserScreens/ProfilePage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import '../UserPages/UserPreference.dart';

class UserArtWork2Page extends StatefulWidget {
  const UserArtWork2Page({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UserArtWork2Page> createState() => _UserArtWork2PageState();
}

class _UserArtWork2PageState extends State<UserArtWork2Page> {


  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      uploadToFireBaseStore(imageFile);
    }

  }
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      uploadToFireBaseStore(imageFile);
    }

  }
  void uploadToFireBaseStore(File Ifile) async
  {
    var filename=DateTime.now().toString()+".jpg";
    final storageRef = FirebaseStorage.instance.ref();
    storageRef.child("UsersImage/"+UserPref.getUserID().toString()+"/"+filename).putFile(Ifile).then((res) async{
      print("successfully uploaded the file");
      final String imageurl =await res.ref.getDownloadURL();
      UserPref.setImageUrlList(imageurl);
      FirebaseFirestore.instance.collection("Artworks").add({
        "UserID": UserPref.getUserID(),
        "ImageURL": imageurl,
      }).then((value) {
        print("successfully add the image to firestore");
      }).catchError((e){print(e.toString());});

    }).catchError((onError){
      print(onError.toString());
    });
  }

  void GoBack()
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserArtWorkPage(title: 'User Profile Page')),
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
                    margin: EdgeInsets.all(20),
                    child:FlatButton(
                        onPressed: _getFromGallery,
                        child: Text(
                            'Pick an Image',
                            style: TextStyle(
                              fontSize:20,
                              color: Colors.deepPurple,
                            )
                        )
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: FlatButton(
                        onPressed: _getFromCamera,
                        child: Text(
                            'Take a photo',
                            style: TextStyle(
                              fontSize:20,
                              color: Colors.deepPurple,
                            )
                        )
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child:FlatButton(
                        onPressed: GoBack,
                        child: Text(
                            'Back',
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