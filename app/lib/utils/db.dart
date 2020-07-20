import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:seven_health/style/style.dart';

Future getPatientsInfo(BuildContext context, String matricule) async {
  // var url = 'http://10.0.2.2:8081/admin/patient/' + matricule;
  var url = 'https://jsonplaceholder.typicode.com/todos/1';
  var dio = Dio();
  // dio.options.connectTimeout = 5000; //5s
  // dio.options.receiveTimeout = 3000;
  try {
    Response response = await dio.get(url);
    print(response.data);
    //close previous dialog

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
