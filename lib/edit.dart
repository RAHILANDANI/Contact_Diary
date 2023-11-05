import 'dart:io';

import 'package:contactdiary/listt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class edit extends StatefulWidget {
  edit({Key? key, required this.index, required this.mapp}) {}
  File? file;
  final int index;
  final Map<String, dynamic> mapp;

  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController email = TextEditingController();
  ImagePicker imagePicker = ImagePicker();

  @override
  void initState() {
    fname.text = widget.mapp['firstname'];
    lname.text = widget.mapp['lastname'];
    number.text = widget.mapp['mobilenumber'];
    email.text = widget.mapp['mail'];
    widget.file = widget.mapp['profiepic'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit",
          style: TextStyle(color: Colors.black),
        ),
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        actions: [
          InkWell(
              onTap: () {
                widget.mapp['firstname'] = fname.text;
                widget.mapp['lastname'] = lname.text;
                widget.mapp['mobilenumber'] = number.text;
                widget.mapp['mail'] = email.text;
                widget.mapp['profiepic'] = widget.file;
                contactlist[widget.index] = widget.mapp;
                Navigator.pop(context);
              },
              child: Icon(Icons.done, color: Colors.black)),
          SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: InkWell(
                  onTap: () async {},
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.shade400,
                    backgroundImage:
                        FileImage(contactlist[widget.index]['profilepic']),
                    radius: 40,
                    child: Stack(
                      children: [
                        Positioned(
                          right: 1,
                          bottom: 4,
                          child: CircleAvatar(
                            radius: 10,
                            child: InkWell(
                              onTap: () {
                                imagePicker
                                    .pickImage(source: ImageSource.camera)
                                    .then((value) {
                                  widget.file = value as File?;
                                  setState(() {});
                                });
                              },
                              child: Icon(
                                Icons.add,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                "First Name",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 7,
              ),
              TextFormField(
                controller: fname,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                "Last Name",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 7,
              ),
              TextFormField(
                controller: lname,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                "Phone Number",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 7,
              ),
              TextFormField(
                controller: number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10)
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                "Email",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 7,
              ),
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.allow("@")],
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
