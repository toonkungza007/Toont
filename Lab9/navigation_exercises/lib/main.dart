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
  int currentQuestionIndex = 0;

  final List<Question> questions = [
    Question(
      text: "Where is this place?",
      image: "images/kku_image.jpg",
      options: {
        "Chiang Mai University": false,
        "Khon Kaen University": true,
        "Chulalongkorn University": false,
        "Mahidol University": false,
      },
    ),
    Question(
      text: "What is this University?",
      image: "images/kku_image.jpg",
      options: {
        "KKU": true,
        "BU": false,
        "CU": false,
        "MU": false,
      },
    ),
    Question(
      text: "Where is this?",
      image: "images/kku_image.jpg",
      options: {
        "CMU": false,
        "KKU": true,
        "MU": false,
        "BU": false,
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: QuestionWidget(
            question: questions[currentQuestionIndex],
            onNext: () {
              if (currentQuestionIndex < questions.length - 1) {
                setState(() {
                  currentQuestionIndex++;
                });
              }
            },
            onPrevious: () {
              if (currentQuestionIndex > 0) {
                setState(() {
                  currentQuestionIndex--;
                });
              }
            },
          ),
        ),
      ),
    );
  }
}

class QuestionWidget extends StatefulWidget {
  final Question question;
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;

  QuestionWidget({
    required this.question,
    this.onNext,
    this.onPrevious,
  });

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  String? selectedAnswer;

  void checkAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
    });

    bool isCorrect = widget.question.options[answer] ?? false;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isCorrect ? "Score: 1" : "Score: 0"),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.question.text,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Image.asset(
          widget.question.image,
          width: 300,
        ),
        SizedBox(height: 20),
        Column(
          children: widget.question.options.keys.map((answer) => _buildAnswerButton(answer)).toList(),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.onPrevious != null)
              ElevatedButton(
                onPressed: widget.onPrevious,
                child: Text("Previous"),
              ),
            if (widget.onNext != null)
              ElevatedButton(
                onPressed: widget.onNext,
                child: Text("Next"),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildAnswerButton(String answer) {
    Color buttonColor = selectedAnswer == null
        ? Colors.blue.shade200
        : (selectedAnswer == answer
            ? (widget.question.options[answer]! ? Colors.green : Colors.red)
            : Colors.blue.shade200);

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

class Question {
  final String text;
  final String image;
  final Map<String, bool> options;

  Question({required this.text, required this.image, required this.options});
}
