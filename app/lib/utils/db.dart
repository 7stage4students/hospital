import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:studentmanagement/style/style.dart';

Future getStudentDetails(BuildContext context, String matricule) async {
  var url = 'https://seven-student-manager.web.app/student/' + matricule;
  var dio = Dio();
  // dio.options.connectTimeout = 5000; //5s
  // dio.options.receiveTimeout = 3000;
  try {
    Response response = await dio.get(url);
    print(response.data);
    //close previous dialog
    Navigator.of(context).pop();
    //navigate to new dialog
   Navigator.of(context).pushNamed("/manage",
       arguments: response.data);
  } catch (e) {
    print(e);
  }
}

showStudentInfo(BuildContext context) {
  return showDialog(
    context: context,
    builder: (_) => NetworkGiffyDialog(
      image: Image.asset(
        "assets/img/freddy.jpg",
        fit: BoxFit.cover,
      ),
      title: Text('Tamwo Nechie Freddy',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
      description: Text(
        'Do you want to mark name as present ?',
        textAlign: TextAlign.center,
      ),
      entryAnimation: EntryAnimation.DEFAULT,
      onOkButtonPressed: () {},
      buttonOkText: Text(
        'Yes',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      buttonOkColor: primary,
    ),
  );
}
