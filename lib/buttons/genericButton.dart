import 'package:flutter/material.dart';


class Button extends StatelessWidget {
  final String text;
  final Function press;
  final Color color;
  final Color textColor;
  final double width;

  const Button({Key key, this.text, this.press, this.color, this.textColor=Colors.white, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double myWidth;


    if (this.width == null) {
      myWidth = MediaQuery.of(context).size.width;
    } else {
      myWidth = this.width;
    }
    return Container(
      width: myWidth,
      padding: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child:  ElevatedButton(
          child: Text(text),
          onPressed: this.press,
        ),
      )



    );
  }
}

