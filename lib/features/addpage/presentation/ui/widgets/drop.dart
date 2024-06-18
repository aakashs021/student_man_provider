import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/features/addpage/presentation/state/drop_provider.dart';

Widget drop({required BuildContext context, required String? stand}) {
  return Consumer<DropProvider>(
    builder: (context, value, child) {
      // value.onsubmit();
      value.setstandard(stand);
      return DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Standard',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        value: value.standard,
        items: value.standards.map((String standard) {
          return DropdownMenuItem<String>(
            value: standard,
            child: Text(standard),
          );
        }).toList(),
        onChanged: (newValue) {
          value.onchanged(newValue);
        },
      );
    },
  );
}