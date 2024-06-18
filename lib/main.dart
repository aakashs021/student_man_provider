import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/database/database.dart';
import 'package:student_management/features/addpage/presentation/state/pick_image.dart';
import 'package:student_management/features/addpage/presentation/state/drop_provider.dart';
import 'package:student_management/features/addpage/presentation/state/location_provider.dart';
import 'package:student_management/features/addpage/presentation/state/name_provider.dart';
import 'package:student_management/features/addpage/presentation/state/phone_provider.dart';
import 'package:student_management/features/addpage/presentation/state/radio_provider.dart';
import 'package:student_management/features/addpage/presentation/state/showdate_provider.dart';
import 'package:student_management/features/detail/presentation/state/detail_provider.dart';
import 'package:student_management/features/home/presentation/state/provider_add_data.dart';
import 'package:student_management/features/splash/presentation/ui/widgets/splash_screen.dart';

void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await initdb();
  await get();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomePageProvider(),),
        ChangeNotifierProvider(create: (context) => RadioProvider(),),
        ChangeNotifierProvider(create: (context) => PhoneProvider(),),
        ChangeNotifierProvider(create: (context) => ShowdateProvider(),),
        ChangeNotifierProvider(create: (context) => NameProvider(),),
         ChangeNotifierProvider(create: (context) => DropProvider(),),
         ChangeNotifierProvider(create: (context) => DetailProvider(),),
        ChangeNotifierProvider(create: (context) => LocationProvider(),),
        ChangeNotifierProvider(create: (context) => PickImageProvider(),)
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
