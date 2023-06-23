import 'package:flutter/material.dart';

// ------------------------------------ //
// COMPONENTES
// ------------------------------------ //
class StatBox extends StatelessWidget {
  final IconData iconData;
  final String countText;
  final String subText;
  
  const StatBox({
    // Required = obligatorio
    required this.iconData,
    required this.countText,
    required this.subText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
      width: 115,
      height: 105,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(31, 3, 146, 255),
              borderRadius: BorderRadius.circular(24),
            ),
              child: IconTheme(
                data: const IconThemeData(
                  color: Color.fromARGB(255, 0, 94, 255),
                  size: 18,
                ),
                child: Icon(iconData),
              ),
          ),
          Text(
            countText,
            style: const TextStyle(fontWeight: FontWeight.bold ),
          ),
          Text(subText),
        ],
      ),
    );
  }
}

class ActivityBox extends StatelessWidget {
  
  final Color colorBox;
  final String channelText;
  final String descText;
  final String actionText;
  final Color colorActionText;
  
  const ActivityBox({
    required this.colorBox,
    required this.channelText,
    required this.descText,
    required this.actionText,
    required this.colorActionText,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 28),
      padding: const EdgeInsets.only(top: 26, left: 24, right: 57),
      width: double.infinity, // Ocupa todo el ancho de la pantalla
      height: 110,
      decoration: BoxDecoration(
        color: colorBox,
        borderRadius: BorderRadius.circular(20),
      ),
      
      // Content
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                channelText,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                descText,
                style: const TextStyle(fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: 71,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: 
                  Text(
                    actionText,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color:  colorActionText)
                  )
              ),
            ],
          )
        ],
      ),
    );
  }
}


// ------------------------------------ //
// PRINCIPAL
// ------------------------------------ //
class HomePage extends StatelessWidget {
   const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 60, left: 24, right: 24),
          // funciona también para --> padding: EdgeInsets.___
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        "Inicio",
                        style: TextStyle(
                          fontWeight: FontWeight.bold, 
                          fontSize: 24,

                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16), // espacio entre filas
                  const Row(
                    children: [ 
                      Text(
                        "Resumen",
                        style: TextStyle(
                          fontWeight: FontWeight.bold, 
                          fontSize: 18
                        ),
                      ),
                    ]
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                        StatBox(
                          iconData: IconData(0xf05a5, fontFamily: 'MaterialIcons'),
                          countText: "3.950",
                          subText: "Rtas. gen.",
                        ),
                        StatBox(
                          iconData: IconData(0xe332, fontFamily: 'MaterialIcons'),
                          countText: "1.000",
                          subText: "Img. gen.",
                        ),
                    ],
                  ),
                  const SizedBox(height: 33),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // for (int i = 0; i < 3; i++) const ActivityBox()
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/chat');
                        },
                        child: const ActivityBox(
                          colorBox: Color.fromARGB(255, 254, 246, 234),
                          channelText: "Canal de texto",
                          descText: "Chatea con la IA",
                          actionText: "CHATEÁ",
                          colorActionText: Color.fromARGB(160, 94, 3, 1),
                        ),
                      ),
                      const SizedBox(height: 33),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/image');
                        },
                        child: const ActivityBox(
                          colorBox: Color.fromARGB(255, 240, 240, 255),
                          channelText: "Canal de imagen",
                          descText: "Chatea desde imágenes",
                          actionText: "CREÁ",
                          colorActionText: Color.fromARGB(255, 1, 115, 203),
                        ),
                      ),
                      const SizedBox(height: 33),
                    ],
                  )
                ],
              ),
            ],
          ),
        )
      );
  }
}
