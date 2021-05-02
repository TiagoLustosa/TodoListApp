import 'package:flutter/material.dart';
import 'package:todo_list_app/screens/auth_screen.dart';
import 'package:todo_list_app/screens/splash_screen.dart';
import 'package:todo_list_app/screens/todo_list_screen.dart';
import 'package:todo_list_app/utils/routes.dart';
import 'package:todo_list_app/widgets/single_todo_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: SplashScreen(),
      routes: {
        AppRoutes.TODO_LIST_SCREEN: (ctx) => TodoListScreen(),
        AppRoutes.AUTH_SCREEN: (ctx) => AuthScreen(),
      },
    );
  }
}
