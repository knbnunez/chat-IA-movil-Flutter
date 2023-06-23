import 'package:flutter/material.dart';

class StateBar extends StatelessWidget {
  // final title String;
  
  const StateBar({
    // required this.title,
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
            child: const Icon(
              IconData(0xf05a5, fontFamily: 'MaterialIcons'),
              size: 30,
              color: Color.fromARGB(255, 0, 139, 208),
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Canal de texto",
              style: TextStyle(
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



class ChatPage extends StatefulWidget {
  const ChatPage({super.key});
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    var textFieldController = TextEditingController();

    return Scaffold(
        body: Container(
            padding: const EdgeInsets.only(top: 45, left: 24, right: 24),
            child: Column(children: [
              const StateBar(),

              Expanded(
                  child: ListView(
                children: messages.map((e) => Text(e)).toList(),
              )),

              // ------------ //
              //   inputText  //
              // ------------ //
              Container(
                width: double.infinity,
                height: 48,
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                    // color: const Color.fromARGB(31, 3, 146, 255),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    )),
                child: TextField(
                  controller: textFieldController,
                  onSubmitted: (value) {
                    setState(() {
                      messages.add(value);
                    });
                    textFieldController.clear();
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              )
            ])));
  }
}
