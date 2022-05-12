import './card_class_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constents.dart';
import 'card_class_widget.dart';

class CalculatePage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  CalculatePage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            child: Text(
              'Your Result',
              style: KTitleCalculatePage,
            ),
            margin: EdgeInsets.only(top: 20.0),
          )),
          Expanded(
              flex: 5,
              child: DryWidget(
                customColor: KActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText,
                      style: KResultText,
                    ),
                    Text(
                      bmiResult,
                      style: KButoomBuntton,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: KLabelStyle,
                    )
                  ],
                ),
              )),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-Calculate',
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
