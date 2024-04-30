import 'package:flutter/material.dart';
import 'english_quiz_screen.dart';
import 'math_game_screen.dart';
import 'science_activity_screen.dart';

class ActivityScreen extends StatelessWidget {
  final String name;
  final int age;
  final String address;
  final String phone;

  ActivityScreen({
    required this.name,
    required this.age,
    required this.address,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aktivitas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat datang, $name!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MathGameScreen(),
                  ),
                );
              },
              icon: Icon(Icons.calculate),
              label: Text('Permainan Matematika'),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EnglishQuizScreen(),
                  ),
                );
              },
              icon: Icon(Icons.language),
              label: Text('Kuis Bahasa Inggris'),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScienceActivityScreen(),
                  ),
                );
              },
              icon: Icon(Icons.science),
              label: Text('Sains'),
            ),
            SizedBox(height: 20),
            // Tombol "Selesai"
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Selesai'),
            ),
          ],
        ),
      ),
    );
  }
}
