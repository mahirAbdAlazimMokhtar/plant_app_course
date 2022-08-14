import 'package:flutter/material.dart';
import 'package:plant_ui/Screen/onBoarding_page.dart';

void main(){
  runApp(PlantApp());
}

class PlantApp extends StatefulWidget {
  const PlantApp({Key? key}) : super(key: key);

  @override
  State<PlantApp> createState() => _PlantAppState();
}

class _PlantAppState extends State<PlantApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.white
      ),
      title: 'Plant App',
      home: OnBoardingPage(),
    );
  }
}
