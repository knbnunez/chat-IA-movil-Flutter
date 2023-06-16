import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: const Text("Chat Page"),
          backgroundColor: const Color.fromRGBO(255, 255, 255, 0.498),
        ),
        body: Container(
          child: ListView(
            children: const [
              
            ]
          )
        )
    );
  }
}