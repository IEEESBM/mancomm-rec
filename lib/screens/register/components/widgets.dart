import 'package:flutter/material.dart';

Container subtitleWidget(String subtitle) {
  return Container(
      padding: const EdgeInsets.symmetric(vertical: 3.5),
      child: Text(
        subtitle,
        style: TextStyle(fontSize: 14, color: Colors.grey[800]),
      ));
}

Widget buildCustomTextField(String title, String hintText, bool isPassword,
    Function validation, Function onSave,
    {String subtitle}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: TextStyle(fontSize: 17, color: Colors.black)),
      subtitle == null ? Container() : subtitleWidget(subtitle),
      TextFormField(
        onSaved: onSave,
        validator: validation,
        cursorColor: Color(0xFFF3630B),
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          // prefixIcon: Icon(icon)
        ),
      ),
    ],
  );
}
