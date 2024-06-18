import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/features/addpage/presentation/state/radio_provider.dart';

Widget radio({required BuildContext context, required String? gender}) {
  return Consumer<RadioProvider>(
    builder: (context, value, child) {
      value.setgender(gender);
      gender=null;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Gender',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: const Text('Male'),
            leading: Radio<String>(
              activeColor: Colors.black,
              value: 'Male',
              groupValue: value.gender,
              onChanged: (String? val) {
                value.onchanged(val);
              },
            ),
          ),
          ListTile(
            title: const Text('Female'),
            leading: Radio<String>(
              activeColor: Colors.black,
              value: 'Female',
              groupValue: value.gender,
              onChanged: (String? val) {
                value.onchanged(val);
              },
            ),
          ),
        ],
      );
    },
  );
}


