import 'package:SICalculator/Screens/SICalcultaor.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Simple Interest Calcualtor",
        home:SICalcuator() ,
      theme: ThemeData(
        primaryColor: Color(0xFF55C595),
       // brightness: Brightness.dark,
        brightness: Brightness.dark,
          scaffoldBackgroundColor:Color(0xFF292847)

      ),
    );
        throw UnimplementedError();
  }


}