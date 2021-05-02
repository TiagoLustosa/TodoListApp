import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list_app/model/todo_model.dart';
import 'package:todo_list_app/widgets/select_date_time_widget.dart';

class TodoModalWidget extends StatefulWidget {
  final Function(String, DateTime) onSubmit;

  const TodoModalWidget({Key key, this.onSubmit}) : super(key: key);
  @override
  _TodoModalWidgetState createState() => _TodoModalWidgetState();
}

class _TodoModalWidgetState extends State<TodoModalWidget> {
  final _todoController = TextEditingController();
  TodoModel todoModel;
  DateTime _selectedDate;
  TimeOfDay _selectedTime;

  _submitForm() {
    final todo = _todoController.text;
    if (todo == null && _selectedDate == null && _selectedTime == null) {
      return;
    }
    widget.onSubmit(todo, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _todoController,
                keyboardType: TextInputType.multiline,
                maxLength: 137,
                maxLines: 4,
                decoration: InputDecoration(
                    hintText: 'Add your new Todo',
                    hintStyle: Theme.of(context).textTheme.bodyText1),
              ),
              SelectDateTimeWidget(
                selectedDate: _selectedDate,
                onDateChanged: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
                selectedTime: _selectedTime,
                onTimeChanged: (newTime) {
                  setState(() {
                    _selectedTime = newTime;
                    _selectedDate = DateTime(
                        _selectedDate.year,
                        _selectedDate.month,
                        _selectedDate.day,
                        newTime.hour,
                        newTime.minute);

                    print(DateFormat.yMd().add_jm().format(_selectedDate));
                  });
                },
              ),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(primary: Colors.green[900]),
                child: Text('Add'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
