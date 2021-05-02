import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectDateTimeWidget extends StatelessWidget {
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final Function(DateTime) onDateChanged;
  final Function(TimeOfDay) onTimeChanged;

  const SelectDateTimeWidget(
      {Key key,
      this.selectedDate,
      this.onDateChanged,
      this.selectedTime,
      this.onTimeChanged})
      : super(key: key);
  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2021, 12, 31),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      onDateChanged(pickedDate);
    });
  }

  _showTimePicker(BuildContext context) {
    showTimePicker(
            context: context, initialTime: TimeOfDay(hour: 00, minute: 00))
        .then((pickedTime) {
      if (pickedTime == null) {
        return;
      }
      onTimeChanged(pickedTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(selectedDate == null
                ? 'No Date Selected'
                : 'Selected date ${DateFormat('dd/MM/y').format(selectedDate)}'),
            TextButton(
                onPressed: () => _showDatePicker(context),
                child: Text(
                  'Select Date',
                  style: Theme.of(context).textTheme.bodyText1,
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(selectedTime == null
                ? 'No Time Selected'
                : 'Selected Time ${selectedTime.hour}h ${selectedTime.minute}m'),
            TextButton(
                onPressed: () => _showTimePicker(context),
                child: Text('Select Time',
                    style: Theme.of(context).textTheme.bodyText1))
          ],
        ),
      ],
    );
  }
}
