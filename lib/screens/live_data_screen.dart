import 'package:flutter/material.dart';
import 'package:mars/components/heading_widget.dart';
import 'package:mars/components/single_value_card.dart';
import 'package:mars/navigation_drawer_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List imageList = [
    // 'assets/images/mars.jpg',
    // 'assets/images/rocks.jpg',
    'assets/images/surface.jpg',
    'assets/images/surface2.jpg',
    'assets/images/perseverance_selfie.jpg',
    'assets/images/perseverance_surface.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('MARS'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top:8, left: 8, right: 8),
            child: Container(
              height:200,
              width: double.infinity,
              color: Colors.black87,
              child: CarouselSlider(
                options: CarouselOptions(
                  enableInfiniteScroll: true,
                  autoPlay: false,
                ),
                items: imageList.map((e) => ClipRRect(
                  borderRadius : BorderRadius.circular(8),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        e,
                        width: 1050,
                        height: 350,
                        fit: BoxFit.cover,
                      )
                    ]
                  )
                )).toList(),
              ),
            ),
          ),
          HeadingWidget(heading: 'Latest Data from MARS'),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: DoubleValueCard(
              topic: 'Weather (*C)',
              col1: 'high',
              data1: '-21*',
              col2: 'low',
              data2: '-72*',
            ),
          ),
          SingleValueCard(
            topic: 'Season',
            value: 'Spring',
          ),
          SingleValueCard(
            topic: 'Pressure',
            value: '827 pascals',
          ),
          SingleValueCard(
            topic: 'Atmosphere',
            value: 'Sunny',
          ),
        ],
      ),
    );
  }
}


class DoubleValueCard extends StatelessWidget {
  const DoubleValueCard({
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
              flex: 6,
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
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
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
