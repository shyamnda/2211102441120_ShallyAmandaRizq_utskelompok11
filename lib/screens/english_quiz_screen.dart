import 'package:flutter/material.dart';
import '../widgets/score_widget.dart'; // Import ScoreWidget
//import 'activity_screen.dart'; // Import halaman pilihan aktivitas

class EnglishQuizScreen extends StatefulWidget {
  @override
  _EnglishQuizScreenState createState() => _EnglishQuizScreenState();
}

class _EnglishQuizScreenState extends State<EnglishQuizScreen> {
  int _englishScore = 0;
  int _currentQuestionIndex = 0;

  // List of questions and their respective correct answers
  final List<Map<String, dynamic>> _questions = [
      {
        'question': 'What is the capital of France?',
        'options': ['London', 'Paris', 'Rome', 'Berlin'],
        'correctAnswer': 'Paris',
      },
      {
        'question': 'Which planet is known as the Red Planet?',
        'options': ['Mars', 'Jupiter', 'Saturn', 'Earth'],
        'correctAnswer': 'Mars',
      },
      {
        'question': 'Who wrote "Romeo and Juliet"?',
        'options': ['Jane Austen', 'William Shakespeare', 'Charles Dickens', 'Mark Twain'],
        'correctAnswer': 'William Shakespeare',
      },
      {
        'question': 'What is the currency of Japan?',
        'options': ['Yuan', 'Yen', 'Dollar', 'Euro'],
        'correctAnswer': 'Yen',
      },
      {
        'question': 'Which country is known as the Land of the Rising Sun?',
        'options': ['China', 'Japan', 'India', 'Australia'],
        'correctAnswer': 'Japan',
      },
      {
        'question': 'Who painted the Mona Lisa?',
        'options': ['Vincent van Gogh', 'Leonardo da Vinci', 'Pablo Picasso', 'Michelangelo'],
        'correctAnswer': 'Leonardo da Vinci',
      },
      {
        'question': 'What is the largest mammal?',
        'options': ['Elephant', 'Blue Whale', 'Giraffe', 'Lion'],
        'correctAnswer': 'Blue Whale',
      },
      {
        'question': 'Who invented the telephone?',
        'options': ['Thomas Edison', 'Alexander Graham Bell', 'Nikola Tesla', 'Albert Einstein'],
        'correctAnswer': 'Alexander Graham Bell',
      },
      {
        'question': 'Which language is the most spoken worldwide?',
        'options': ['English', 'Mandarin Chinese', 'Spanish', 'Hindi'],
        'correctAnswer': 'Mandarin Chinese',
      },
      {
        'question': 'What is the chemical symbol for water?',
        'options': ['O2', 'H2O', 'CO2', 'NaCl'],
        'correctAnswer': 'H2O',
      },
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kuis Bahasa Inggris'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _questions[_currentQuestionIndex]['question'],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                _questions[_currentQuestionIndex]['options'].length,
                (index) => ElevatedButton(
                  onPressed: () {
                    // Check if the selected answer is correct
                    if (_questions[_currentQuestionIndex]['options'][index] ==
                        _questions[_currentQuestionIndex]['correctAnswer']) {
                      // If correct, increase the score
                      setState(() {
                        _englishScore += 10;
                      });
                    }
                    // Move to the next question
                    _moveToNextQuestion();
                  },
                  child: Text(_questions[_currentQuestionIndex]['options'][index]),
                ),
              ),
            ),
            SizedBox(height: 20),
            ScoreWidget(score: _englishScore), // Show score
          ],
        ),
      ),
    );
  }

  // Function to move to the next question
  void _moveToNextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        // Show score when all questions are answered
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Kuis Selesai '),
              content: Text('Skor Anda: $_englishScore'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Tutup dialog
                    Navigator.pop(context); // Kembali ke halaman pilihan aktivitas
                  },
                  child: Text('Tutup'),
                ),
              ],
            );
          },
        );
      }
    });
  }
}
