import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

// import 'package:venue/main.dart';
import 'homescreen.dart';
import 'login.dart';
import 'registration.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 5),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ,
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * pi,
                  child: child,
                );
              },
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/venue.jpg"),
                radius: 100,
              ),
            ),
            // child: Image.asset('assets/tour.png'),
          ),
        ],
      ),
    );
  }
}
