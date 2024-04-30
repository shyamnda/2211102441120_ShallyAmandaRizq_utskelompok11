import 'package:flutter/material.dart';
import '../widgets/score_widget.dart'; // Import ScoreWidget

class MathGameScreen extends StatefulWidget {
  @override
  _MathGameScreenState createState() => _MathGameScreenState();
}

class _MathGameScreenState extends State<MathGameScreen> {
  int mathScore = 0;
  int currentQuestionIndex = 0;

  // List of math questions and their respective correct answers
    List<Map<String, dynamic>> mathQuestions = [
      {
        'question': 'Berapa hasil dari 3 x 4?',
        'options': ['12', '7', '8', '6'],
        'correctAnswer': '12',
      },
      {
        'question': 'Berapa hasil dari 5 + 7?',
        'options': ['10', '11', '12', '13'],
        'correctAnswer': '12',
      },
      {
        'question': 'Berapa hasil dari 10 - 3?',
        'options': ['6', '7', '8', '9'],
        'correctAnswer': '7',
      },
      {
        'question': 'Berapa hasil dari 6 ÷ 2?',
        'options': ['2', '3', '4', '5'],
        'correctAnswer': '3',
      },
      {
        'question': 'Berapa hasil dari 8 x 5?',
        'options': ['32', '35', '40', '45'],
        'correctAnswer': '40',
      },
      {
        'question': 'Berapa hasil dari 9 - 4?',
        'options': ['3', '4', '5', '6'],
        'correctAnswer': '5',
      },
      {
        'question': 'Berapa hasil dari 7 + 9?',
        'options': ['14', '15', '16', '17'],
        'correctAnswer': '16',
      },
      {
        'question': 'Berapa hasil dari 18 ÷ 3?',
        'options': ['4', '5', '6', '7'],
        'correctAnswer': '6',
      },
      {
        'question': 'Berapa hasil dari 20 - 9?',
        'options': ['9', '10', '11', '12'],
        'correctAnswer': '11',
      },
      {
        'question': 'Berapa hasil dari 4 x 9?',
        'options': ['32', '36', '40', '44'],
        'correctAnswer': '36',
      },
];

  void checkAnswer(String selectedAnswer) {
    String correctAnswer = mathQuestions[currentQuestionIndex]['correctAnswer'];
    if (selectedAnswer == correctAnswer) {
      setState(() {
        mathScore += 10; // Tambah 10 poin untuk jawaban benar
      });
    } else {
      // Skor tidak berkurang untuk jawaban salah
    }

    // Pindah ke pertanyaan berikutnya
    setState(() {
      if (currentQuestionIndex < mathQuestions.length - 1) {
        currentQuestionIndex++;
      } else {
        // Jika sudah di pertanyaan terakhir, tampilkan pesan atau lakukan sesuatu
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Permainan Selesai!'),
              content: Text('Skor Anda: $mathScore'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permainan Matematika'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              mathQuestions[currentQuestionIndex]['question'],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                mathQuestions[currentQuestionIndex]['options'].length,
                (index) => ElevatedButton(
                  onPressed: () {
                    checkAnswer(mathQuestions[currentQuestionIndex]['options'][index]);
                  },
                  child: Text(mathQuestions[currentQuestionIndex]['options'][index]),
                ),
              ),
            ),
            SizedBox(height: 20),
            ScoreWidget(score: mathScore), // Menampilkan skor
          ],
        ),
      ),
    );
  }
}
