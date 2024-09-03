import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static String videoUrl = '6tDcZNa_Q2M';
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: videoUrl,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
      captionLanguage: 'en',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  ----------------------------------------------------------
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      //  ----------------------------------------------------------
      body: Container(
        child: YoutubePlayer(
          controller: _controller,
        ),
      ),
      //  ----------------------------------------------------------
    );
  }
}
