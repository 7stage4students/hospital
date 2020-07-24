import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:seven_health/components/app_bar.dart';
import 'package:seven_health/components/button.dart';
import 'package:seven_health/screens/not_found/not_found_screen.dart';
import 'package:seven_health/style/style.dart';
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Blood Group" + " A+ ",
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "23 yrs",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              MaterialButton(
                onPressed: () => {},
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Emergency Contact",
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),

        ///Mark
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
          onPress: () =>
              Navigator.of(context).popUntil(ModalRoute.withName("/")),
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
        title: Text('Manage Patient',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
        description: Text(
          'You must be an admin to view the patient.',
          textAlign: TextAlign.center,
        ),
        entryAnimation: EntryAnimation.DEFAULT,
        onOkButtonPressed: () => _launchURL(),
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

  _launchURL() async {
    const url = 'https://hospital-966e7.web.app/login';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
