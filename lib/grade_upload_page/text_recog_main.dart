import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:muhan_project_ocrtest2/text_recognition.dart';
import 'dart:io';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ImageProcessingTest",
      home: TestPage(),
    );
  }
}

class TestPage extends StatefulWidget {
  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  File? _preprocessingImage;
  final textRecognizer = TextRecognizer(script: TextRecognitionScript.korean);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null ? Image.file(File(_image!.path)) : const Text("null"),
            ElevatedButton(
              onPressed: () async {
                await getGalleryImage();
                ScoreTextRecognition sr = ScoreTextRecognition(_image!);
                _preprocessingImage = await sr.scoreProcessing();
                setState(() {
                  _preprocessingImage;
                });
              },
              child: const Text("ImagePick"),
            ),
            _preprocessingImage != null ? Image.file(File(_preprocessingImage!.path)) : const Text("null"),
          ],
        ),
      ),
    );
  }

  Future<void> getGalleryImage() async {
    _image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image;
    });
  }
}
