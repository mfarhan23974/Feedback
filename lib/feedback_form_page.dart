// feedback_form_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'detail_page.dart';

// Model Data untuk menampung hasil feedback
class FeedbackModel {
  final String name;
  final String comment;
  final double rating;

  FeedbackModel({
    required this.name,
    required this.comment,
    required this.rating,
  });
}

class FeedbackFormPage extends StatefulWidget {
  const FeedbackFormPage({super.key});

  @override
  State<FeedbackFormPage> createState() => _FeedbackFormPageState();
}

class _FeedbackFormPageState extends State<FeedbackFormPage> {
  // 1. Variabel dan Controller untuk State
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  double _rating = 3.0; // Nilai awal rating

  // 2. Fungsi Kirim Feedback dan Navigasi
  void _submitFeedback() {
    if (_formKey.currentState!.validate()) {
      // Buat objek model data
      final feedbackData = FeedbackModel(
        name: _nameController.text,
        comment: _commentController.text,
        rating: _rating,
      );

      // Navigasi ke Halaman 2 (DetailPage)
      // Menggunakan Navigator.push dan mengirim objek feedbackData
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(feedback: feedbackData),
        ),
      );

      // Opsional: Reset form setelah submit
      _nameController.clear();
      _commentController.clear();
      setState(() {
        _rating = 3.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman 1: Formulir Feedback'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // --- Input Nama ---
              const Text(
                'Nama Pemberi Feedback:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Masukkan nama Anda',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // --- Input Rating ---
              const Text(
                'Penilaian (1-5 Bintang):',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Center(
                child: RatingBar.builder(
                  initialRating: _rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) =>
                      const Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (rating) {
                    // setState digunakan untuk memperbarui data rating secara real-time
                    setState(() {
                      _rating = rating;
                    });
                  },
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Nilai saat ini: $_rating',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // --- Input Komentar ---
              const Text(
                'Komentar/Ulasan:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _commentController,
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'Tuliskan kritik atau saran Anda...',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Komentar tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              // --- Tombol Kirim ---
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitFeedback,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: const Text(
                    'KIRIM & LIHAT HASIL',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
