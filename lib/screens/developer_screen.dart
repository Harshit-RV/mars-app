import 'package:flutter/material.dart';

class DeveloperScreen extends StatefulWidget {
  DeveloperScreen({ Key? key }) : super(key: key);

  @override
  _DeveloperScreenState createState() => _DeveloperScreenState();
}

class _DeveloperScreenState extends State<DeveloperScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Developer',
        ),
      ),
      backgroundColor: Colors.indigo[600],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 135.0,
            backgroundImage: AssetImage('assets/images/mars.jpg'),
          ),
          const Text(
            'Harshit RV',
            style: TextStyle(
              fontSize: 40.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pacifico',
            ),
          ),
          Text(
            'FLUTTER DEVELOPER',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.teal[100],
              // fontFamily: 'SourceSansPro',
              letterSpacing: 2.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 50.0,
            width: 150.0,
            child: Divider(
              color: Colors.teal.shade100,
            ),
          ),
          const Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            child: ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.teal,
              ),
              title: Text(
                '+91 7683089932',
              ),
            ),
          ),
          const Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            child: ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.teal,
              ),
              title: Text(
                'harshit.rai.verma@gmail.com',
              ),
            ),
          ),
          Container(
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'v1.0.0',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  ),
                ),
            )
          ),
        ],
      ),
    );
  }
}

