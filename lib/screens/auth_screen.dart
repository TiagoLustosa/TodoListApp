import 'package:flutter/material.dart';
import 'package:todo_list_app/model/auth_data_model.dart';
import 'package:todo_list_app/widgets/auth_form_widget.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Authentication')),
        ),
        body: AuthFormWidget());
  }
}
