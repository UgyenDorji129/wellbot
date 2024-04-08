import 'package:flutter/material.dart';
import 'package:health_app/screens/healthcare/health_care.dart';
import 'package:health_app/screens/home/home.dart';
import 'package:health_app/screens/reportanalysis/report_analysis.dart';
import 'package:health_app/screens/signin/signin.dart';
import 'package:health_app/screens/signup/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignIn(),
    routes: {
      'signin': (context) => const SignIn(),
      'signup': (context) => const SignUp(),
      'home': (context) => const Home(),
      'healthcare':(context) => const AiHealthCare(),
      'report':(context) => const ReportAnalysis()
    },
    );
  }
}

class WrapperScreen extends StatelessWidget {
  const WrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignUp();
  }
}