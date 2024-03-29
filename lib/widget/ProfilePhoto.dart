// ignore_for_file: file_names, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePhoto extends StatefulWidget {
  const ProfilePhoto({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePhoto> createState() => _ProfilePhotoState();
}

class _ProfilePhotoState extends State<ProfilePhoto> {
  File? _image;
  Future _pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      File? img = File(image!.path);

      // ignore: unnecessary_null_comparison
      if (image == null) return;
      setState(() {
        _image = img;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image:$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).backgroundColor;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    const myimage = AssetImage('assets/img.jpg');
    return ClipOval(
        child: Material(
      color: Colors.transparent,
      child: _image == null
          ? Ink.image(
              image: myimage,
              fit: BoxFit.cover,
              width: 115,
              height: 115,
            )
          : Image.file(
              _image!,
              width: 115,
              height: 115,
              fit: BoxFit.cover,
            ),
    ));
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: const Icon(
            Icons.edit,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      GestureDetector(
          onTap: (() => _pickImage()),
          child: ClipOval(
            child: Container(
              padding: EdgeInsets.all(all),
              color: color,
              child: child,
            ),
          ));
}
