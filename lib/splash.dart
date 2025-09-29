import 'dart:async';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late AssetsAudioPlayer _assetsAudioPlayer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // Adjust the duration as needed
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();

    // Initialize and play sound effect
    _assetsAudioPlayer = AssetsAudioPlayer();
    _playSound();

    Timer(Duration(seconds: 3), () {
      // Navigating to the main screen after 3 seconds
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
  }

  Future<void> _playSound() async {
    await _assetsAudioPlayer.open(
      Audio('assets/sounds/materialcampus.mp3'),
    );
    _assetsAudioPlayer.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), // Make it circular
              border: Border.all(
                color: Colors.white, // Add white border
                width: 5,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(300),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _assetsAudioPlayer.dispose(); // Dispose audio player instance
    super.dispose();
  }
}
