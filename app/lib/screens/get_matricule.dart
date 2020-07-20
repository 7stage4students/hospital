import 'package:flutter/material.dart';
import 'package:studentmanagement/components/app_bar.dart';
import 'package:studentmanagement/style/style.dart';
import 'package:studentmanagement/utils/db.dart';
import 'package:studentmanagement/utils/utils.dart';

class GetMatricule extends StatefulWidget {
  @override
  _GetMatriculeState createState() => _GetMatriculeState();
}

class _GetMatriculeState extends State<GetMatricule> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  String matricule;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Matricule"),
      backgroundColor: greyBackground,
      body: Center(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 15.0),
                  width: screenWidth(context) / 1.2,
                  child: Text(
                      'Please enter a user matricule, We will send you user info.',
                      style: TextStyle(color: Colors.grey)),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: greyBorder, blurRadius: 5)],
                  ),
                  child: TextFormField(
                    validator: (String value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter user matricule';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'e.g: 202054532151',
                    ),
                    onChanged: (String value) {
                      matricule = value.trim();
                    },
                  ),
                ),
                SizedBox(height: 40.0),
                RaisedButton(
                  onPressed: () {
                    // submit function

                    getMatricule();
                  },
                  elevation: 0,
                  highlightElevation: 0,
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: screenWidth(context) / 1.2,
                    height: 60,
                    decoration: BoxDecoration(
                      color: tertiary,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Send',
                          style: btnTextStyle(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getMatricule() async {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      setState(() {
        _autoValidate = true;
      });
    } else {
      showLoadingBox((context), matricule);
      form.save();

      await getStudentDetails(context, matricule);

      /// go to manager
      // Navigator.of(context).pushNamed("/manage", arguments: matricule);
    }
  }
}
