import 'package:flutter/material.dart';

Widget homeAppBar(context){
  return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Hi, Mehul"),
            Text(
              "How are you feeling today?",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        );
}