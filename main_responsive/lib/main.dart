import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isLandscape ? _buildLandscapeLayout() : _buildPortraitLayout(),
        ),
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Where is this picture?",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Image.asset(
          'images/kku_image.jpg',
          width: 300,
        ),
        SizedBox(height: 20),
        Column(
          children: [
            _buildAnswerButton("Chiang Mai University", Colors.purple),
            _buildAnswerButton("Khon Kaen University", Colors.orange),
            _buildAnswerButton("Chulalongkorn University", Colors.green),
            _buildAnswerButton("Mahidol University", Colors.blue),
          ],
        ),
      ],
    );
  }

  Widget _buildLandscapeLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Where is this picture?",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Image.asset(
          'images/kku_image.jpg',
          width: 300,
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                _buildAnswerButton("Chiang Mai University", Colors.purple),
                _buildAnswerButton("Chulalongkorn University", Colors.green),
              ],
            ),
            SizedBox(width: 10),
            Column(
              children: [
                _buildAnswerButton("Khon Kaen University", Colors.orange),
                _buildAnswerButton("Mahidol University", Colors.blue),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAnswerButton(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color, minimumSize: Size(180, 50)),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
