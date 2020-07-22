import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:seven_health/components/app_bar.dart';
import 'package:seven_health/components/button.dart';
import 'package:seven_health/screens/not_found/not_found_screen.dart';
import 'package:seven_health/style/style.dart';
import 'package:seven_health/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

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
      appBar: getAppBar("Manage Patient", showBackArrow: false),
      backgroundColor: Colors.white,
      body: new WillPopScope(
          onWillPop: () async => false,
          child: widget.data["userId"] == null
              ? buildNotFound(context)
              : buildStudentInfo()),
    );
  }

  buildStudentInfo() {
    print(widget.data);
    return ListView(
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
        Center(
          child: Text(
            "Freddy Tamwo",
            style: titleStyle().copyWith(color: Colors.black, fontSize: 32),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Blood Group" + " A+ ",
                style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "26 yrs old",
                style: TextStyle(fontWeight: FontWeight.w800,color: Colors.blue),
              ),
              MaterialButton(onPressed: ()=>launchInBrowser("https://www.google.com"),
              child: Row(
                children: <Widget>[
                  Icon(Icons.phone,color: Colors.red,),
                  SizedBox(width: 8,),
                  Text("Emergency",style: TextStyle(color: Colors.red),)
                ],
              ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),

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
          btnText: "View History",
          btnColor: primary,
          onPress: _showUserInfo,
        ),
        SizedBox(
          height: 20,
        ),
        StandardButton(
          btnText: "Search New Patient",
          btnColor: primary,
          onPress: () =>
              Navigator.of(context).popUntil(ModalRoute.withName("/")),
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
          "assets/img/login.png",
          fit: BoxFit.cover,
        ),
        title: Text('Login To Continue',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
        description: Text(
          'Only approved doctors can view patient history.',
          textAlign: TextAlign.center,
        ),
        entryAnimation: EntryAnimation.DEFAULT,
        onOkButtonPressed: () => launchInBrowser("https://www.google.com"),
        buttonOkText: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        buttonOkColor: primary,
      ),
    );
  }
}
