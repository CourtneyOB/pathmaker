import 'package:flutter/material.dart';
import 'package:pathmaker/main.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 80.0,
            child: DrawerHeader(
              child: Text('KikiRPG\nPathfinder 2e Character Builder'),
            ),
          ),
          ListTile(
            leading: RotatedBox(
              quarterTurns: 1,
              child: Icon(Icons.splitscreen),
            ),
            title: Text('Side-by-side'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.web_asset),
            title: Text('Character Sheet only'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/charactersheet');
            },
          ),
        ],
      ),
    );
  }
}
