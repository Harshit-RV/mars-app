import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
import 'dart:convert';
import 'package:mars/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class APODscreen extends StatefulWidget {
  const APODscreen({ Key? key }) : super(key: key);

  @override
  _APODscreenState createState() => _APODscreenState();
}

class _APODscreenState extends State<APODscreen> {

  late String? imageUrl; //nullable
  String imageInfo = 'Image Information';
  String imageTitle = 'Image Title';
  String mediaType = 'mediaType';
  late String year;
  late String month;
  late String day;

  Future<http.Response> getApodResponse() {
    // {String year, String month, String day}
    // String date = '$year-$month-$day';

    Future<http.Response> response = http.get(Uri.parse(apod));

    return response;
  }
  
  displayApod(http.Response response) {
    Map<String, dynamic> apodDetails = json.decode(response.body);

    setState(() {
      imageInfo = apodDetails['explanation'] ?? 'data is not available';
      imageTitle = apodDetails['title'] ?? 'data is not available';
    });

    mediaType = apodDetails['media_type'];
    imageUrl = (mediaType == 'image') ? apodDetails['hdurl'] : imageUrl = null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApodResponse().then((response) => displayApod(response)).catchError((error) => print(error));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NASA APOD')
      ),
      // body: Container(
      //   child: imageTitle != 'data is not available' ? 
      //   APODview()
      //   :
      //   Center(child: Text('Something went wrong. Make sure you are connected to the internet.'),),
      // )
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.indigo,
          size: 100.0,

        )
      ),
    );
  }

  Container APODview() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              imageTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              child: imageUrl != null ? Image.network(imageUrl.toString()) : mediaType == 'video' ? Text('Image is not available'): Text('Waiting for the image to load'),
            ),
            Text(
              imageInfo,
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
      ),
    );
  }
}