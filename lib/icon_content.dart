import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class CardSex extends StatelessWidget {
  CardSex({@required this.iconGenre, @required this.nameGenre});

  final IconData iconGenre;
  final String nameGenre;

  @override
  Widget build(BuildContext context) {
    const colorIcons = Color(0xFF8D8E98);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconGenre,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          nameGenre,
          style: kLabelStyle,
        )
      ],
    );
  }
}
