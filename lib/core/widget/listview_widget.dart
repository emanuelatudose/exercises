import 'package:flutter/material.dart';
import 'package:startup_namer/feature/dashboard/domain/entity/todo_entity.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key, required this.todos}) : super(key: key);

  final List<ToDoEntity> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      itemCount: todos.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Row(
            children: [
              Column(
                children: [
                  Icon(todos[index].completed
                      ? Icons.check_box_rounded
                      : Icons.check_box_outline_blank),
                ],
              ),
              const SizedBox(width: 24.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Id: ${todos[index].id}'),
                    Text('Title: ${todos[index].title}'),
                    Text('Completed: ${todos[index].completed}'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
