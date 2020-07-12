import 'package:flutter/material.dart';
import 'package:recruitsite/models/reg.dart';
import 'package:recruitsite/models/stream.dart';

class StreamDropDown extends StatefulWidget {
  final Function validator;
  int _selectedStream;
  // List<DropdownMenuItem<int>> streamList;
  List<DropdownMenuItem<int>> streamList = [];
  final RegForm regForm;
  final AllStreams streamsData = AllStreams();

  StreamDropDown(this.validator, this._selectedStream, this.regForm);

  @override
  _StreamDropDownState createState() => _StreamDropDownState();
}

class _StreamDropDownState extends State<StreamDropDown> {
  void loadStreamList() {
    widget.streamList = [];

    for (var i = 0; i < widget.streamsData.streams.length; i++) {
      widget.streamList.add(DropdownMenuItem(
          child: Text(widget.streamsData.streams[i].name),
          value: widget.streamsData.streams[i].val));
    }
  }

  @override
  Widget build(BuildContext context) {
    loadStreamList();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            "Stream",
            style: TextStyle(fontSize: 17.0, color: Colors.black),
          ),
        ),
        DropdownButtonFormField<int>(
          validator: widget.validator,
          isExpanded: true,
          value: widget._selectedStream,
          hint: Text('Choose'),
          items: widget.streamList,
          onChanged: (value) {
            widget._selectedStream = value;
            setState(() {
              widget._selectedStream = value;
              widget.regForm.streamIndex = value;
            });
          },
        ),
      ],
    );
  }
}
