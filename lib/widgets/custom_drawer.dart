import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              leading: Icon(
                Icons.home,
                size: 40,
                color: Colors.blue,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/about');
              },
              leading: Icon(
                Icons.info,
                size: 40,
                color: Colors.blue,
              ),
              title: Text(
                'About App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
