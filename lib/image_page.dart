import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_demo_app/state_bar.dart';


class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
    ImagePicker picker = ImagePicker();
    XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
            child: Column(children: [
              const StateBar(
                title: "Canal de imágenes",
                icon: IconData(0xf5ec, fontFamily: 'MaterialIcons'),
              ),
              
              // const SizedBox(height: 40),
              
              MaterialButton(
                  color: Colors.blue,
                  child: const Text("Pick Image from Gallery",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold)),
                  onPressed: () async {
                      image = await picker.pickImage(source: ImageSource.gallery); 
                      setState(() {
                        //update UI
                        // Habría que agregarlo a un array de fotos con estilo,
                        // como hice con los textos
                      });
                  }),
              MaterialButton(
                  color: Colors.blue,
                  child: const Text("Pick Image from Camera",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold)),
                  onPressed: () async {
                      image = await picker.pickImage(source: ImageSource.camera); 
                      setState(() {
                        //update UI
                        // Habría que agregarlo a un array de fotos con estilo,
                        // como hice con los textos
                      });
                  }),
              
              image == null
                ? Container()
                : Image.file(File(image!.path))
            ])));
  }
}
