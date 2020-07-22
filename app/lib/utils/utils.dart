import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:seven_health/style/style.dart';
import 'package:url_launcher/url_launcher.dart';

showLoading(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
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

showLoadingBox(BuildContext context, String code) {
  return showDialog(
    context: context,
    builder: (_) => NetworkGiffyDialog(
      image: Image.asset(
        "assets/img/loading_cat.gif",
        fit: BoxFit.cover,
      ),
      title: Text('Searching for ' + code,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
      description: Text(
        'Please be patient while we get information.',
        textAlign: TextAlign.center,
      ),
      entryAnimation: EntryAnimation.DEFAULT,
      onlyOkButton: true,
      onOkButtonPressed: () => {Navigator.of(context).pop()},
      buttonOkText: Text(
        'Cancel',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      buttonOkColor: primary,
    ),
  );
}

Future<void> launchInBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    );
  } else {
    throw 'Could not launch $url';
  }
}
