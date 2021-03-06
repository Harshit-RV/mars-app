import 'package:flutter/material.dart';
import 'package:mars/screens/all_about_mars.dart';
import 'package:mars/screens/apod_screen.dart';
import 'package:mars/screens/astronaut_guide.dart';
import 'package:mars/screens/developer_screen.dart';
import 'package:mars/screens/earth_mars_screen.dart';
import 'package:mars/screens/live_data_screen.dart';
import 'package:mars/screens/mars_audio.dart';
import 'package:mars/screens/mars_surface_images.dart';

class NavigationDrawerWidget extends StatelessWidget {
  NavigationDrawerWidget({ Key? key }) : super(key: key);

  // final String assetName =  ''
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.indigo,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            SizedBox(height: 70.0,),
            Divider(color: Colors.white,),
            DrawerCard(
              text: 'Home',
              icon: Icons.home,
              onClicked: () => selectedItem(context, 0),
            ),
            Divider(color: Colors.white,),
            DrawerCard(
              text: 'ALL ABOUT MARS',
              icon: Icons.library_books,
              onClicked: () => selectedItem(context, 7),
            ),
            Divider(color: Colors.white,),
            DrawerCard(
              text: 'NASA APOD',
              icon: Icons.image,
              onClicked: () => selectedItem(context, 1),
            ),
            Divider(color: Colors.white,),
            DrawerCard(
              text: 'Mars\' Surface Images',
              icon: Icons.public,
              onClicked: () => selectedItem(context, 2),
            ),
            Divider(color: Colors.white,),
            DrawerCard(
              text: 'Audios from Mars',
              icon: Icons.graphic_eq,
              onClicked: () => selectedItem(context, 3),
            ),
            Divider(color: Colors.white,),
            DrawerCard(
              text: 'Earth vs Mars',
              icon: Icons.sports_kabaddi_outlined,
              onClicked: () => selectedItem(context, 4),
            ),
            Divider(color: Colors.white,),
            DrawerCard(
              text: 'An Astronaut\'s Guide to Living on Mars',
              icon: Icons.book,
              onClicked: () => selectedItem(context, 5),
            ),
            Divider(color: Colors.white,),
            DrawerCard(
              text: 'Developer Notes',
              icon: Icons.developer_mode,
              onClicked: () => selectedItem(context, 6),
            ),
            Divider(color: Colors.white,),
          ],
        ),
      ),
    );
  }
}

selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
    break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => APODscreen(),
      ));
    break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MarsSurfaceImages(),
      ));
    break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MarsAudioScreen(),
      ));
    break;
    case 4:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => EarthMarsScreen(),
      ));
    break;
    case 5:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AstronautsGuide(),
      ));
    break;
    case 6:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DeveloperScreen(),
      ));
    break;
    case 7:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AllAboutMars(),
      ));
    break;
  }
}

class DrawerCard extends StatelessWidget {
  const DrawerCard({
    Key? key,
    required this.text,
    required this.icon,
    required this.onClicked,
  }) : super(key: key);

  final color = Colors.white;
  final String text;
  final VoidCallback onClicked;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return NewDrawerCard();    
  }

  Material NewDrawerCard() {
    return Material(
    color: Colors.indigo,
    child: ListTile(
      // selectedTileColor: Colors.indigo,
      leading: Icon(
        icon, 
        color: Colors.white,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 14,
        ),
      ),
      onTap: onClicked,
    ),
  );
  }  
}