import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

String geteNameFromEmail(String email) {
  return email.split('@')[0];
}

// Future<List<File>> pickImages() async {
//   List<File> images = [];
//   final ImagePicker picker = ImagePicker();
//   final imageFile = await picker.pickMultiImage();
//   if (imageFile.isNotEmpty) {
//     for (final image in imageFile) {
//       images.add(File(image.path));
//     }
//   }
//   return images;
// }

// Future<File?> pickImage() async {
//   final ImagePicker picker = ImagePicker();
//   final imageFile = await picker.pickImage(source: ImageSource.gallery);
//   if (imageFile != null) {
//     return File(imageFile.path);
//   }

//   return null;
// }


   Future<List<File>> pickFiles() async {
    List<File> files = [];
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      files = result.paths.map((path) => File(path!)).toList();
    }
    return files;
  }

   Future<File?> pickFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      return File(result.files.single.path!);
    }
    return null;
  }
