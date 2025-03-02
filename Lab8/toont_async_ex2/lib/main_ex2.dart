import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercise2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = "Loading...";
  String company = "";

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        name = data['name'];
        company = data['company']['name'];
      });
    } else {
      setState(() {
        name = "Error";
        company = "Failed to load";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Exercise2 by Toont 8054')),
      ),
      body: Center(
        child: Align(
          alignment: Alignment.center,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(fontSize: 30),
              children: [
                TextSpan(text: name, style: TextStyle(color: const Color.fromARGB(255, 243, 33, 33), fontWeight: FontWeight.bold)),
                TextSpan(text: " works at ", style: TextStyle(color: Colors.black)),
                TextSpan(text: company, style: TextStyle(color: const Color.fromARGB(255, 76, 78, 175), fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}