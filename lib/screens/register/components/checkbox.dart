import 'package:flutter/material.dart';
import 'package:recruitsite/models/domain.dart';
import 'package:recruitsite/models/instruction.dart';
import 'package:recruitsite/screens/register/components/widgets.dart';

class ChkDomains extends StatefulWidget {
  List<Domain> domains;
  String errMsg;

  ChkDomains({this.domains, this.errMsg});

  @override
  _ChkDomainsState createState() => _ChkDomainsState();
}

class _ChkDomainsState extends State<ChkDomains> {
  final String subtitle =
      "Selecting one of coding or electronics domain is compulsory. Acceptance through one domain does not restrict you from working in other domains.";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      decoration: widget.errMsg.length != 0
          ? BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFe53935),
                ),
              ),
            )
          : null,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 5.0),
            alignment: Alignment.centerLeft,
            child: Text(
              "Domains",
              style: TextStyle(fontSize: 17.0, color: Colors.black),
            ),
          ),
          subtitleWidget(subtitle),
          CheckboxListTile(
            onChanged: (bool val) {
              setState(() {
                widget.domains[0].isSelected = val;
              });
            },
            value: widget.domains[0].isSelected,
            title: Text(widget.domains[0].name),
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            onChanged: (bool val) {
              setState(() {
                widget.domains[1].isSelected = val;
              });
            },
            value: widget.domains[1].isSelected,
            title: Text(widget.domains[1].name),
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            onChanged: (bool val) {
              setState(() {
                widget.domains[2].isSelected = val;
              });
            },
            value: widget.domains[2].isSelected,
            title: Text(widget.domains[2].name),
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            onChanged: (bool val) {
              setState(() {
                widget.domains[3].isSelected = val;
              });
            },
            value: widget.domains[3].isSelected,
            title: Text(widget.domains[3].name),
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            onChanged: (bool val) {
              setState(() {
                widget.domains[4].isSelected = val;
              });
            },
            value: widget.domains[4].isSelected,
            title: Text(widget.domains[4].name),
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            onChanged: (bool val) {
              setState(() {
                widget.domains[5].isSelected = val;
              });
            },
            value: widget.domains[5].isSelected,
            title: Text(widget.domains[5].name),
            controlAffinity: ListTileControlAffinity.leading,
          ),
          widget.errMsg.length == 0
              ? Container()
              : Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    widget.errMsg,
                    style: TextStyle(color: Color(0xFFe53935), fontSize: 12),
                  )),
        ],
      ),
    );
  }
}

class InsChkBox extends StatefulWidget {
  InsData insData;

  InsChkBox({this.insData});

  @override
  _InsChkBoxState createState() => _InsChkBoxState();
}

class _InsChkBoxState extends State<InsChkBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
        ),
        decoration: widget.insData.errMsg.length != 0
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFe53935),
                  ),
                ),
              )
            : null,
        child: Column(children: [
          Container(
            padding: const EdgeInsets.only(bottom: 5.0),
            alignment: Alignment.centerLeft,
            child: Text(
              widget.insData.title,
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 5.0),
            alignment: Alignment.centerLeft,
            child: Text(
              widget.insData.msg,
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          CheckboxListTile(
            onChanged: (bool val) {
              setState(() {
                widget.insData.isChecked = val;
              });
            },
            value: widget.insData.isChecked,
            title: Text('I understand'),
            controlAffinity: ListTileControlAffinity.leading,
          ),
          widget.insData.errMsg.length == 0
              ? Container()
              : Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    widget.insData.errMsg,
                    style: TextStyle(color: Color(0xFFe53935), fontSize: 12),
                  )),
        ]));
  }
}
