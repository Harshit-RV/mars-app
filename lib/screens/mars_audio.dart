import 'package:flutter/material.dart';
import 'package:mars/components/heading_widget.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';

class MarsAudioScreen extends StatefulWidget {
  const MarsAudioScreen({ Key? key }) : super(key: key);

  @override
  _MarsAudioScreenState createState() => _MarsAudioScreenState();
}

class _MarsAudioScreenState extends State<MarsAudioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audios from Mars'),
      ),
      body: ListView(
        children: const [
          HeadingWidget(
            heading: 'Audios Recorded by Rovers',
          ),
          SelectRoverCard2(
            title: 'Helicopter Flying on Mars',
            rover: 'Perseverance',
            path: 'assets/audio/Sounds-of-Mars_Helicopter-Flying.mp3'
          ),
        ],
      ),
      
    );
  }
}

class SelectRoverCard2 extends StatelessWidget {
  const SelectRoverCard2({
    Key? key, 
    required this.title, 
    required this.rover,
    required this.path,
  }) : super(key: key);

  final String title;
  final String rover;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 160,
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
          ]
        ),
        child: Column(
          children: [
            Container(
              height: 30,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                color: Colors.indigo,
                ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:25.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              title,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 30,
                                height: 0.9,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          SizedBox(height: 9,),
                          Text(
                            '${rover.toUpperCase()} ROVER',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 60,
                      child: RawMaterialButton(
                        fillColor: Colors.indigo,
                        onPressed: () {
                          // AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
                          // assetsAudioPlayer.open(
                          //   Audio(path),
                          // );
                        }, 
                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 40,
                        ),
                        shape: const CircleBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}