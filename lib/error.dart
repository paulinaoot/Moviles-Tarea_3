// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Error extends StatefulWidget {
  const Error({Key? key}) : super(key: key);

  @override
  State<Error> createState() => _ErrorState();
}

class _ErrorState extends State<Error> {
  @override
  Widget build(BuildContext context) {
    return(
      Scaffold(
        body: Center(
          child: Text("Error"),
        ),
      )
    );
  }
}