import 'package:flutter/material.dart';

Widget darkInputField(value, obscureText) {
  return TextField(
    style: const TextStyle(color: Colors.black),
    obscureText: obscureText,
    decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 255, 254, 254),
        filled: true,
        hintText: value,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )),
  );
}
