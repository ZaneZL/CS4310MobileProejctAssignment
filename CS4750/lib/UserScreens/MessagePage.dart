import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: const Text(
                  'messagpage',
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
