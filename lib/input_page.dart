import 'package:bmi_calculator/CalculatorBrain.dart';
import 'package:bmi_calculator/Constatnts.dart';
import 'package:bmi_calculator/Icon_Content.dart';
import 'package:bmi_calculator/Result_Page.dart';
import 'package:bmi_calculator/Reusable_Card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int _currentSliderValue = 120;
  int _AGE = 0;
  int _weight = 60;

  Color MaleCardColor = inActiveContainerColor;
  Color FemaleCardColor = inActiveContainerColor;

  // void updateColour(Gender selectedGender){
  //   if(selectedGender == Gender.male ){
  //     if(MaleCardColor == inActiveContainerColor){
  //       MaleCardColor = containerColor;
  //       FemaleCardColor = inActiveContainerColor;
  //     }else{
  //       MaleCardColor = inActiveContainerColor;
  //       FemaleCardColor = containerColor;
  //     }
  //   }else{
  //     if(selectedGender == Gender.female){
  //       if(FemaleCardColor == inActiveContainerColor){
  //         FemaleCardColor = containerColor;
  //         MaleCardColor = inActiveContainerColor;
  //       }else{
  //         FemaleCardColor = inActiveContainerColor;
  //         MaleCardColor = containerColor;
  //       }
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? containerColor
                        : inActiveContainerColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      name: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? containerColor
                        : inActiveContainerColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      name: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: (containerColor),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: nameTextStyle,
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$_currentSliderValue',
                        style: KNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: nameTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      thumbColor: Color(0xffEB1555),
                      activeTrackColor: Color(0xffD7D8DB),
                      inactiveTrackColor: Color(0xff747581),
                      overlayColor: Color(0x29fEB1555),
                      trackShape: RectangularSliderTrackShape(),
                      trackHeight: 5.0,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      //overlappingShapeStrokeColor: Color(0xff881541)
                    ),
                    child: Slider(
                      value: _currentSliderValue.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: (containerColor),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: nameTextStyle,
                        ),
                        Text(
                          _weight.toString(),
                          style: KNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  _weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  _weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: (containerColor),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: nameTextStyle,
                        ),
                        Text(
                          _AGE.toString(),
                          style: KNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  _AGE--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  _AGE++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'Calculate',
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(height: _currentSliderValue, weight: _weight);

              Navigator.push(context,
                         MaterialPageRoute(builder: (context) => ResultPage(
                           bmiResult: calc.calculateBMI(),
                           resultText: calc.getResult(),
                           interPretation: calc.getInterpretation(),
                         )));
            },
          )
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {

  final String buttonTitle;
  final GestureTapCallback onTap;

  BottomButton({required this.buttonTitle , required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      // onTap: () {
      //   //Navigator.pushNamed(context, '/result');\
      //   Navigator.push(context,
      //       MaterialPageRoute(builder: (context) => ResultPage()));
      // },
      child: Container(
        color: bottomcontainerColor,
        child: Center(
            child: Text(
          buttonTitle,
          style: KLArgeButtonStyle,
        ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPress;
  RoundIconButton({required this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
