import 'package:flutter/material.dart';

Padding contactInfo(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20.0),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Finding a problem?",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          InkWell(
            onTap: () {
              showMyDialog(context);
            },
            child: Text(
              "Contact",
              style: TextStyle(color: Color(0xFFF4640B), fontSize: 18),
            ),
          ),
        ],
      ),
    ),
  );
}

Future<void> showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Facing a problem?',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'Email us at:',
                style: TextStyle(fontSize: 19),
              ),
              Padding(padding: const EdgeInsets.symmetric(vertical: 2.0)),
              Text('contactus.ieeemanipal [at] gmail.com',
                  style: TextStyle(color: Color(0xFFF3630B), fontSize: 18)),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
