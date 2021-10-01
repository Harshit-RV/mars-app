import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MarsSurfaceImages extends StatefulWidget {
  const MarsSurfaceImages({ Key? key }) : super(key: key);

  @override
  _MarsSurfaceImagesState createState() => _MarsSurfaceImagesState();
}

class _MarsSurfaceImagesState extends State<MarsSurfaceImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mars\' Surface Images'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CompareCard(
          topic: 'Weather (*C)',
          col1: 'high',
          data1: '-21*',
          col2: 'low',
          data2: '-72*',
        ),
      ),
    );
  }
}

class CompareCard extends StatelessWidget {
  const CompareCard({
    Key? key,
    required this.topic,
    required this.col1,
    required this.col2,
    required this.data1,
    required this.data2,
  }) : super(key: key);

  final String topic;
  final String col1;
  final String col2;
  final String data1;
  final String data2;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 4,
              spreadRadius: 3,
              offset: const Offset(0, 2),
            ),
          ]),
        // width: 300,
        // color: Colors.green,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0) ),
                  color: Colors.indigo,
                ),
                child: Center(
                  child: Text(
                    topic,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data1,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 23,
                          // fontFamily: 
                        ),
                      ),
                      Text(col1),
                    ]
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data2),
                      Text(col2),
                    ]
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}

class AttendanceCard extends StatelessWidget {
  const AttendanceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.blue,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 4,
                spreadRadius: 3,
                offset: Offset(0, 2),
              ),
            ]),
        height: 110,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox()
              ),
              Expanded(
                flex: 35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Material(
                        elevation: 20,
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.red,
                          ),
                          width: double.maxFinite,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            child: Text(
                              'subject',
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: double.maxFinite,
                        // color: kTertiaryColor,
                        child: Text(
                          '   Attended ',
                          style: TextStyle(
                            color: Colors.red,
                            shadows: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                blurRadius: 4,
                                spreadRadius: 3,
                                offset: Offset(0, 2),
                              ),
                            ]
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 35,
                child: Row(
                  children: [
                    Expanded(child: SizedBox()),
                    Container(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}