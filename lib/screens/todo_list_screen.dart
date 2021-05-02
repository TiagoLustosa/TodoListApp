import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_list_app/model/todo_model.dart';
import 'package:todo_list_app/widgets/single_todo_widget.dart';
import 'package:todo_list_app/widgets/todo_modal_widget.dart';

class TodoListScreen extends StatefulWidget {
  TodoListScreen({Key key}) : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<TodoModel> todos = [];
  _addTodo(String todo, DateTime date) {
    final newTodo =
        TodoModel(id: Random().nextDouble().toString(), todo: todo, date: date);
    setState(() {
      todos.add(newTodo);
    });

    Navigator.pop(context);
  }

  _removeTodo(String id) {
    setState(() {
      todos.removeWhere((todo) => todo.id == id);
    });
  }

  _editTodo(String id) {
    setState(() {
      TodoModalWidget();
    });
  }

  @override
  Widget build(BuildContext context) {
    return todos.isEmpty
        ? Scaffold(
            appBar: AppBar(
              title: Text('Todo\'s List'),
              actions: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return TodoModalWidget(onSubmit: _addTodo);
                            });
                      },
                      child: Row(
                        children: [
                          Text(
                            'Add Todo',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'No todo\'s registered',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('Todo\'s List'),
              actions: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (_) {
                              return TodoModalWidget(
                                onSubmit: _addTodo,
                              );
                            });
                      },
                      child: Row(
                        children: [
                          Text(
                            'Add Todo',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            body: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return SingleTodoWidget(
                    todo: todo,
                    onRemove: _removeTodo,
                  );
                }),
          );
  }
}
