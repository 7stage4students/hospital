import 'package:flutter/material.dart';
import 'package:seven_health/screens/home/components/buttons.dart';
import 'package:seven_health/screens/home/components/topBar.dart';
import 'package:seven_health/style/style.dart';

Column buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        buildTopBar(),
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
              child: buildButtons(context),
            ),
          ),
        ),
      ],
    );
  }




