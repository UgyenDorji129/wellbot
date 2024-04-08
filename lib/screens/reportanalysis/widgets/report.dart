import 'package:flutter/material.dart';

Widget reportCard(content, context) {
  return Container(
    margin: const EdgeInsets.all(10.0),
    padding: const EdgeInsets.all(3.0),
    height: MediaQuery.of(context).size.height * 0.65,
    decoration: BoxDecoration(
      // adding borders around the widget
      border: Border.all(
        color: const Color.fromARGB(255, 243, 243, 245),
        width: 2.0,
      ),
    ),
    child: Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Text(
          content,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
            letterSpacing: 1,
            wordSpacing: 1,
          ),
        ),
      ),
    ),
  );
}
