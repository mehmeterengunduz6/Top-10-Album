import 'package:flutter/material.dart';

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text(
      "OK.",
      style: TextStyle(fontSize: 14),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: Text(
      "Please enter your username correctly.",
      style: TextStyle(fontSize: 14),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showMyAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text(
      "OK.",
      style: TextStyle(fontSize: 14),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: Text(
      "There is no listened album belonging to this user",
      style: TextStyle(fontSize: 14),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
