import 'package:flutter/material.dart';
import 'package:startup_namer/feature/random_words/presentation/page/random_words_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        children: <Widget>[
          TextButton(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                  'Click here for Exercise 1 - Startup Name Generator'),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const RandomWordsPage();
                }),
              );
            },
          )
        ],
      ),
    );
  }
}
