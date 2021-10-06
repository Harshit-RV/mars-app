import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mars/components/heading_widget.dart';

class EarthMarsScreen extends StatefulWidget {
  const EarthMarsScreen({ Key? key }) : super(key: key);

  @override
  _EarthMarsScreenState createState() => _EarthMarsScreenState();
}

class _EarthMarsScreenState extends State<EarthMarsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Earth vs Mars'),
      ),
      body: ListView(
        children: const [
          HeadingWidget(
            heading: 'Mars and Earth Comparison',
          ),
          CompareCard(
            factor: 'Length of the Day', 
            marsValue: '24:37', 
            earthValue: '23:56',
            description: 'hours:minute',
          ),
          CompareCard2(
            factor: 'Distance from Sun', 
            marsValue: '227', 
            earthValue: '149',
            description: 'millions of km',
          ),
          CompareCard2(
            factor: 'Diameter', 
            marsValue: '6790', 
            earthValue: '12750',
            description: 'kilometers',
          ),
          CompareCard(
            factor: 'Temperature', 
            marsValue: '-60*', 
            earthValue: '14*',
            description: '*C',
          ),
          CompareCard2(
            factor: 'Length of Year', 
            marsValue: '687', 
            earthValue: '365',
            description: 'Earth days',
          ),
          CompareCard(
            factor: 'Gravity', 
            marsValue: '3.721', 
            earthValue: '9.807',
            description: 'm/s\u00B2',
          ),
        ],
      ),
    );
  }
}

class CompareCard2 extends StatelessWidget {
  const CompareCard2({
    Key? key,
    required this.factor, 
    required this.marsValue, 
    required this.earthValue,
    required this.description,
  }) : super(key: key);

  final String factor;
  final String marsValue;
  final String earthValue;
  final String description;

  @override
  Widget build(BuildContext context) { 
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        height: 170,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 4,
                spreadRadius: 3,
                offset: const Offset(0, 2),
              ),
            ]),
        child: Column(
          children: [
            Expanded(
              flex: 50,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.indigo,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      factor,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    Opacity(
                      opacity: 0.53,
                      child: Text(
                        '($description)',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal:25.0),
                          child: ValueColumn(
                            planet: 'Mars',
                            value: marsValue,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal:25.0),
                          child: ValueColumn(
                            planet: 'Earth',
                            value: earthValue,
                          )
                        ),
                      ],
                    ),
                  ),
                  
                ],
              ),
            )
          ]
        )
      ),
    );
  }
}

class CompareCard extends StatelessWidget {
  const CompareCard({
    Key? key,
    required this.factor, 
    required this.marsValue, 
    required this.earthValue,
    required this.description,
  }) : super(key: key);

  final String factor;
  final String marsValue;
  final String earthValue;
  final String description;

  @override
  Widget build(BuildContext context) { 
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 4,
                spreadRadius: 3,
                offset: const Offset(0, 2),
              ),
            ]),
        child: Column(
          children: [
            Expanded(
              flex: 30,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.indigo,
                ),
                child: Center(
                  child: Text(
                    factor,
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
              flex: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal:25.0),
                          child: ValueColumn(
                            planet: 'Mars',
                            value: marsValue,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal:25.0),
                          child: ValueColumn(
                            planet: 'Earth',
                            value: earthValue,
                          )
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Opacity(
                      opacity: 0.53,
                      child: Text(
                        description,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ]
        )
      ),
    );
  }
}

class ValueColumn extends StatelessWidget {
  const ValueColumn({
    Key? key,
    required this.planet,
    required this.value,
  }) : super(key: key);

  final String planet;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          planet,
          style: TextStyle(
            fontSize: 20,
            color: Colors.indigo,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}