import 'dart:io';
import 'package:contactdiary/listt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Add extends StatefulWidget {
  Add({Key? key}) : super(key: key);
  XFile? xFile;

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController email = TextEditingController();
  ImagePicker imagePicker = ImagePicker();

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Add",
            style: TextStyle(color: Colors.black),
          ),
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          actions: const [
            Icon(Icons.done, color: Colors.black),
            SizedBox(
              width: 20,
            )
          ],
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade400,
                      backgroundImage:
                          FileImage(File(widget.xFile?.path ?? "")),
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
                                    widget.xFile = value;
                                    setState(() {});
                                  });
                                },
                                child: const Icon(
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
                  const SizedBox(
                    height: 14,
                  ),
                  const Text(
                    "First Name",
                    style: TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                    controller: fname,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                      hintText: "Rahil",
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? false) {
                        return "Enter the first name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Text(
                    "Last Name",
                    style: TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                    controller: lname,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                      hintText: "Andani",
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? false) {
                        return "Enter the Last name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Text(
                    "Phone Number",
                    style: TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10)
                    ],
                    controller: number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1),
                        ),
                        hintText: "9228820333",
                        prefixText: "+91"),
                    validator: (value) {
                      if (value?.isEmpty ?? false) {
                        return "Enter 10 digit mobile number";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Text(
                    "Email",
                    style: TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                      hintText: "rahilandani786@gmail.com",
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? false) {
                        return "Enter the mail";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (key.currentState?.validate() ?? false) {
                          contactlist.add({
                            'firstname': fname.text,
                            'lastname': lname.text,
                            'mobilenumber': number.text,
                            'mail': email.text,
                            'profilepic': File(widget.xFile?.path ?? "")
                          });
                          Navigator.pop(context);
                          setState(() {});
                        } else {
                          return;
                        }
                      },
                      child: const Text("SAVE"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
