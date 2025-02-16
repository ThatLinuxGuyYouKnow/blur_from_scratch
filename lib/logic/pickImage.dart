import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage() {
  final ImagePicker _picker = ImagePicker();
  var image = _picker.pickImage(source: ImageSource.gallery);
  return image;
}
