import 'package:appinion_hrm/screen/Home/HomeScreen.dart';
import 'package:appinion_hrm/theme/Colors.dart';
import 'package:appinion_hrm/theme/ImageAssets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppbarDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(personIcon),
            ),
            accountName: Text(
              'MD.Masum Talukder',
              style: TextStyle(fontSize: 24.0),
            ),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      purple,
                      lightBlue,
                    ])),
            accountEmail: null,
          ),
          SizedBox(
            height: 32,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(homeIcon),
            ),
            title: Text('Home',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),

          ),
          SizedBox(
            height: 24,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(calenderIcon),
            ),
            title: Text('Leave',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
          ),
          SizedBox(
            height: 24,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(phoneBookIcon),
            ),
            title: Text('Phonebook',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
          ),
          SizedBox(
            height: 24,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: CircleAvatar(
                backgroundImage: AssetImage(adminSettings),
              ),
            ),
            title: Text('Settings',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),

          ),
          SizedBox(
            height: 24,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(logoutIcon),
            ),
            title: Text('Logout',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),

          ),
        ],
      ),
    );
  }
}

itemSelected() {
}
