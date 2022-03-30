import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  final double size;

  const AppLoader({
    Key? key,
    this.size = 56,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(size * 0.5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator(
          strokeWidth: size * 0.1,
        ),
      ),
    );
  }
}
