import './calculate_brain.dart';
import './calculate_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_class.dart';
import 'card_class_widget.dart';
import 'constents.dart';
import 'calculate_page.dart';
import 'calculate_brain.dart';

// enum good if u have more than one property of the class
// use to clean the code and if u back after while u will understand the code pretty much
enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //definition the var to use it in the class
  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;
// the classic if statement

  // void updateCardColor(Gender selectedGender) {
  //   if (selectedGender == Gender.male) {
  //     if (maleCardColor == inactiveCardColor) {
  //       maleCardColor = activeCardColor;
  //       // this to cancel the other select
  //       femaleCardColor = inactiveCardColor;
  //     } else {
  //       maleCardColor = inactiveCardColor;
  //     }
  //   }
  //   if (selectedGender == Gender.female) {
  //     if (femaleCardColor == inactiveCardColor) {
  //       femaleCardColor = activeCardColor;
  //       // cancel the select
  //       maleCardColor = inactiveCardColor;
  //     }
  //   } else {
  //     femaleCardColor = inactiveCardColor;
  //   }
  // }

  // i can replace it with ternary
  // i make the gender usable in the class with assign his value in other var
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        // take the whole screen
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: DryWidget(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                customColor: selectedGender == Gender.male
                    ? KActiveCardColor
                    : KInactiveCardColor,
                cardChild: IconWidget(
                  customIcon: FontAwesomeIcons.mars,
                  label: 'Male',
                ),
              )),
              Expanded(
                  child: DryWidget(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                customColor: selectedGender == Gender.female
                    ? KActiveCardColor
                    : KInactiveCardColor,
                cardChild: IconWidget(
                  customIcon: FontAwesomeIcons.venus,
                  label: 'Female',
                ),
              )),
            ],
          )),
          Expanded(
              child: DryWidget(
            customColor: KInactiveCardColor,
            cardChild: Column(
              // to center the element horizontally
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  // the widget shrink to fit the child i need to make it fit the screen
                  'Height',
                  style: KLabelStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //this tow lines work together to make the cm in the line
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      // convert  the int to string to be accepted
                      height.toString(),
                      style: KNumberStyle,
                    ),
                    Text(
                      'cm',
                      style: KLabelStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x30EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0)),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: DryWidget(
                customColor: KInactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Weight',
                      style: KLabelStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: KNumberStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundMaterialButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundMaterialButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: DryWidget(
                customColor: KInactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Age',
                      style: KLabelStyle,
                    ),
                    Text(
                      age.toString(),
                      style: KNumberStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundMaterialButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundMaterialButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )),
            ],
          )),
          // ues the nav without the routes if have one or two page to link
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(weight: weight, height: height);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CalculatePage(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          )));
            },
            child: Container(
              child: Center(
                child: Text(
                  'Calculate',
                  style: KButoomBuntton,
                ),
              ),
              height: 80.0,
              color: KBottomContanerColor,
              padding: EdgeInsets.only(bottom: 20.0),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
            ),
          )
        ],
      ),
    );
  }
}

class RoundMaterialButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  RoundMaterialButton({this.icon, this.onPressed});

  @override
  // customs widget that can hold properties related to the button
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
