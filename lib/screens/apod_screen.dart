import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mars/components/heading_widget.dart';
import 'dart:convert';
import 'package:mars/constants.dart';

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

  bool isLoading = true;
  bool imageLoaded = false;

  final double padding = 12;

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
      isLoading = false;
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
        title: const Text('NASA APOD')
      ),
      body: Center(
        child: isLoading
          ?
          const CircularProgressIndicator()
          :
          APODview(),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  ListView APODview() {
    return ListView(
      children: [
        HeadingWidget(heading: 'Astronomical Picture of the Day'),
        Padding(
          padding: EdgeInsets.all(padding),
          child: Text(
            '  $imageTitle  ',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 24,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(padding),
          child: Container(
            child: imageUrl != null ? 
              Image.network(
                imageUrl.toString(),
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
                    child: Column(
                      children: [
                        Text(
                          'image is loading...',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: LinearProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null ?
                            loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! :
                            null,
                          ),
                        ),
                      ]
                    )
                  );
                }
              ) 
              : 
              mediaType == 'video' ? 
                const Text('Image is not available')
                : 
                const Text('Waiting for the image to load'),
            )
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: padding, horizontal: 16),
          child: Text(
            imageInfo,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }
}