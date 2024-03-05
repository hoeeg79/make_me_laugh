import 'package:flutter/material.dart';
import 'package:make_me_laugh/joke_screen.dart';
import 'package:provider/provider.dart';

import 'data_source.dart';

void main() {
  runApp(
    Provider(
      create: (context) => DataSource(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joke Machinomatic 3000',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple, brightness: Brightness.dark),
    ),
      home: JokeScreen(),
    );
  }
}
