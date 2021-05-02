import 'package:flutter/material.dart';
import 'package:todo_list_app/utils/routes.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4)).then(
        (_) => Navigator.pushReplacementNamed(context, AppRoutes.AUTH_SCREEN));
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Todo List App',
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(
              height: 16,
            ),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
