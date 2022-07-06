import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: const Text(
                  'searchpage',
                  style: TextStyle(
                    fontSize:40,
                    fontStyle: FontStyle.italic,
                    color: Colors.deepPurple,
                  )
              )
            )

          ]
        )
      )

    );
  }
}
