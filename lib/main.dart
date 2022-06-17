import 'package:catalog_app/pages/login_page.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import './utils/routes.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: ThemeData(brightness: Brightness.dark),
      routes: {
        "/" : (context) => const HomePage(),
         MyRoutes.homeRoute: (context) => const HomePage(),
         MyRoutes.loginRoute : (context) => const LoginPage()
      },
    );
  }
}
