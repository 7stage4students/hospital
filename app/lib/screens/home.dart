import 'package:flutter/material.dart';
import 'package:studentmanagement/style/style.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, bottom: 20.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("7 Advanced Academy", style: titleStyle()),
                SizedBox(height: 20.0),
                Text("Scan Student QR Code.", style: subTitleStyle()),
              ],
            ),
          ),
          Expanded(
            child: Container(
              //padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: greyBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/scan-code");
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
                        Navigator.of(context).pushNamed("/get-matricule");
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
                              'Enter Matricule',
                              style: btnTextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
