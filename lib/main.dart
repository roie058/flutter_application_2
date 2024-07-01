import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/cart.dart';
import 'package:flutter_application_2/pages/intro_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Cart(),
        builder: (context, child) => const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: IntroPage(),
            ));
  }
}
