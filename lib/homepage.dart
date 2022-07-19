import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? imageFile;
  void _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
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
          const SizedBox(
            height: 50,
          ),
          imageFile != null
              ? Image.file(imageFile!)
              : // Container

          Icon(
            Icons.camera_enhance_rounded,
            color: Colors.green,
            size: MediaQuery.of(context).size.width * .6,
          ), //  Container

          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              onPressed: () {
                _getFromCamera();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.purple),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
                  textStyle:
                  MaterialStateProperty.all(const TextStyle(fontSize: 16))),
              child: const Text('Capture Image with Camera'),
            ),
          ),
        ],
      ),
    );
  }
}
