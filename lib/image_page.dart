import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: const Text("Image Page"),
          backgroundColor: const Color.fromRGBO(255, 255, 255, 0.498),
        ),
        body: Container(
          child: ListView(
            children: [
              
            ]
          )
        )
    );
  }
}