import 'package:classy/loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  //  timeZone: "Asia/Dhaka"
   initializeDateFormatting('bn');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: LoadingPage(),
    );
  }
}


