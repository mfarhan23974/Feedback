// main.dart

import 'package:flutter/material.dart';
import 'home_page.dart'; // Menggunakan home_page sebagai halaman awal

void main() {
  runApp(const FormFeedbackApp());
}

class FormFeedbackApp extends StatelessWidget {
  const FormFeedbackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'form_feedback_app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Set HomePage sebagai halaman awal aplikasi
      home: const HomePage(),
    );
  }
}
