import 'package:flutter/material.dart';


// ToDo: Mover a un archivo separado. Lo usa también chat_page
class StateBar extends StatelessWidget {
  final String title;
  final IconData icon;
  
  const StateBar({
    required this.title,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
          child: const Icon(
            size: 20,
            IconData(
              0xf571,
              fontFamily: 'MaterialIcons', 
              matchTextDirection: true 
            ),
          )
        ),
        const SizedBox(width: 32),
        Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.only(right: 24),
            decoration: BoxDecoration(
              color: const Color.fromARGB(31, 3, 146, 255),
              borderRadius: BorderRadius.circular(24),
            ),

            // Solo para test
            child: Icon(
              icon,
              size: 30,
              color: const Color.fromARGB(255, 0, 139, 208),
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // "Canal de imágenes",
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 3),
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 47, 255, 120),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                const Text(
                  "Siempre activo",
                  style: TextStyle(
                      fontSize: 13,
                      color: Color.fromARGB(255, 85, 85, 85)),
                )
              ],
            )
          ],
        ), 
      ],
    );
  }
}





class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
          child: Column(
            children: [

              const StateBar(
                title: "Canal de imágenes",
                icon: IconData(0xf5ec, fontFamily: 'MaterialIcons'),
              ),



              MaterialButton(
                color: Colors.blue,
                child: const Text(
                    "Pick Image from Gallery",
                  style: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.bold
                  )
                ),
                onPressed: () {
                }
              ),
              MaterialButton(
                  color: Colors.blue,
                  child: const Text(
                      "Pick Image from Camera",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold
                      )
                  ),
                  onPressed: () {
                  }
              ),




            ]
          )
        )
    );
  }
}