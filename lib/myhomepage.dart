import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createstate() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  File? imageFile;

  void _getFromCamera() async {
    XFile? pickedFile = awaait ImagePicker().pickImage(
      source: IMageSource.camera,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 50,),
          imageFile != null ?
          Container(
            child: Image.file(imageFile!),
          ) :  // Container

          Container(
            child: Icon(
              Icons.camera_enhance_rounded,
              color: Colors.green,
              size: MediaQuery.of(context).size.width * .6,
            ),  // Icon
          ),  //  Container

          Padding(
             padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              child: Text('Capture Image with Camera'),
              onPressed: () {
                _getFromCamera();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
                padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16))
              ),  //ButtonStyle
            ),  // ElevatedButton
          ),  // Padding
        ],
      ),  // ListView
    );  // Scaffold  
  }
}
