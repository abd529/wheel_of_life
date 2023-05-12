import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pdf/widgets.dart' as pdfWidgets;

class PDFScreen extends StatelessWidget {
  PDFScreen({super.key});
  final userId = FirebaseAuth.instance.currentUser!.uid;

  Future<void> createPdf() async {
  final pdf = pdfWidgets.Document();
  pdf.addPage(pdfWidgets.Page(
    build: (context) => pdfWidgets.Center(
      child: pdfWidgets.Text('Hellooooooooooo, world!', style: pdfWidgets.TextStyle(fontSize: 24)),
    ),
  ));
  final pdfBytes = await pdf.save();
  uploadPdfToFirebaseStorage(userId, pdfBytes);
  // Save pdfBytes to Firebase Cloud Storage
}

Future<void> uploadPdfToFirebaseStorage(String fileName, List<int> pdfBytes) async {
  final ref = FirebaseStorage.instance.ref().child(userId);
  await ref.putData(Uint8List.fromList(pdfBytes));
  // PDF file is now saved to Firebase Cloud Storage
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[ 
          ElevatedButton(onPressed: (){createPdf();}, child: const Text("Generate PDF")),
          ElevatedButton(onPressed: (){}, child: const Text("Save to Cloud Storage")),
          ]
          ))
    );
  }
}