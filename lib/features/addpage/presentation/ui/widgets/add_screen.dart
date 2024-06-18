// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:lottie/lottie.dart';
// import 'package:provider/provider.dart';
// import 'package:student_management/database/database.dart';
// import 'package:student_management/database/databasemobile.dart';
// import 'package:student_management/features/addpage/presentation/state/pick_image.dart';
// import 'package:student_management/features/detail/presentation/ui/widgets/popup_button.dart';
// import 'package:student_management/features/home/presentation/state/provider_add_data.dart';
// import 'package:student_management/features/home/presentation/ui/widgets/home_screen.dart';
// import 'package:student_management/student%20model/student_model.dart';

// class AddScreen extends StatefulWidget {
//   final int? id;
//   final String? name;
//   final String? location;
//   final String? phonenumber;
//   final String? standard;
//   final String? gender;
//   final String? image;
//   final DateTime? dateTime;
//   const AddScreen({
//     super.key,
//     this.id,
//     this.name,
//     this.location,
//     this.phonenumber,
//     this.standard,
//     this.gender,
//     this.image,
//     this.dateTime,
//   });

//   @override
//   State<AddScreen> createState() => _AddScreenState();
// }

// class _AddScreenState extends State<AddScreen> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController namecontroller = TextEditingController();
//   TextEditingController phonecontroller = TextEditingController();
//   TextEditingController locationcontroller = TextEditingController();
//   bool isdateofbirth = false;

//   String name = '';
//   String location = '';
//   String phoneNumber = '';
//   late String standard;
//   late String gender;
//   String? image;
//   DateTime? dateTime;

//   final List<String> standards = [
//     '1st Standard',
//     '2nd Standard',
//     '3rd Standard',
//     '4th Standard',
//     '5th Standard',
//     '6th Standard',
//     '7th Standard',
//     '8th Standard',
//     '9th Standard',
//     '10th Standard'
//   ];

