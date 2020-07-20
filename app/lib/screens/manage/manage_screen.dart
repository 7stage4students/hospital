
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:seven_health/components/app_bar.dart';
import 'package:seven_health/components/button.dart';
import 'package:seven_health/screens/not_found/not_found_screen.dart';
import 'package:seven_health/style/style.dart';

class ManageScreen extends StatefulWidget {
  final dynamic data;

  const ManageScreen({Key key, this.data}) : super(key: key);
  @override
  _ManageScreenState createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar("Manage Patient", showBackArrow:  false),
        backgroundColor: Colors.white,
        body:  new WillPopScope(onWillPop: ()async=>false,
        child: widget.data["usesssrId"] == null ? buildNotFound(context):buildStudentInfo()), );
  }

  Column buildStudentInfo() {
    print(widget.data);
    return Column(
        children: <Widget>[
          ///student picture
          ClipRect(
            child: Image.asset(
              "assets/img/freddy.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Freddy Tamwo",
            style: titleStyle().copyWith(color: Colors.grey, fontSize: 32),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Web Development" + " - ",
              ),
              SizedBox(
                width: 8,
              ),
              Text(
               "test",
                style: TextStyle(fontWeight: FontWeight.w400),
              )
            ],
          ),
          SizedBox(height: 16,),

          ///Mark Presetn
          StandardButton(
            btnText: "Manage Patient",
            btnColor: tertiary,
            onPress: _showUserInfo,
          ),
          SizedBox(
            height: 20,
          ),
          StandardButton(
            btnText: "Search New Patient",
            btnColor: primary,
            onPress:()=> Navigator.of(context).popUntil(ModalRoute.withName("/")),
            
          ),
          SizedBox(
            height: 20,
          ),
         

          ///Manage Student

          ///disable account
        ],
      );
  }

  Future<Null> _showUserInfo() {
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
}
