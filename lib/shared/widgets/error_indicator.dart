import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator([this.message = 'SomeThing went wrong!']);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message, style: TextStyle(color: Colors.red)));
  }
}
