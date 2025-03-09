import 'dart:async';

import 'package:blur_from_scratch/logic/getPixelData.dart';
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
    List<int> pixels = await getPixelData(image);
    // Get dimensions
    final dimensions = await getImageDimensions(image);
    int imageWidth = dimensions['width'] ?? 0;
    var imageHeight = dimensions['height'];
    double pixelSplit =
        pixels.length / (imageWidth * 4); // multiplied by 4 since R G B A
    print('pixel split' + pixelSplit.toString());
    for (int y = 0; y < pixelSplit; y++) {}
  }
}
