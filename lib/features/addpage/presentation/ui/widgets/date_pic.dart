import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/features/addpage/presentation/state/showdate_provider.dart';

Widget showdate({required BuildContext context, required DateTime? date}) {
  return Consumer<ShowdateProvider>(
    builder: (context, value, child) {
      value.setdatetime(date);
      date=null;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              showDatePicker(
                      context: context,
                      initialDate: value.dateTime ?? DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now())
                  .then((val) {
                if (val != null) {
                  value.onpicked(val);
                }
              });
            },
            child: Container(
              width: 220,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                value.dateTime == null
                    ? 'Select your date of birth'
                    : '${value.dateTime!.day}-${value.dateTime!.month}-${value.dateTime!.year}',
                style: TextStyle(
                  fontSize: 17,
                  color: value.dateTime == null
                      ? Colors.grey.shade600
                      : Colors.black,
                ),
              ),
            ),
          ),
          !value.ispicked
              ? Text(
                  '   Please enter your date of birth',
                  style: TextStyle(fontSize: 11.5, color: Colors.red.shade900),
                )
              : const SizedBox(),
        ],
      );
    },
  );
}