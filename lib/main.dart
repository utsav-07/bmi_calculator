import 'package:bmi_calculator/Result_Page.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculator());
}


class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(

            primaryColor: Color(0xff0A0D22),
            scaffoldBackgroundColor: Color(0xff0A0D22),




      ),
      debugShowCheckedModeBanner: false,
      //home: InputPage(),
      initialRoute: '/',
      routes: {
        '/':(context) => (InputPage()),
       // '/result' : (context) => (ResultPage()),
      },
    );
  }
}

