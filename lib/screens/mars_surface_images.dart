import 'package:flutter/material.dart';
import 'package:mars/components/heading_widget.dart';
import 'package:mars/components/select_rover_card.dart';
import 'package:mars/datepicker.dart';
import 'package:mars/screens/curiosity_images_screen.dart';
import 'package:mars/screens/opportunity_images_screen.dart';
import 'package:mars/screens/perseverance_images_screen.dart';
import 'package:mars/screens/spirit_images_screen.dart';

class MarsSurfaceImages extends StatefulWidget {
  const MarsSurfaceImages({Key? key}) : super(key: key);

  @override
  _MarsSurfaceImagesState createState() => _MarsSurfaceImagesState();
}

class _MarsSurfaceImagesState extends State<MarsSurfaceImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mars\' Surface Images'),
        ),
        body: ListView(
          children: const [
            HeadingWidget(heading: 'Images Taken By Rovers'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Text(
                'Select a rover',
                // textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: SelectRoverCard(
                rover: 'Perseverance',
                landingDate: '18 February 2021',
                nextScreen: PerseveranceImageScreen(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: SelectRoverCard(
                rover: 'Curiosity',
                landingDate: '6 August 2012',
                nextScreen: CuriosityImageScreen(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: SelectRoverCard(
                rover: 'Opportunity',
                landingDate: '25 January 2004',
                nextScreen: OpportunityImageScreen(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: SelectRoverCard(
                rover: 'Spirit',
                landingDate: '4 January 2004',
                nextScreen: SpiritImageScreen(),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        )
      );
  }
}


