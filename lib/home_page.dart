import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hello_camera/upload_service.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  File _file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Hello Camera"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.file_upload,
              color: Colors.white,
            ),
            onPressed: _onClickUpload,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tire uma foto',
              style: TextStyle(fontSize: 25),
            ),
            _file != null
                ? Image.file(_file)
                : Image.asset(
                    "assets/images/camera.png",
                    width: 140,
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClickCamera,
        tooltip: 'Increment',
        child: Icon(Icons.camera),
      ),
    );
  }

  void _onClickCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      this._file = image;
    });
  }

  void _onClickUpload() {
    if (_file !=  null) {
      UploadService.upload(_file);
    }
  }
}
