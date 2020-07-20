import 'package:flutter/material.dart';
import 'package:seven_health/style/style.dart';

class StandardButton extends StatelessWidget {
final String btnText;
final Color btnColor;
final VoidCallback onPress;


  const StandardButton({Key key, this.btnText, this.btnColor,  this.onPress}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
  return  RaisedButton(
    elevation: 0,
    highlightElevation: 0,
    textColor: Colors.white,
    padding: const EdgeInsets.all(0.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    onPressed: onPress,
    child: Container(
      width: screenWidth(context) / 1.2,
      height: 60,
      decoration: BoxDecoration(
        color: this.btnColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            this.btnText,
            style: btnTextStyle(),
          ),
        ],
      ),
    ),
  );
  }
}
