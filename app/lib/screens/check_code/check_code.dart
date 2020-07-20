import 'package:flutter/material.dart';
import 'package:seven_health/components/app_bar.dart';
import 'package:seven_health/screens/check_code/components/searching.dart';
import 'package:seven_health/utils/db.dart';
import 'package:seven_health/screens/not_found/not_found_screen.dart';


class CheckCodeScreen extends StatefulWidget {
  final String code;

  const CheckCodeScreen({Key key, this.code}) : super(key: key);
  @override
  _CheckCodeScreenState createState() => _CheckCodeScreenState();
}

class _CheckCodeScreenState extends State<CheckCodeScreen> {

  @override
  Widget build(BuildContext context) {
      var sentCode = widget.code;

    return Scaffold(
      appBar: getAppBar("Check Code"),
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: getPatientsInfo(context, sentCode),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                !snapshot.hasData) {
              return NotFoundScreen();
            }
            return SearchingCode(code: sentCode);
          }),
    );
  }

 
}
