import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/features/addpage/presentation/state/location_provider.dart';

Widget locationtextfeild({required BuildContext context, String? txt}) {
  return Consumer<LocationProvider>(
    builder: (context, value, child) {
      value.onsubmit();
      value.setlocation(txt);
      return TextFormField(
        controller: value.location,
        decoration: InputDecoration(
          labelText: 'Location',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a location';
          }
          return null;
        },
      );
    },
  );
}