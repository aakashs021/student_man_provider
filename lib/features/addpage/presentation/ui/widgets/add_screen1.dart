import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/features/addpage/presentation/state/showdate_provider.dart';
import 'package:student_management/features/addpage/presentation/ui/widgets/date_pic.dart';
import 'package:student_management/features/addpage/presentation/ui/widgets/drop.dart';
import 'package:student_management/features/addpage/presentation/ui/widgets/image_pic.dart';
import 'package:student_management/features/addpage/presentation/ui/widgets/location_textfield.dart';
import 'package:student_management/features/addpage/presentation/ui/widgets/name_textfield.dart';
import 'package:student_management/features/addpage/presentation/ui/widgets/phone_textfield.dart';
import 'package:student_management/features/addpage/presentation/ui/widgets/radiio_but.dart';
import 'package:student_management/features/addpage/presentation/ui/widgets/submit_button.dart';
import 'package:student_management/features/detail/presentation/ui/widgets/popup_button.dart';

class AddScreen1 extends StatelessWidget {
  final int? id;
  final String? image;
  final String? phone;
  final String? name;
  final String? location;
  final String? standard;
  final DateTime? datetime;
  final String? gender;
 const AddScreen1(
      {super.key,
      this.image='no',
      this.phone,
      this.name,
      this.id,
      this.datetime,
      this.gender,
      this.location,
      this.standard='no'});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    Provider.of<ShowdateProvider>(context,listen: false).oninit();
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF43C6AC),
              Color(0xFFF8FFAE),
            ],
          ),
        ),
        child: Stack(
          children: [
            Form(
              key: formKey,
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  imagewidget(image: image, context: context),
                  const SizedBox(height: 20),
                  nametextfeild(context: context, txt: name),
                  const SizedBox(height: 20),
                  locationtextfeild(context: context, txt: location),
                  const SizedBox(height: 20),
                  phonetextfeild(context: context, txt: phone),
                  const SizedBox(height: 20),
                  drop(context: context, stand: standard),
                  const SizedBox(height: 20),
                  showdate(context: context, date: datetime),
                  const SizedBox(height: 20),
                  radio(context: context, gender: gender),
                  const SizedBox(height: 20),
                  submitbutton(context: context, formkey: formKey, id: id)
                ],
              ),
            ),
            popupbutton(context)
          ],
        ),
      )),
    );
  }
}
