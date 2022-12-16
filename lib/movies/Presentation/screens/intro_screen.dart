import 'package:flutter/material.dart';

import 'movie.dart';

class IntroScreen extends StatelessWidget {

  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            child: const Text('Go to Movies',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w800),),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MoviesScreen()),
              );
            }
        ),
      ),
    );
  }
}

