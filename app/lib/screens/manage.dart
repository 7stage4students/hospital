
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:studentmanagement/components/app_bar.dart';
import 'package:studentmanagement/components/button.dart';
import 'package:studentmanagement/style/style.dart';

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
        appBar: getAppBar("Manage"),
        backgroundColor: greyBackground,
        body: widget.data["student"] == null ? Center(child: Text("Not Found"),):buildStudentInfo());
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
            btnText: "Mark As Present",
            btnColor: tertiary,
          ),
          SizedBox(
            height: 20,
          ),
          StandardButton(
            btnText: "Manage Student",
            btnColor: primary,
          ),
          SizedBox(
            height: 20,
          ),
          StandardButton(
            btnText: "Deactivate Account",
            btnColor: Colors.grey,
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
