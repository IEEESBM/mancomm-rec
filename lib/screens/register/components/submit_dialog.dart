import 'package:flutter/material.dart';
import 'package:recruitsite/models/reg.dart';
import 'package:recruitsite/services/database.dart';

void showDialogBox(BuildContext context, RegForm regForm) async {
  DatabaseService db = new DatabaseService();
  var ifAlreadyReg = db.checkIfReg(regForm);

  Dialog simpleDialog = Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: FutureBuilder<dynamic>(
      future: ifAlreadyReg,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data == false) {
          try {
            db.addNewReg(regForm);
            return dialogContainer(context, 'You have been registered!',
                bt1: 'Ok');
          } catch (e) {
            print(e);
            return dialogContainer(context, 'Something went wrong!',
                bt1: 'Try again', bt2: 'Home');
          }
        } else if (snapshot.data == true) {
          return dialogContainer(context, 'You have already registered!',
              bt1: 'Ok');
        }
        return Container(
            height: 100.0,
            width: 100.0,
            child: Center(child: CircularProgressIndicator()));
      },
    ),
  );
  showDialog(context: context, builder: (BuildContext context) => simpleDialog);
}

Container dialogContainer(BuildContext context, String msg,
    {String bt1, String bt2}) {
  return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height * 0.2,
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
                child: Text(
              msg,
              style: TextStyle(fontSize: 20.0),
            )),
            bt2 == null
                ? RaisedButton(
                    color: Color(0xFFF3630B),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      bt1,
                      style: TextStyle(fontSize: 19.0, color: Colors.white),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment,
                    children: [
                      RaisedButton(
                        color: Color(0xFFF3630B),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          bt1,
                          style: TextStyle(fontSize: 19.0, color: Colors.white),
                        ),
                      ),
                      RaisedButton(
                        color: Color(0xFFF3630B),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          bt2,
                          style: TextStyle(fontSize: 19.0, color: Colors.white),
                        ),
                      )
                    ],
                  ),
          ],
        ),
      ));
}
