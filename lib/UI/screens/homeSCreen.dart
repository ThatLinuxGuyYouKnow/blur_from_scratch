import 'package:blur_from_scratch/UI/widgets/button.dart';
import 'package:blur_from_scratch/UI/widgets/imagePickWidget.dart';
import 'package:blur_from_scratch/logic/pickImage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ImagePickerWidget(),
              Button(
                buttonText: 'geblur',
                onPressed: () {},
              )
            ]),
            VerticalDivider(
              thickness: 2,
              color: Colors.white,
            ),
            ImagePickerWidget(),
          ],
        ),
      ),
    );
  }
}
