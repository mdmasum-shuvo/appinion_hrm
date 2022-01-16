import 'package:appinion_hrm/theme/Colors.dart';
import 'package:appinion_hrm/theme/ImageAssets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppbarDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:Colors.transparent,
      child: ListView(
        children: const [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(person),
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
                    ])
            ),
            accountEmail: null,
          ),
        ],
      ),
    );
  }
}
