import 'package:flutter/material.dart';
// 
import 'package:flutter_demo_app/chat_page.dart';
import 'package:flutter_demo_app/image_page.dart';
import 'package:flutter_demo_app/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (context) => const HomePage(),
        '/chat': (context) => const ChatPage(),
        '/image': (context) => const ImagePage(),
      },
      initialRoute: '/',
    );
  }
}