import 'package:flutter/material.dart';

Widget signInFooter(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextButton(
        onPressed: () {
          Navigator.pushNamed(context, 'signup');
        },
        style: const ButtonStyle(),
        child: const Text(
          'Sign Up',
          textAlign: TextAlign.left,
          style: TextStyle(
              decoration: TextDecoration.underline,
              color: Color(0xff4c505b),
              fontSize: 18),
        ),
      ),
      TextButton(
          onPressed: () {},
          child: const Text(
            'Forgot Password',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Color(0xff4c505b),
              fontSize: 18,
            ),
          )),
    ],
  );
}
