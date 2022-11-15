import 'package:flutter/material.dart';
import 'package:movie_app/core/service/service_locator.dart';
import 'package:movie_app/movies/Presentation/screens/movie.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MainMoviesScreen(),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
    );
  }
}