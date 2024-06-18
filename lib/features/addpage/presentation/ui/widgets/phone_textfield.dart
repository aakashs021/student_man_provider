import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/features/addpage/presentation/state/phone_provider.dart';

Widget phonetextfeild({required BuildContext context, String? txt}) {
  return Consumer<PhoneProvider>(builder: (context, value, child) {
    value.onsubmit();
    value.setphone(txt);
    return TextFormField(
      controller: value.phone,
      decoration: InputDecoration(
        labelText: 'Phone Number',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a phone number';
        }
        if (!RegExp(r'^\d{10}$').hasMatch(value)) {
          return 'Please enter a valid phone number';
        }
        return null;
      },
    );
  });
}