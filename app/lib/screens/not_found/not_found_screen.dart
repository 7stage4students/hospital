import 'package:flutter/material.dart';
import 'package:seven_health/components/app_bar.dart';
import 'package:seven_health/components/button.dart';
import 'package:seven_health/style/style.dart';

class NotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: getAppBar("Error Occured"),
          backgroundColor: Colors.white,
          body: buildNotFound(context)),
    );
  }

 
}
 Center buildNotFound(BuildContext context) {
    return Center(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset("assets/img/not_found.gif"),
                Text(
                  "Error Occurred. Invalid QR Code",
                  style: textSyle(),
                ),
                SizedBox(
                  height: 20,
                ),
                StandardButton(
                  btnText: "Search New Patient",
                  btnColor: primary,
                  onPress: () => Navigator.of(context)
                      .popUntil(ModalRoute.withName("/")),
                ),
              ],
            ),
          ),
        );
  }