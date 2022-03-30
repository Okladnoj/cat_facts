import 'package:flutter/material.dart';

class ErrorMassage extends StatelessWidget {
  final String massage;

  const ErrorMassage({
    Key? key,
    required this.massage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 100,
        width: double.maxFinite,
        child: Center(
          child: Text(
            massage,
            style: TextStyle(color: Colors.red[800]),
          ),
        ),
      ),
    );
  }
}
