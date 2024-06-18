import 'package:flutter/material.dart';
import 'package:student_management/features/detail/presentation/ui/widgets/row_for_detail.dart';
import 'package:student_management/student%20model/student_model.dart';

Container seconddivisiondetailpage(StudentModel sd) {
  return Container(
    margin: const EdgeInsets.all(20),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 4),
          blurRadius: 10,
        ),
      ],
    ),
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        rowfordetail(
          'Date of Birth',
          '${sd.dateTime.day}-${sd.dateTime.month}-${sd.dateTime.year}',
          Icons.cake,
        ),
        const Divider(color: Colors.black),
        rowfordetail('Phone number', sd.phonenumber, Icons.phone),
        const Divider(color: Colors.black),
        rowfordetail('location', sd.location, Icons.location_on),
        const Divider(color: Colors.black),
        rowfordetail('Gender', sd.gender, Icons.person),
        const Divider(color: Colors.black),
      ],
    ),
  );
}
