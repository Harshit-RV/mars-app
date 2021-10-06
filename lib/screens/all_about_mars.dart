import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AllAboutMars extends StatelessWidget {
  AllAboutMars({ Key? key }) : super(key: key);
  
  final List imageList = [
    'assets/images/mars.jpg',
    'assets/images/rocks.jpg',
    'assets/images/surface.jpg',
    'assets/images/surface2.jpg',
    'assets/images/perseverance_selfie.jpg',
    'assets/images/perseverance_surface.jpg',
    'assets/images/helicopter.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ALL ABOUT MARS'),
      ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            // enableInfiniteScroll: true,
            autoPlay: false,
          ),
          items: imageList.map((e) => ClipRRect(
            borderRadius : BorderRadius.circular(8),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  e,
                  width: 500,
                  height: 1500,
                  fit: BoxFit.cover,
                )
              ]
            )
          )).toList(),
        ),
      ),
    );
  }
}