import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BasicPhotoUploadDialog {
  static Future<File?> showImageSourceDialog(BuildContext context,
      {bool fromGalleryEnabled = false}) async {
    return await showDialog<File>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('From Camera'),
                onTap: () async {
                  Navigator.of(context)
                      .pop(await _getImage(ImageSource.camera));
                },
              ),
              if (fromGalleryEnabled)
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Choose from gallery'),
                  onTap: () async {
                    Navigator.of(context)
                        .pop(await _getImage(ImageSource.gallery));
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  static Future<File?> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(
        source: source,
        imageQuality: 25,
      );
      if (pickedFile != null) {
        return File(pickedFile.path);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
