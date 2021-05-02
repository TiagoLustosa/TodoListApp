import 'package:flutter/material.dart';
import 'package:todo_list_app/model/todo_model.dart';

class SingleTodoWidget extends StatefulWidget {
  final TodoModel todo;
  final void Function(String id) onRemove;
  final void Function(String id) onEdit;

  const SingleTodoWidget({Key key, this.todo, this.onRemove, this.onEdit})
      : super(key: key);

  @override
  _SingleTodoWidgetState createState() => _SingleTodoWidgetState();
}

class _SingleTodoWidgetState extends State<SingleTodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.12,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      widget.todo.todo,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        '${widget.todo.date.day}/${widget.todo.date.month}/${widget.todo.date.year}'),
                    Text(
                        '${widget.todo.date.hour}h ${widget.todo.date.minute}m'),
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.verified_sharp,
                                color: widget.todo.isCompleted
                                    ? Colors.green
                                    : Colors.white),
                            onPressed: () {
                              setState(() {
                                widget.todo.toggleCompleted();
                              });
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () => widget.onRemove(widget.todo.id)),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
