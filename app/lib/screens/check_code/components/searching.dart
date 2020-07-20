import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:seven_health/components/button.dart';
import 'package:seven_health/style/style.dart';

class SearchingCode extends StatelessWidget {
  final String code;

  const SearchingCode({Key key, this.code}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: size.height * 0.3,
          width: size.width,
          child: SpinKitFadingCube(
            color: primary,
            size: 100,
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Text(
            'Searching ',
            style: textSyle().copyWith(fontSize: 24),
          ),
        ),
        SizedBox(height: 20),
        StandardButton(
          btnText: "Cancel",
          btnColor: tertiary,
          onPress: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
