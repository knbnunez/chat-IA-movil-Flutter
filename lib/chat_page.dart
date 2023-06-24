import 'package:flutter/material.dart';
import 'package:flutter_demo_app/custom_widgets/text_message.dart';

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

class TextMessage {
  final String text;
  final bool isUser;

  TextMessage(this.text, this.isUser);
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<TextMessage> messages = [];

  TextEditingController textFieldController = TextEditingController();

  void sendUserMsgToAI(userMessage) {
    setState(() {
      messages.add(TextMessage(userMessage, false));
    });
  }

  // Encapsulamos el setState que usábamos para guardar los mensajes en la lista
  void addUserMessage(String message) {
    setState(() {
      messages.add(TextMessage(message, true));
    });
    sendUserMsgToAI(message); // Ahora mismo esta llamada a la función sólo sirve para duplicar lo que ingresa el usuario y replicarlo como si fuera el bot.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
            child: Column(children: [
              const StateBar(),

              Expanded(
                child: ListView(
                  children: messages
                      .map((txtMsg) => txtMsg.isUser
                          ? UserTextMessage(message: txtMsg.text)
                          : AiTextMessage(message: txtMsg.text))
                      .toList(),
                ),
              ),

              Row(
                children: [
                  // ------------ //
                  //   inputText  //
                  // ------------ //
                  Expanded(
                    child: Container(
                        // width: double.infinity,
                        // width: 200,
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
                            addUserMessage(textFieldController.text);
                            textFieldController.clear();
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                    ),
                  ),

                  // ------------ //
                  //  Send Button //
                  // ------------ //
                  Container(
                    margin: const EdgeInsets.only(left: 10, bottom: 20),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(48, 52, 55, 1),
                        borderRadius: BorderRadius.circular(50)),
                    child: IconButton(
                      onPressed: () {
                        addUserMessage(textFieldController.text);
                        textFieldController.clear();
                      },
                      icon: const Icon(Icons.send),
                      color: Colors.white,
                    )
                  ),
                ],
              ),
            ])
          )
        );
  }
}