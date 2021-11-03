import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:startup_namer/feature/dashboard/domain/entity/todo_entity.dart';
import 'package:http/http.dart' as http;

List<ToDoEntity> parseToDo(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<ToDoEntity>((json) => ToDoEntity.fromJson(json)).toList();
}

Future<List<ToDoEntity>> fetchToDos(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

  if (response.statusCode == 200) {
    return compute(parseToDo, response.body);
  } else {
    throw Exception('Failed to load ToDos');
  }
}
