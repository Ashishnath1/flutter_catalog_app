import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const url = "https://media.allure.com/photos/6204067e11279f1317ce0cd1/2:1/w_4087,h_2043,c_limit/Robert%20Pattinson%20at%20the%2011th%20Annual%20Governors%20Awards.jpg";
    return Drawer(
        child: Container(
          color: Colors.deepPurple,
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
                DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  accountEmail: Text("ashishnath6900125278@gmail.com"),
                  accountName: Text("Ashish Nath"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(url),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.home, color: Colors.white,),
                title: Text("Home", style: TextStyle(color: Colors.white), textScaleFactor: 1.2),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.profile_circled, color: Colors.white,),
                title: Text("Profile", style: TextStyle(color: Colors.white),textScaleFactor: 1.2),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.mail, color: Colors.white,),
                title: Text("Contact us", style: TextStyle(color: Colors.white),textScaleFactor: 1.2),
              ),
            ],
          ),
        ),
    );
  }
}
