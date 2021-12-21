import 'package:bmi_calculator/Constatnts.dart';
import 'package:bmi_calculator/Reusable_Card.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
 final String bmiResult;
 final String resultText;
 final String interPretation;

 ResultPage({required this.bmiResult , required this.resultText , required this.interPretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: KTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: containerColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: KReultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: KBmiTextStyle,
                  ),
                  Text(
                    interPretation,
                    textAlign: TextAlign.center,
                    style: KBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              buttonTitle: 'RE-Calculate',
              onTap: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
