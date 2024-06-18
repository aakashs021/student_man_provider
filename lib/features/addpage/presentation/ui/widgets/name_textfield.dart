import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/features/addpage/presentation/state/name_provider.dart';

Widget nametextfeild({required BuildContext context, String? txt}) {
  return Consumer<NameProvider>(
    builder: (context, value, child) {
      value.onsubmit();
      value.setname(txt);
      return TextFormField(
        controller: value.name,
        decoration: InputDecoration(
          labelText: 'Name',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a name';
          }
          return null;
        },
      );
    },
  );
}


