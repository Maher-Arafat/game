import 'package:flutter/material.dart';
import 'homeScrean.dart';

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
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor: Colors.blueGrey,
        shadowColor: const Color.fromARGB(255, 86, 151, 136),
        splashColor: const Color.fromARGB(255, 44, 153, 142),
      ),
      home: const HomePage(),
    );
  }
}
