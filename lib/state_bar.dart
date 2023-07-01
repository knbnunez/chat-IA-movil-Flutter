import 'package:flutter/material.dart';

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
              IconData(0xf571,
                  fontFamily: 'MaterialIcons', matchTextDirection: true),
            )),
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
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                      fontSize: 13, color: Color.fromARGB(255, 85, 85, 85)),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}