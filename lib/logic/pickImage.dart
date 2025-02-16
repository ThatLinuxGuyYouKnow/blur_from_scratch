import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

Future<Map<String, int>> getImageDimensions(XFile file) async {
  // Create an Image object from the file
  final Image image = Image.file(File(file.path));

  // Completer to get image dimensions after load
  Completer<Map<String, int>> completer = Completer();

  image.image.resolve(ImageConfiguration()).addListener(
    ImageStreamListener(
      (ImageInfo info, bool _) {
        completer.complete({
          'width': info.image.width,
          'height': info.image.height,
        });
      },
    ),
  );

  return completer.future;
}

Future<void> pickImage() async {
  final ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    // Get dimensions
    final dimensions = await getImageDimensions(image);

    print('Width: ${dimensions['width']}');
    print('Height: ${dimensions['height']}');
  }
}
