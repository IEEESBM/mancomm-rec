import 'package:flutter/material.dart';
import 'package:recruitsite/models/domain.dart';
import 'package:recruitsite/models/instruction.dart';
import 'package:recruitsite/models/reg.dart';
import 'package:recruitsite/screens/register/components/validators.dart';
import 'package:recruitsite/screens/register/components/contact.dart';
import 'package:validators/validators.dart' as validator;
import 'components/checkbox.dart';
import 'components/dropdown.dart';
import 'components/submit_dialog.dart';
import 'components/widgets.dart';

class RegDesktop extends StatefulWidget {
  @override
  _RegDesktopState createState() => _RegDesktopState();
}

class _RegDesktopState extends State<RegDesktop> {
  final _formKey = GlobalKey<FormState>();
  RegForm regForm = RegForm();

  int _selectedStream;

  AllDomains alldomains = AllDomains();
  InsData insData = InsData(isChecked: false);

  String chkErrMsg = '';

  @override
  Widget build(BuildContext context) {
    alldomains.clearChoices();
    return Scaffold(
        backgroundColor: Color(0xFFF3630B),
        body: Container(
            child: Center(
                child: Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: 130, vertical: 25),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
          child: Container(
            width: double.infinity,
            height: 650,
            child: Padding(
              padding: const EdgeInsets.all(55.0),
              child: Row(
                children: [
                  myCustomForm(),
                  SizedBox(
                    width: 25.0,
                  ),
                  sideImage()
                ],
              ),
            ),
          ),
        ))));
  }

  Expanded sideImage() {
    return Expanded(
      flex: 2,
      child: Center(
          child: Material(
        borderRadius: BorderRadius.circular(17),
        child: Image.asset(
          "assets/images/girl.png",
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
      )),
    );
  }

  Expanded myCustomForm() {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Form(
            key: _formKey,
            child: Scrollbar(
              child: SingleChildScrollView(
                  padding: const EdgeInsets.only(right: 10.0),
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back)),
                          Text("Register",
                              style: TextStyle(
                                  fontSize: 40.0, fontWeight: FontWeight.bold)),
                          Container(),
                        ],
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      buildCustomTextField(
                        "Name",
                        "John Doe",
                        false,
                        nonEmptyValidator,
                        (String val) {
                          regForm.name = val;
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      buildCustomTextField("Registration Number", "190xxxxxxx",
                          false, regValidator, (String val) {
                        regForm.regNo = val;
                      }),
                      SizedBox(
                        height: 25,
                      ),
                      buildCustomTextField("Whatsapp Contact Number",
                          "1234567890", false, phoneValidator, (String val) {
                        regForm.pNo = val;
                      }),
                      SizedBox(
                        height: 25,
                      ),
                      buildCustomTextField("Email ID", "you@example.com", false,
                          (String value) {
                        if (!validator.isEmail(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      }, (String val) {
                        regForm.email = val.toLowerCase();
                      }),
                      SizedBox(
                        height: 25,
                      ),
                      StreamDropDown(dropValidator, _selectedStream, regForm),
                      SizedBox(height: 25),
                      ChkDomains(
                          domains: alldomains.domains, errMsg: chkErrMsg),
                      SizedBox(height: 30.0),
                      buildCustomTextField(
                        "Link to project(s) you have worked on",
                        "https://hello_world.com",
                        false,
                        urlValidator,
                        (String val) {
                          regForm.linkToProj = val;
                        },
                        subtitle:
                            "(Optional) For multiple projects, enter link to a document containing links to your projects.",
                      ),
                      SizedBox(height: 25),
                      InsChkBox(insData: insData),
                      SizedBox(height: 10),
                      Container(
                        //TODO is submit ame?
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                        )),
                        child: RaisedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate() &&
                                alldomains.getSelected().length != 0) {
                              // Verify that one of the two main domains have been chosen
                              if (!AllDomains.verifyDomains(
                                  alldomains.getSelected())) {
                                setState(() {
                                  chkErrMsg =
                                      'At least one of the coding or electronics domain needs to be selected.';
                                });
                                return;
                              }

                              // verify that undertaking is signed
                              if (!insData.isChecked) {
                                setState(() {
                                  insData.errMsg = "This needs to be checked";
                                });
                                return;
                              }

                              // clear error message if present
                              if (chkErrMsg.length != 0) {
                                setState(() {
                                  chkErrMsg = '';
                                });
                              }

                              // enter selected domains into the obj
                              regForm.domainIndices =
                                  alldomains.getSelectedIndices();

                              print('Form details validated. Entering in db.');
                              _formKey.currentState.save();
                              print(regForm);

                              showDialogBox(context, regForm);
                            } else if (alldomains.getSelected().length == 0) {
                              print(
                                  "Invalid form entry or entries. Not submitting.");
                              setState(() {
                                chkErrMsg = 'Domains cannot be empty';
                              });
                            } else {
                              print(
                                  "Invalid form entry or entries. Not submitting.");
                            }
                          },
                          color: Color(0xFFF3630B),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                            topLeft: Radius.circular(25),
                          )),
                          child: Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(height: 23),
                      contactInfo(context)
                    ],
                  )),
            ),
          )),
    );
  }
}
