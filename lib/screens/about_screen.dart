import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_drawer.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('About APP'),
      ),
      body: Center(
        child: Text('Developed by Dhari'),
      ),
    );
  }
}
