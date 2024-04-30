import 'package:flutter/material.dart';
import '../widgets/score_widget.dart';

class ScienceActivityScreen extends StatefulWidget {
  @override
  _ScienceActivityScreenState createState() => _ScienceActivityScreenState();
}

class _ScienceActivityScreenState extends State<ScienceActivityScreen> {
  int _scienceScore = 0;
  int _currentQuestionIndex = 0;

  // List of science questions and their respective correct answers
  final List<Map<String, dynamic>> _scienceQuestions = [
        {
        'question': 'Apa simbol kimia untuk air?',
        'options': ['H2O', 'CO2', 'O2', 'N2'],
        'correctAnswer': 'H2O',
      },
      {
        'question': 'Gas mana yang digunakan oleh tanaman untuk fotosintesis?',
        'options': ['Oksigen', 'Nitrogen', 'Karbon Dioksida', 'Hidrogen'],
        'correctAnswer': 'Karbon Dioksida',
      },
      {
        'question': 'Siapa yang menemukan penisilin?',
        'options': ['Louis Pasteur', 'Alexander Fleming', 'Marie Curie', 'Albert Einstein'],
        'correctAnswer': 'Alexander Fleming',
      },
      {
        'question': 'Apa simbol kimia untuk oksigen?',
        'options': ['O2', 'CO2', 'H2O', 'N2'],
        'correctAnswer': 'O2',
      },
      {
        'question': 'Planet manakah yang dikenal sebagai Planet Merah?',
        'options': ['Mars', 'Jupiter', 'Saturnus', 'Bumi'],
        'correctAnswer': 'Mars',
      },
      {
        'question': 'Organisme yang paling besar di tubuh manusia adalah?',
        'options': ['Jantung', 'Hati', 'Otak', 'Kulit'],
        'correctAnswer': 'Kulit',
      },
      {
        'question': 'Apa fungsi utama paru-paru?',
        'options': ['Pencernaan', 'Peredaran Darah', 'Pernapasan', 'Ekskresi'],
        'correctAnswer': 'Pernapasan',
      },
      {
        'question': 'Benda padat apakah yang paling padat di Bumi?',
        'options': ['Emas', 'Intan', 'Timah', 'Platinum'],
        'correctAnswer': 'Platinum',
      },
      {
        'question': 'Apa yang menyebabkan pasang surut di lautan?',
        'options': ['Angin', 'Gravitasi', 'Gay magnet', 'Radiasi matahari'],
        'correctAnswer': 'Gravitasi',
      },
      {
        'question': 'Berapa titik beku air dalam skala Celsius?',
        'options': ['-100°C', '0°C', '100°C', '273°C'],
        'correctAnswer': '0°C',
      },
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tugas Sains'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _scienceQuestions[_currentQuestionIndex]['question'],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                _scienceQuestions[_currentQuestionIndex]['options'].length,
                (index) => ElevatedButton(
                  onPressed: () {
                    // Check if the selected answer is correct
                    if (_scienceQuestions[_currentQuestionIndex]['options'][index] ==
                        _scienceQuestions[_currentQuestionIndex]['correctAnswer']) {
                      // If correct, increase the score
                      setState(() {
                        _scienceScore += 10;
                      });
                    }
                    // Move to the next question
                    _moveToNextQuestion();
                  },
                  child: Text(_scienceQuestions[_currentQuestionIndex]['options'][index]),
                ),
              ),
            ),
            SizedBox(height: 20),
            ScoreWidget(score: _scienceScore), // Show score
          ],
        ),
      ),
    );
  }

  // Function to move to the next question
  void _moveToNextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _scienceQuestions.length - 1) {
        _currentQuestionIndex++;
      } else {
        // Show final score when all questions are answered
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tugas sains selesai '),
              content: Text('Skor Sains Anda: $_scienceScore'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                    Navigator.pop(context); // Go back to activity selection screen
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
