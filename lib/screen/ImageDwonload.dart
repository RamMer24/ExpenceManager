import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageSaver(),
    );
  }
}

class ImageSaver extends StatefulWidget {
  @override
  _ImageSaverState createState() => _ImageSaverState();
}

class _ImageSaverState extends State<ImageSaver> {
  final picker = ImagePicker();
  XFile? imageFile;

  Future<void> _pickImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageFile = pickedImage;
    });
  }

  Future<void> _saveImage() async {
    if (imageFile != null) {
      final result = await GallerySaver.saveImage(imageFile!.path);

      if (result != null && result) {
        // Image saved successfully
        print('Image saved to gallery');
      } else {
        // Error saving image
        print('Error saving image');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Saver'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (imageFile != null)
              Image.file(File(imageFile!.path))
            else
              Text('No image selected'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Select Image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveImage,
              child: Text('Save Image to Gallery'),
            ),
          ],
        ),
      ),
    );
  }
}
