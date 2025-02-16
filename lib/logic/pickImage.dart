import 'dart:io';

import 'package:file_picker/file_picker.dart';

pickImage() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: [
      'jpg',
      'pdf',
    ],
  );
  if (result != null) {
    File file = File(result.files.single.path!);
    return file;
  }
  return null;
}
