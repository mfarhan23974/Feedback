// test/widget_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// Import file-file lokal
import 'package:feedback/main.dart';
import 'package:feedback/feedback_form_page.dart';
import 'package:feedback/detail_page.dart';

void main() {
  // Grup pengujian untuk Navigasi dan Detail Halaman
  group('Feedback Form and Navigation Test', () {
    // Uji Navigasi dan Pengiriman Data
    testWidgets(
      'Mengisi form dan submit harus menavigasi ke DetailPage dengan data yang benar',
      (WidgetTester tester) async {
        // Muat aplikasi dari root widget
        await tester.pumpWidget(const FormFeedbackApp());

        // Navigasi ke halaman formulir terlebih dahulu (jika Anda menggunakan HomePage sebagai root)
        // Kita asumsikan Anda langsung menguji navigasi dari HomePage
        // Tekan tombol "Buka Formulir Feedback"
        await tester.tap(find.text('Buka Formulir Feedback'));
        await tester.pumpAndSettle(); // Tunggu navigasi selesai

        // VERIFIKASI SEKARANG KITA ADA DI HALAMAN FORMULIR
        expect(find.byType(FeedbackFormPage), findsOneWidget);

        const testName = 'Budi Test';
        const testComment = 'Sangat memuaskan!';
        const testRating = 4.0;

        // 1. Isi field Nama dan Komentar
        await tester.enterText(find.byType(TextFormField).first, testName);
        await tester.enterText(find.byType(TextFormField).last, testComment);

        // 2. Atur rating menjadi 4.0 (Simulasi tap pada bintang ke-4)
        final star = find
            .descendant(
              of: find.byType(RatingBar),
              matching: find.byIcon(Icons.star),
            )
            .at(3); // Bintang keempat memiliki index 3 (0-indexed)

        await tester.tap(star);
        await tester.pump();

        // 3. Tekan tombol Kirim
        await tester.tap(find.text('KIRIM & LIHAT HASIL'));
        await tester.pumpAndSettle(); // Menunggu navigasi ke DetailPage selesai

        // 4. Verifikasi Navigasi dan Data
        // Pastikan DetailPage telah muncul
        expect(find.byType(DetailPage), findsOneWidget);

        // 5. Verifikasi Data yang Ditampilkan
        expect(find.text(testName), findsOneWidget);
        expect(find.text(testComment), findsOneWidget);
        expect(
          find.text('(${testRating.toStringAsFixed(1)} dari 5)'),
          findsOneWidget,
        );
      },
    );
  });
}
