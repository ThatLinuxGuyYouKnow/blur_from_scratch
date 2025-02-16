import 'package:flutter/material.dart';

class ImagePickerWidget extends StatelessWidget {
  ImagePickerWidget({super.key});
  Widget build(BuildContext context) {
    return Container(
      width: 550,
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20.0),
      ),
      height: 400,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.upload_file),
              Text('Upload the image you want to blur')
            ],
          ),
        ),
      ),
    );
  }
}
