import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'JokesDto.dart';
import 'data_source.dart';

class JokeScreen extends StatefulWidget {
  const JokeScreen({super.key});

  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  JokeDto? joke;

  @override
  void initState() {
    super.initState();
    _loadJoke();
  }

  _loadJoke() async {
    setState(() {
      joke = null;
    });

    final newJoke = await context.read<DataSource>().getJoke();
    setState(() {
      joke = newJoke;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Joke"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            if (joke == null) const CircularProgressIndicator(),
            if (joke?.type == "single")
              Container(
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  joke!.joke!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ),
            if (joke?.type == "twopart")
              Column(
                children: [
                  Container(
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      joke!.setup!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(bottom: 10)),
                  Container(
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      joke!.delivery!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  )
                ],
              ),
            Padding(padding: const EdgeInsets.only(bottom: 10)),
            TextButton(
              onPressed: _loadJoke,
              child: const Text("Show another"),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.blueAccent,
                onSurface: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
