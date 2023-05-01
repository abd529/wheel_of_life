import 'package:flutter/material.dart';
import 'package:wheel_of_life/Quiz%20Functionality/quiz_screen.dart';
import '../Utilities/youtube_widget.dart';

class VideoScreen extends StatelessWidget {
  static const routeName = "video-screen";

  VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          YoutubeVideo("https://www.youtube.com/watch?v=eeLskX8LDxw"),
          const SizedBox(height: 16.0),
          const Text(
            'Welcome to True North! We are excited to help you determine what is essential for you and those areas that require you to concentrate on to get the most out of your life. So let\'s start the journey.',
            softWrap: true,
            style: TextStyle(fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
            Navigator.of(context).pushNamed(logQuiz.routeName);
            },
            child: const Text('Move To Questions'),
          ),
        ],
      ),
    );
  }
}
