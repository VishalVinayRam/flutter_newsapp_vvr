import 'package:flutter/material.dart';
import './screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Uvce app",
      debugShowCheckedModeBanner: false,
      home: HomeApp(),
    );
  }
}
///home/linuxlite/learning/newsapp/flutter_newsapp_vvr/lib/widget/newtile.dart