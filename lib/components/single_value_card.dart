import 'package:flutter/material.dart';

class SingleValueCard extends StatelessWidget {
  const SingleValueCard({
    Key? key, required this.topic, required this.value,
  }) : super(key: key);

  final String topic;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 4,
              spreadRadius: 3,
              offset: const Offset(0, 2),
            ),
          ]
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0), topLeft: Radius.circular(8.0)),
                  color: Colors.indigo,
                ),
                height: 60,
                child: FittedBox(
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(
                      topic,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                  color: Colors.white,
                ),
                height: 60,
                child: FittedBox(
                  child: Padding(
                    padding: EdgeInsets.all(9),
                    child: Text(
                      value,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}