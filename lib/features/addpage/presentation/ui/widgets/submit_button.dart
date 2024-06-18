// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/database/database.dart';
import 'package:student_management/features/addpage/presentation/state/drop_provider.dart';
import 'package:student_management/features/addpage/presentation/state/location_provider.dart';
import 'package:student_management/features/addpage/presentation/state/name_provider.dart';
import 'package:student_management/features/addpage/presentation/state/phone_provider.dart';
import 'package:student_management/features/addpage/presentation/state/pick_image.dart';
import 'package:student_management/features/addpage/presentation/state/radio_provider.dart';
import 'package:student_management/features/addpage/presentation/state/showdate_provider.dart';
import 'package:student_management/features/detail/presentation/state/detail_provider.dart';
import 'package:student_management/features/detail/presentation/ui/widgets/detail_screen.dart';
import 'package:student_management/features/home/presentation/state/provider_add_data.dart';
import 'package:student_management/features/home/presentation/ui/widgets/home_screen.dart';
import 'package:student_management/student%20model/student_model.dart';

Widget submitbutton({
  required BuildContext context,
  required var formkey,
  required int? id,
}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      onPressed: () async {
        if (formkey.currentState!.validate() &&
            Provider.of<ShowdateProvider>(context, listen: false).dateTime !=
                null) {
          StudentModel sd = StudentModel(
              id: id ?? DateTime.now().microsecondsSinceEpoch,
              image:
                  Provider.of<PickImageProvider>(context, listen: false).image,
              name: Provider.of<NameProvider>(context, listen: false).name.text,
              location: Provider.of<LocationProvider>(context, listen: false)
                  .location
                  .text,
              phonenumber:
                  Provider.of<PhoneProvider>(context, listen: false).phone.text,
              gender: Provider.of<RadioProvider>(context, listen: false).gender,
              standard:
                  Provider.of<DropProvider>(context, listen: false).standard,
              dateTime: Provider.of<ShowdateProvider>(context, listen: false)
                  .dateTime!);

          id == null ? await add(sd) : await update(sd);
          await get();

          Provider.of<HomePageProvider>(context, listen: false).addstudent();

          Provider.of<PickImageProvider>(context, listen: false).onsubmit();
          Provider.of<NameProvider>(context, listen: false).onsubmit();
          Provider.of<LocationProvider>(context, listen: false).onsubmit();

          Provider.of<PhoneProvider>(context, listen: false).onsubmit();
          Provider.of<DropProvider>(context, listen: false).onsubmit();
          Provider.of<ShowdateProvider>(context, listen: false).onsubmit();
          Provider.of<RadioProvider>(context, listen: false).onsubmit();

          if (id == null) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (route) => false,
            );
          } else {
            Provider.of<DetailProvider>(context, listen: false).onadd(sd);
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => DetailScreen(sd: sd),
              ),
              (route) => route.isFirst,
            );
          }
        } else if (Provider.of<ShowdateProvider>(context, listen: false)
                .dateTime ==
            null) {
          Provider.of<ShowdateProvider>(context, listen: false).ispickedornot();
        }
      },
      child: Text(
        id == null ? 'Submit' : 'Update',
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ));
}
