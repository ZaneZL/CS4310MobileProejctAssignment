import 'package:flutter/material.dart';
import '../UserScreens/HomePage.dart';
import '../UserScreens/MessagePage.dart';
import '../UserScreens/ProfilePage.dart';
import '../UserScreens/SearchPage.dart';


class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {

 int _selectedIndex = 0;
 List<Widget> pagelist = <Widget>[
   HomePage(title: 'Home'),
   SearchPage(title: 'Home'),
   MessagePage(title: 'Home'),
   ProfilePage(title: 'Home')
 ];

 void _onItemTapped(int index) {
   setState(() {
     _selectedIndex = index;
   });
 }
 @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child: pagelist.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', backgroundColor: Colors.red,),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Connect', backgroundColor: Colors.green,),
        BottomNavigationBarItem(icon: Icon(Icons.messenger_rounded), label: 'Message', backgroundColor: Colors.purple,),
        BottomNavigationBarItem(icon: Icon(Icons.person_sharp), label: 'Profile', backgroundColor: Colors.grey,),
       ],
       currentIndex: _selectedIndex,
       selectedItemColor: Colors.amber[800],
       onTap: _onItemTapped,
      )
    );
  }
}

