import 'package:flutter/material.dart';
import 'package:flutter_demo_app/data/ia_response.dart';
import 'package:flutter_demo_app/services/analityc_storage_service.dart';
import 'package:flutter_demo_app/services/ia_service.dart';
import 'package:flutter_demo_app/widgets/text_message.dart';
import 'package:flutter_demo_app/state_bar.dart';

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

  void sendUserMsgToAI(userMessage) async {
    IaResponse response = await sendQuestionToChat(userMessage);
    setState(() {
      messages.add(TextMessage(response.mensaje, false));
    });
    // print("Estoy por realizar el icrementTextResponsesCount");
    incrementTextResponsesCount();
  }

  // Encapsulamos el setState que usábamos para guardar los mensajes en la lista
  void addUserMessage(String message) {
    setState(() {
      messages.add(TextMessage(message, true));
    });
    sendUserMsgToAI(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
            child: Column(children: [
              const StateBar(
                title: "Canal de texto",
                icon: IconData(0xf05a5, fontFamily: 'MaterialIcons'),
              ),

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