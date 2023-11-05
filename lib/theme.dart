import 'package:flutter/material.dart';

class themedata extends StatefulWidget {
  const themedata({Key? key}) : super(key: key);

  @override
  State<themedata> createState() => _themedataState();
}

class _themedataState extends State<themedata> {
  bool istrue = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      theme: istrue?ThemeData.dark():ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            SwitchListTile(
              value: istrue,
              onChanged: (value) {
                setState(() {
                  istrue = value;

                });
              },
            )
          ],
        ),
      ),
    );
  }
}
