import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app_ui_responsive/utils/choose_topic_page.dart';
import 'utils/home_page.dart';
import 'utils/themes.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kColorPrimary,
      ),
      // home: const HomePage(),
      initialRoute: '$HomePage',
      routes: {
        '$HomePage': (_) => const HomePage(),
        '$ChooseTopicPage': (_) => const ChooseTopicPage(),
      },
    );
  }
}
