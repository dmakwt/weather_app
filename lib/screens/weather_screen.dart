import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  final String city;
  final int temp;

  WeatherScreen(this.city, this.temp);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.city),
      ),
      body: Center(
        child: Stack(
          children: [
            Text(
              '${widget.temp}',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 120,
              ),
            ),
            Positioned(
              right: 1,
              child: Text(
                '°',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
