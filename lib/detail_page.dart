// detail_page.dart

import 'package:flutter/material.dart';
// Import FeedbackModel dari file sumbernya
import 'feedback_form_page.dart';

class DetailPage extends StatelessWidget {
  // Properti untuk menerima data feedback
  final FeedbackModel feedback;

  const DetailPage({required this.feedback, super.key});

  // Fungsi helper untuk membuat tampilan bintang
  Widget _buildRatingStars(double rating) {
    List<Widget> stars = [];
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    for (int i = 0; i < 5; i++) {
      if (i < fullStars) {
        stars.add(const Icon(Icons.star, color: Colors.amber, size: 28));
      } else if (i == fullStars && hasHalfStar) {
        stars.add(const Icon(Icons.star_half, color: Colors.amber, size: 28));
      } else {
        stars.add(const Icon(Icons.star_border, color: Colors.amber, size: 28));
      }
    }
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman 2: Detail Hasil Feedback'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // --- Header ---
            const Center(
              child: Text(
                'Ringkasan Umpan Balik',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            const Divider(height: 30, color: Colors.green),

            // --- Hasil Nama ---
            Text(
              'Nama Pemberi Feedback:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 5),
            Text(feedback.name, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),

            // --- Hasil Rating ---
            Text(
              'Rating Diberikan:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 5),
            Center(child: _buildRatingStars(feedback.rating)),
            Center(
              child: Text(
                '(${feedback.rating.toStringAsFixed(1)} dari 5)',
                style: const TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // --- Hasil Komentar ---
            Text(
              'Komentar:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                feedback.comment,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 40),

            // --- Tombol Kembali ---
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.arrow_back),
                label: const Text(
                  'KEMBALI KE FORMULIR',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  // Navigator.pop digunakan untuk kembali ke halaman sebelumnya
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
