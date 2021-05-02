import 'package:flutter/material.dart';
import 'package:todo_list_app/model/auth_data_model.dart';
import 'package:todo_list_app/utils/routes.dart';

class AuthFormWidget extends StatefulWidget {
  @override
  _AuthFormWidgetState createState() => _AuthFormWidgetState();
}

class _AuthFormWidgetState extends State<AuthFormWidget> {
  final AuthDataModel _authDataModel = AuthDataModel();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_authDataModel.isSignUp)
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
              ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'E-mail',
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                Future.delayed(Duration(seconds: 1)).then((_) =>
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.TODO_LIST_SCREEN));
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.grey, minimumSize: Size(double.infinity, 48)),
              child: Text(
                _authDataModel.isLogin ? 'Login' : 'Sign-Up',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _authDataModel.toggleMode();
                });
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.grey, minimumSize: Size(double.infinity, 48)),
              child: Text(
                _authDataModel.isLogin
                    ? 'Create New Account'
                    : 'Login With Account',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
