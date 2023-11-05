import 'package:contactdiary/add.dart';
import 'package:contactdiary/edit.dart';
import 'package:flutter/material.dart';

import 'listt.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  bool istrue = false;
  bool a = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: istrue ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
            // backgroundColor: Colors.white,
            title: Text(
              "Contact",
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: SwitchListTile(
                  value: istrue,
                  onChanged: (value) {
                    setState(() {
                      istrue = value;
                    });
                  },
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.menu,
                color: Colors.black,
              ),
              SizedBox(
                width: 20,
              ),
            ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Add(),
                  )).then((value) {
                setState(() {});
              });
            });
          },
          child: Icon(Icons.add),
        ),
        body: contactlist.isEmpty ? emptyy() : details(),
      ),
    );
  }
}

class emptyy extends StatefulWidget {
  const emptyy({Key? key}) : super(key: key);

  @override
  State<emptyy> createState() => _emptyyState();
}

class _emptyyState extends State<emptyy> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "images/box.png",
          scale: 5,
        ),
        Center(
          child: Text(
            "You have no contacts yet",
            style: TextStyle(color: Colors.black54, fontSize: 20),
          ),
        ),
      ],
    );
  }
}

class details extends StatefulWidget {
  const details({Key? key}) : super(key: key);

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: contactlist.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => edit(
                      index: index,
                      mapp: contactlist[index],
                    ),
                  )).then((value) {
                setState(() {});
              });
            },
            child: ListTile(
              leading: CircleAvatar(
                //child: Icon(Icons.person),
                //backgroundColor: Colors.grey.shade400,
                backgroundImage: FileImage(contactlist[index]['profilepic']),
              ),
              title: Row(
                children: [
                  Text(contactlist[index]['firstname']),
                  SizedBox(
                    width: 5,
                  ),
                  Text(contactlist[index]['lastname']),
                ],
              ),
              subtitle: Text(contactlist[index]['mobilenumber']),
            ),
          );
        },
      ),
    );
  }
}
