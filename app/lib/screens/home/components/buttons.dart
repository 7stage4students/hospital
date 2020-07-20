import 'package:flutter/material.dart';
import 'package:seven_health/style/style.dart';

Column buildButtons(BuildContext context) {
  return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/scanCode");
                  },
                  elevation: 0,
                  highlightElevation: 0,
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: screenWidth(context) / 1.2,
                    height: 60,
                    decoration: BoxDecoration(
                      color: tertiary,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Scan Code',
                          style: btnTextStyle(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/insertCode");
                  },
                  elevation: 0,
                  highlightElevation: 0,
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 60,
                    decoration: BoxDecoration(
                      color: tertiary,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Enter 7Health Code',
                          style: btnTextStyle(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );}