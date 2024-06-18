import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/core/styles/colors.dart';
import 'package:student_management/features/detail/presentation/state/detail_provider.dart';
import 'package:student_management/features/detail/presentation/ui/widgets/elevated_deletebutton.dart';
import 'package:student_management/features/detail/presentation/ui/widgets/elevated_editbutton.dart';
import 'package:student_management/features/detail/presentation/ui/widgets/first_division_detailpage.dart';
import 'package:student_management/features/detail/presentation/ui/widgets/popup_button.dart';
import 'package:student_management/features/detail/presentation/ui/widgets/second_division_detailpage.dart';
import 'package:student_management/student%20model/student_model.dart';

class DetailScreen extends StatelessWidget {
  final StudentModel sd;
  const DetailScreen({super.key, required this.sd});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            ListView(
              children: [
                Consumer<DetailProvider>(builder: (context, value, child) =>  firstdivisiondetailpage(sd)),
                Consumer<DetailProvider>(builder: (context, value, child) =>  seconddivisiondetailpage(sd)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      elevatededitbutton(context, sd),
                      const SizedBox(width: 20),
                      elevatedeletebutton(context, red, sd),
                    ],
                  ),
                )
              ],
            ),
            popupbutton(context),
          ],
        ),
      ),
    );
  }
}
