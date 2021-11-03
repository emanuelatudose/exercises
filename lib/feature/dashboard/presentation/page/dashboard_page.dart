import 'package:flutter/material.dart';
import 'package:startup_namer/core/network/http_client.dart';
import 'package:startup_namer/core/widget/listview_widget.dart';
import 'package:startup_namer/feature/dashboard/domain/entity/todo_entity.dart';
import 'package:startup_namer/feature/random_words/presentation/page/random_words_page.dart';
import 'package:http/http.dart' as http;

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
          Expanded(
            child: FutureBuilder<List<ToDoEntity>>(
              future: fetchToDos(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('An error has occurred!'),
                  );
                } else if (snapshot.hasData) {
                  return ListViewWidget(todos: snapshot.data!);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          const Divider(
            height: 0,
          ),
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
          ),
        ],
      ),
    );
  }
}
