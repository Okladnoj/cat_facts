import 'package:flutter/material.dart';

class IconLoader extends StatelessWidget {
  final double size;

  const IconLoader({
    Key? key,
    this.size = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.all(
          Radius.circular(size),
        ),
      ),
      child: const CircularProgressIndicator(
        strokeWidth: 10,
      ),
    );
  }
}
