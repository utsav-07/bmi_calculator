

import 'dart:math';

class CalculatorBrain{
  final int height;
  final int weight;



  CalculatorBrain({ required this.height , required this.weight});
  double _bmi = 0;
  String calculateBMI(){
     _bmi = weight/pow(height/100 ,2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      return 'Overweight';
    }else if(_bmi > 18.5){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if(_bmi >= 25){
      return 'You have more weight . do execise';
    }else if(_bmi > 18.5){
      return 'Normal Body Weight . Good job!';
    }else{
      return 'Lower than normal body weifht . Eat more';
    }
  }
}