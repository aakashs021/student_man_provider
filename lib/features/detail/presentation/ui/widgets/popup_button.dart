 import 'package:flutter/material.dart';
import 'package:student_management/core/styles/colors.dart';

IconButton popupbutton(BuildContext context) {
    return IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: white,
            ),
          );
  }