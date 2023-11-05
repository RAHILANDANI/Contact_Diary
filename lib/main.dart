import 'package:contactdiary/add.dart';
import 'package:contactdiary/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(contact());
}

class contact extends StatefulWidget {
  const contact({Key? key}) : super(key: key);

  @override
  State<contact> createState() => _contactState();
}

class _contactState extends State<contact> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      initialRoute: 'homepage',
      routes: {
        'homepage':(context) => homepage(),
        'add' : (context) => Add(),
      },
    );
  }
}