//   Future<void> pickimage() async {
//     final ImagePicker picker = ImagePicker();
//     XFile? image = await picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       this.image = image?.path;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     namecontroller.text = widget.name ?? '';
//     locationcontroller.text = widget.location ?? '';
//     phonecontroller.text = widget.phonenumber ?? '';
//     standard = widget.standard ?? '1st Standard';
//     gender = widget.gender ?? 'Male';
//     image = widget.image;
//     dateTime = widget.dateTime;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) => PickImageProvider(),
//         )
//       ],
//       child: Scaffold(
//         body: SafeArea(
//           child: Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [
//                   Color(0xFF43C6AC),
//                   Color(0xFFF8FFAE),
//                 ],
//               ),
//             ),
//             child: Stack(
//               alignment: Alignment.topLeft,
//               children: [
//                 Form(
//                   key: _formKey,
//                   child: ListView(
//                     padding: const EdgeInsets.all(20),
//                     children: [
//                       Consumer<PickImageProvider>(
//                           builder: (context, img, child) {
//                         // img.setimage(image);
//                         return GestureDetector(
//                           onTap: () async {
//                             await img.onpick();
//                             // await Provider.of<PickImageProvider>(context,
//                             //         listen: false)
//                             //     .onpick();
//                             image = img.image;
//                           },
//                           child: CircleAvatar(
//                             backgroundColor: Colors.white,
//                             radius: 80,
//                             child: img.image != null
//                                 ? ClipRRect(
//                                     borderRadius: BorderRadius.circular(100),
//                                     child: Image.file(
//                                       File(img.image!),
//                                       width: 160,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   )
//                                 : Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Lottie.asset(
//                                           width: 100,
//                                           'assets/lotties/camera_add_page.json'),
//                                       const SizedBox(
//                                         width: 120,
//                                         child: Text(
//                                           style: TextStyle(color: Colors.black),
//                                           'Select a profile picture',
//                                           textAlign: TextAlign.center,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                           ),
//                         );
//                       }),
//                       const SizedBox(height: 20),
//                       TextFormField(
//                         controller: namecontroller,
//                         decoration: InputDecoration(
//                           labelText: 'Name',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter a name';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 20),
//                       TextFormField(
//                         controller: locationcontroller,
//                         decoration: InputDecoration(
//                           labelText: 'Location',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter a location';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 20),
//                       TextFormField(
//                         controller: phonecontroller,
//                         decoration: InputDecoration(
//                           labelText: 'Phone Number',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                         ),
//                         keyboardType: TextInputType.phone,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter a phone number';
//                           }
//                           if (!RegExp(r'^\d{10}$').hasMatch(value)) {
//                             return 'Please enter a valid phone number';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 20),
//                       DropdownButtonFormField<String>(
//                         decoration: InputDecoration(
//                           labelText: 'Standard',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                         ),
//                         value: standard,
//                         items: standards.map((String standard) {
//                           return DropdownMenuItem<String>(
//                             value: standard,
//                             child: Text(standard),
//                           );
//                         }).toList(),
//                         onChanged: (newValue) {
//                           setState(() {
//                             standard = newValue!;
//                           });
//                         },
//                       ),
//                       const SizedBox(height: 20),
//                       GestureDetector(
//                         onTap: () {
//                           showDatePicker(
//                                   context: context,
//                                   initialDate: dateTime ?? DateTime.now(),
//                                   firstDate: DateTime(2000),
//                                   lastDate: DateTime.now())
//                               .then((value) {
//                             if (value != null) {
//                               setState(() {
//                                 dateTime = value;
//                                 isdateofbirth = false;
//                               });
//                             }
//                           });
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 15, horizontal: 10),
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.grey),
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Text(
//                             dateTime == null
//                                 ? 'Select your date of birth'
//                                 : '${dateTime!.day}-${dateTime!.month}-${dateTime!.year}',
//                             style: TextStyle(
//                               fontSize: 17,
//                               color: dateTime == null
//                                   ? Colors.grey.shade600
//                                   : Colors.black,
//                             ),
//                           ),
//                         ),
//                       ),
//                       isdateofbirth
//                           ? Text(
//                               '   Please enter your date of birth',
//                               style: TextStyle(
//                                   fontSize: 11.5, color: Colors.red.shade900),
//                             )
//                           : const SizedBox(),
//                       const SizedBox(height: 20),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Gender',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                           radio('Male'),
//                           radio('Female'),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       addbutton(context),
//                     ],
//                   ),
//                 ),
//                 popupbutton(context)
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   ListTile radio(String text) {
//     return ListTile(
//       title: Text(text),
//       leading: Radio<String>(
//         activeColor: Colors.black,
//         value: text,
//         groupValue: gender,
//         onChanged: (String? value) {
//           setState(() {
//             gender = value!;
//           });
//         },
//       ),
//     );
//   }

//   Widget addbutton(BuildContext context) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.blue,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         padding: const EdgeInsets.symmetric(vertical: 15),
//       ),
//       onPressed: () async {
//         if (_formKey.currentState!.validate() && dateTime != null) {
//           StudentModel sd = StudentModel(
//               id: widget.id == null
//                   ? DateTime.now().microsecondsSinceEpoch
//                   : widget.id!,
//               image: PickImageProvider().image,
//               name: namecontroller.text,
//               location: locationcontroller.text,
//               phonenumber: phonecontroller.text,
//               gender: gender,
//               standard: standard,
//               dateTime: dateTime!);
//           if (widget.name == null) {
//             await add(sd);
//           } else {
//             await updateformobile(sd);
//           }
//           await get();
//           // value.addstudent();
//           HomePageProvider().addstudent();

//           Navigator.of(context).pushAndRemoveUntil(
//             MaterialPageRoute(
//               builder: (context) => HomeScreen(),
//             ),
//             (route) => false,
//           );
//         } else if (dateTime == null) {
//           // setState(() {
//           //   isdateofbirth = true;
//           // });
//         }
//           print(Provider.of<PickImageProvider>(context, listen: false).image);
//       },
//       child: Text(
//         widget.name != null ? 'Update' : 'Submit',
//         style: const TextStyle(fontSize: 16, color: Colors.white),
//       ),
//     );
//   }
// }
