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

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String correctAnswer = "Khon Kaen University";
  String? selectedAnswer;

  void checkAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
    });

    bool isCorrect = answer == correctAnswer;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isCorrect ? "Score: 1" : "Score: 0"),
        duration: Duration(seconds: 1),
      ),
    );
  }

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
      children: [
        _buildQuestionSection(),
        Column(
          children: _buildAnswerButtons(),
        ),
      ],
    );
  }

  Widget _buildLandscapeLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildQuestionSection(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                _buildAnswerButton("Chiang Mai University"),
                _buildAnswerButton("Chulalongkorn University"),
              ],
            ),
            SizedBox(width: 10),
            Column(
              children: [
                _buildAnswerButton("Khon Kaen University"),
                _buildAnswerButton("Mahidol University"),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuestionSection() {
    return Column(
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
      ],
    );
  }

  List<Widget> _buildAnswerButtons() {
    List<String> answers = [
      "Chiang Mai University",
      "Khon Kaen University",
      "Chulalongkorn University",
      "Mahidol University"
    ];
    return answers.map((answer) => _buildAnswerButton(answer)).toList();
  }

  Widget _buildAnswerButton(String answer) {
    Color buttonColor;
    
    if (selectedAnswer == null) {
      switch (answer) {
        case "Chiang Mai University":
          buttonColor = Colors.blue.shade200;
          break;
        case "Khon Kaen University":
          buttonColor = Colors.green.shade200;
          break;
        case "Chulalongkorn University":
          buttonColor = Colors.orange.shade200;
          break;
        case "Mahidol University":
          buttonColor = Colors.purple.shade200;
          break;
        default:
          buttonColor = Colors.grey.shade300;
      }
    } else if (selectedAnswer == answer) {
      buttonColor = (answer == correctAnswer) ? Colors.green : Colors.red;
    } else {
      switch (answer) {
        case "Chiang Mai University":
          buttonColor = Colors.blue.shade200;
          break;
        case "Khon Kaen University":
          buttonColor = Colors.green.shade200;
          break;
        case "Chulalongkorn University":
          buttonColor = Colors.orange.shade200;
          break;
        case "Mahidol University":
          buttonColor = Colors.purple.shade200;
          break;
        default:
          buttonColor = Colors.grey.shade300;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          minimumSize: Size(180, 50),
        ),
        onPressed: () => checkAnswer(answer),
        child: Text(
          answer,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}  