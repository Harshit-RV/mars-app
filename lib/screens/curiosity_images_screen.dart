import 'package:flutter/material.dart';
import 'package:mars/components/heading_widget.dart';
import 'package:mars/constants.dart';
import 'dart:async';
import 'dart:convert';

class CuriosityImageScreen extends StatefulWidget {
  const CuriosityImageScreen({ Key? key }) : super(key: key);

  @override
  _CuriosityImageScreenState createState() => _CuriosityImageScreenState();
}

class _CuriosityImageScreenState extends State<CuriosityImageScreen> {
  
  String api(String rover) {
    String apiLink = 'https://api.nasa.gov/mars-photos/api/v1/rovers/$rover/photos?api-key=$api_key';

    return apiLink;
  }

    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Curiosity Rover'),
      ),
      body: Column(
        children: const [
          HeadingWidget(
            heading: 'Images from Curiosity',
          ),
          // ElevatedButton(onPressed: _selectedDate(context), child: Text('Date'))
        ],
      ),
      
    );
  }
}