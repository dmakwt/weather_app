import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/screens/weather_screen.dart';
import 'package:weather_app/widgets/custom_drawer.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();

    _textEditingController.dispose();
  }

  void showErrorDialog() {
    var alert = AlertDialog(
      title: Text('Error'),
      content: Text('Please, try again'),
      actions: [
        TextButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );

    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Weather APP'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 35,
                      right: 35,
                      top: 20,
                      bottom: 50,
                    ),
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(hintText: 'City'),
                    ),
                  ),
                  TextButton.icon(
                    label: Text(
                      'Search',
                      style: TextStyle(fontSize: 24),
                    ),
                    icon: Icon(
                      Icons.search,
                      size: 30,
                    ),
                    onPressed: () async {
                      try {
                        setState(() {
                          isLoading = true;
                        });

                        var url = Uri.parse(
                            'http://api.weatherstack.com/current?access_key=afe27c8314fee09a44128a27988797d5&query=${_textEditingController.text}');

                        var response = await http.get(url);
                        var objBody = jsonDecode(response.body);
                        var temp = objBody['current']['temperature'];

                        if (objBody['success'] == false) {
                          showErrorDialog();
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return WeatherScreen(
                                  _textEditingController.text, temp);
                            }),
                          );
                        }

                        setState(() {
                          isLoading = false;
                        });
                      } catch (error) {
                        showErrorDialog();
                      }
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
