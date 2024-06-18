import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:student_management/features/addpage/presentation/state/pick_image.dart';

Widget imagewidget({required String? image, required BuildContext context}) {
  return Consumer<PickImageProvider>(builder: (context, img, child) {
    img.setimage(image);
    image=null;

    return GestureDetector(
      onTap: () async {
        await img.onpick();
      },
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 80,
        child: img.image != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.file(
                  File(img.image!),
                  width: 160,
                  fit: BoxFit.cover,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                      width: 100, 'assets/lotties/camera_add_page.json'),
                  const SizedBox(
                    width: 120,
                    child: Text(
                      style: TextStyle(color: Colors.black),
                      'Select a profile picture',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
      ),
    );
  });
}
