// home_page.dart

import 'package:flutter/material.dart';
import 'feedback_form_page.dart';
import 'counter_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Utama (Home)'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Selamat Datang di Aplikasi Demo Flutter!',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),

            // Tombol ke Tugas Utama: Formulir Feedback
            ElevatedButton.icon(
              icon: const Icon(Icons.rate_review),
              label: const Text('Buka Formulir Feedback'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FeedbackFormPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // Tombol ke Contoh Halaman Lain
            OutlinedButton.icon(
              icon: const Icon(Icons.calculate),
              label: const Text('Buka Contoh Counter'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CounterPage()),
                );
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
