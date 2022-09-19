import 'package:flutter/material.dart';
import 'utils/home_page.dart';
import 'utils/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kColorPrimary,
      ),
      home: const HomePage(),
    );
  }
}
