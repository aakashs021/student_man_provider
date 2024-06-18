import 'package:flutter/material.dart';
import 'package:student_management/core/styles/colors.dart';
import 'package:student_management/features/addpage/presentation/ui/widgets/add_screen1.dart';
import 'package:student_management/student%20model/student_model.dart';

Expanded elevatededitbutton(BuildContext context, StudentModel sd) {
  return Expanded(
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddScreen1(
            id: sd.id,
            name: sd.name,
            location: sd.location,
            phone: sd.phonenumber,
            standard: sd.standard,
            gender: sd.gender,
            image: sd.image,
            datetime: sd.dateTime,
          ),
        ));
      },
      child: const Text(
        'Edit',
        style: TextStyle(fontSize: 16, color: white),
      ),
    ),
  );
}
