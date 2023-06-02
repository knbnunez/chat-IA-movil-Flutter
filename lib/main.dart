import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class StatBox extends StatelessWidget {
  final Icon icon;
  final Text countText;
  final Text subText;
  
  const StatBox({
    // Required = obligatorio
    required this.icon,
    required this.countText,
    required this.subText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(12),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
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
                child: icon,
              ),
          ),
          Text(
            countText.data!,
            style: const TextStyle(fontWeight: FontWeight.bold ),
          ),
          Text(subText.data!),
        ],
      ),
    );
  }
}

class ActivityBox extends StatelessWidget {
  const ActivityBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 28),
      width: 350,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),

        body: Container(
          margin: const EdgeInsets.all(20),
          // funciona también para --> padding: EdgeInsets.___
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Inicio",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(top: 16),
                    child: const Text(
                      "Resumen",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        StatBox(
                          icon: Icon(IconData(0xf05a5, fontFamily: 'MaterialIcons')),
                          countText: Text('3.950'),
                          subText: Text('Rtas. gen.'),
                        ),
                        StatBox(
                          icon: Icon(IconData(0xe332, fontFamily: 'MaterialIcons')),
                          countText: Text('1.000'),
                          subText: Text('Img. gen.'),
                        ),
                        StatBox(
                          icon: Icon(IconData(0xe35c, fontFamily: 'MaterialIcons')),
                          countText: Text('15'),
                          subText: Text('Trad. real.'),
                        ),
                      
                    ],
                  ),

                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < 3; i++) const ActivityBox()
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
