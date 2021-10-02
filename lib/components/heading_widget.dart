import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({
    Key? key,
    required this.heading,
  }) : super(key: key);

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17.0),
      child: Container(
        color: Colors.black87,
        height: 80,
        width: double.infinity,
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              heading,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}