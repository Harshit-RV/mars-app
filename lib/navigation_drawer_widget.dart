import 'package:flutter/material.dart';
import 'package:mars/screens/apod_screen.dart';
import 'package:mars/screens/mars_surface_images.dart';

class NavigationDrawerWidget extends StatelessWidget {
  NavigationDrawerWidget({ Key? key }) : super(key: key);
  
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
              text: 'Mars Surface Images',
              icon: Icons.ballot,
              onClicked: () => selectedItem(context, 0),
            ),
            Divider(color: Colors.white,),
            DrawerCard(
              text: 'NASA APOD',
              icon: Icons.article,
              onClicked: () => selectedItem(context, 1),
            ),
            Divider(color: Colors.white,),
            DrawerCard(
              text: 'Developer Notes',
              icon: Icons.developer_mode,
              onClicked: () => selectedItem(context, 2),
            ),
            Divider(color: Colors.white,),
            DrawerCard(
              text: 'Account',
              icon: Icons.person,
              onClicked: () => selectedItem(context, 3),
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
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MarsSurfaceImages(),
      ));
    break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => APODscreen(),
      ));
    break;
    case 2:
      // Navigator.of(context).push(MaterialPageRoute(
      //   builder: (context) => DeveloperScreen(),
      // ));
    break;
    case 3:
      // Navigator.of(context).push(MaterialPageRoute(
      //   builder: (context) => AccountScreen(),
      // ));
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