import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';

Future<List<int>> getPixelData(XFile file) async {
  // Read the file as bytes
  final bytes = await file.readAsBytes();

  // Decode the image
  final ui.Image image = await decodeImageFromList(bytes);

  // Get the byte data
  final ByteData? byteData = await image.toByteData();

  if (byteData == null) {
    throw Exception('Failed to get pixel data');
  }

  // Convert to uint8 list
  final Uint8List pixels = byteData.buffer.asUint8List();

  // Each pixel is represented by 4 bytes (RGBA)
  // You can now access individual pixel values
  // For example, for pixel at index i:
  // Red = pixels[i * 4]
  // Green = pixels[i * 4 + 1]
  // Blue = pixels[i * 4 + 2]
  // Alpha = pixels[i * 4 + 3]

  return pixels.toList();
}

// Example usage in a widget:

List<int>? pixelData;

Future<void> pickAndAnalyzeImage() async {
  final ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    try {
      final pixels = await getPixelData(image);

      // Example: Print the RGB values of the first pixel
      if (pixels.length >= 4) {
        print('First pixel RGB: (${pixels[0]}, ${pixels[1]}, ${pixels[2]})');
      }
    } catch (e) {
      print('Error getting pixel data: $e');
    }
  }
}
