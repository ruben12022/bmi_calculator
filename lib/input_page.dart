import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'round_icon_button.dart';

enum Gender { male, female }
Gender gender;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180, weight = 70, age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: (selectedGender == Gender.male)
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    cardChild: new CardSex(
                      iconGenre: FontAwesomeIcons.mars,
                      nameGenre: 'HOMBRE',
                    ),
                  ),
                ),
                Expanded(
                  child: new ReusableCard(
                    color: (selectedGender == Gender.female)
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardChild: CardSex(
                      iconGenre: FontAwesomeIcons.venus,
                      nameGenre: 'MUJER',
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'ALTURA',
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '$height',
                        style: kNumberStyle,
                      ),
                    ],
                  ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    thumbShape:
                    RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape:
                    RoundSliderOverlayShape(overlayRadius: 30),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xff8d8e98),
                    thumbColor: Color(0xffeb1555),
                    overlayColor: Color(0x29eb1555)),
                  child:
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: Color(0xffeb1555),
                    inactiveColor: Color(0xff808b88),
                    onChanged: (newValue) {
                      setState(() {
                        height = newValue.round();
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
              children: <Widget>[
                Expanded(
                    child: new ReusableCard(color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'PESO',
                          style: kLabelStyle,
                        ),
                        Text(
                          '$weight',
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            RoundIconButton(
                              icon: Icons.remove ,
                              onPressed: (){
                                setState(() {
                                 if (weight > 20 ) {
                                   weight--;
                                 }
                                });
                              }
                            ),
                            RoundIconButton(
                              icon:Icons.add,
                                onPressed: (){
                                  setState(() {
                                    if (weight < 160 ) {
                                      weight++;
                                    }
                                  });
                                }
                            )
                          ],
                        ),
                      ],
                    ),
                    )

                ),
                Expanded(
                  child: new ReusableCard(color: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'EDAD',
                        style: kLabelStyle,
                      ),
                      Text(
                        '$age',
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: <Widget>[
                           RoundIconButton(
                               icon: Icons.remove ,
                               onPressed: (){
                                 setState(() {
                                   if (age > 10 ) {
                                     age--;
                                   }
                                 });
                               }
                           ),
                           RoundIconButton(
                               icon:Icons.add,
                               onPressed: (){
                                 setState(() {
                                   if (age < 100 ) {
                                     age++;
                                   }
                                 });
                               }
                           )
                         ],
                      ),
                    ],
                  ),

                  ),
                )
              ],
            ),
          ),
          Container(
            color: KcolorButton,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: KbottomContainerHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

              ],
            ),
          )
        ],
      ),
    );
  }
}

