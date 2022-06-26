import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/pages/cart_page.dart';
import 'package:catalog_app/pages/login_page.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'pages/home_page.dart';
import './utils/routes.dart';

void main(){
  runApp(VxState(store: MyStore(),
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      routes: {
        "/" : (context) => const HomePage(),
         MyRoutes.homeRoute: (context) => const HomePage(),
         MyRoutes.loginRoute : (context) => const LoginPage(),
         MyRoutes.cartRoute : (context) => const CartPage()
      },
    );
  }
}
