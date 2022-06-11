import 'package:catalog_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import './utils/routes.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.lato().fontFamily
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      routes: {
        "/" : (context) => LoginPage(),
         MyRoutes.homeRoute: (context) => HomePage(),
         MyRoutes.loginRoute : (context) => LoginPage()
      },
    );
  }
}
