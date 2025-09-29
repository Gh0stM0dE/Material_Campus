import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class BbaPage extends StatelessWidget {
  final List<List<Map<String, String>>> subjects = [
    [
      {'name': 'Business Communication ', 'code': '101'},
      {'name': 'Environmental Since', 'code': '102'},
      {'name': 'IT Tools For Business', 'code': '103'},
      {
        'name': 'Fundamental Of Economics ',
        'code': '104'
      },
      {'name': 'Principles Of Management  ', 'code': '105'},
      {'name': 'Financial Accounting ', 'code': '106'},
      {'name': 'Syllabus', 'file': 'bba sem 1.pdf',},
      {'name': 'Old Question Paper'},
    ], // Subjects for Semester 1
    [
      {'name': 'Personality Development  ', 'code': '201'},
      {'name': 'E-Business', 'code': '202'},
      {'name': 'Accounting For Managers', 'code': '203'},
      {'name': 'Economics For Managers', 'code': '204'},
      {'name': 'Organizational Behaviour', 'code': '205'},
      {'name': 'Business Environment', 'code': '206'},
      {'name': 'Syllabus', 'file': 'bba sem 2.pdf'},
      {'name': 'Old Question Paper'},
    ], // Subjects for Semester 2
    [
      {'name': 'Statistical Methods', 'code': '301'},
      {'name': 'Software Engineering', 'code': '302'},
      {'name': 'Database handling using Python', 'code': '303'},
      {'name': 'OOPs and Data Structures', 'code': '304'},
      {'name': 'Web Designing – 1', 'code': '304-1'},
      {'name': 'Mobile Application Development – 1', 'code': '304-2'},
      {'name': 'Syllabus', 'file': 'bba sem 3.pdf'},
      {'name': 'Old Question Paper',},
    ], // Subjects for Semester 3
    [
      {'name': 'Information System', 'code': '401'},
      {'name': 'Internet of Things (IoT)', 'code': '402'},
      {'name': 'Java Programming', 'code': '403'},
      {'name': '.NET Programming', 'code': '404'},
      {'name': 'Web Designing-2', 'code': '405-1'},
      {'name': 'Mobile Application Development-2', 'code': '405-2'},
      {'name': 'Syllabus', 'file': 'bba sem 4.pdf'},
      {'name': 'Old Question Paper',},

    ], // Subjects for Semester 4
    [
      {'name': 'Advanced Web Designing', 'code': '501-1'},
      {'name': 'Advanced Mobile computing', 'code': '502-2'},
      {'name': 'UNIX and Shell Programming', 'code': '502'},
      {'name': 'Network Technology', 'code': '503'},
      {'name': 'Web Framework and Service', 'code': '504'},
      {'name': 'ASP .NET', 'code': '505'},
      {'name': 'Syllabus', 'file': 'bba sem 5.pdf'},
      {'name': 'Old Question Paper',},
    ], // Subjects for Semester 5
    [
      {'name': 'Computer Graphics', 'code': '601-1'},
      {'name': 'Fundamentals of Cloud Computing', 'code': '601-2'},
      {'name': 'E-Commerce and Cyber Security', 'code': '602'},
      {'name': 'Syllabus', 'file': 'bba sem 6.pdf'},
      {'name': 'Old Question Paper',},
    ], // Subjects for Semester 6
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'BBA',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          int semester = index + 1;
          return ExpansionTile(
            title: Text(
              'Semester $semester',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.black,
            children: List.generate(subjects[index].length, (subIndex) {
              Map<String, String> subject = subjects[index][subIndex];
              String? code = subject['code'] != null ? subject['code'] : '';
              return ListTile(
                title: Text(
                  '$code - ${subject['name']}',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  _openPDF(context, subject['file']!);
                },
              );
            }),
          );
        },
      ),
      backgroundColor: Colors.black,
    );
  }

  void _openPDF(BuildContext context, String fileName) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Set background color
          shape: RoundedRectangleBorder( // Set shape to rectangle
            borderRadius: BorderRadius.circular(10.0),
          ),
          content: Text(
            "Please wait, opening PDF...",
            style: TextStyle(color: Colors.black), // Set text color
          ),
        );
      },
    );

    try {
      final Reference ref = FirebaseStorage.instance.ref().child(fileName);
      final String url = await ref.getDownloadURL();
      final ByteData data = await NetworkAssetBundle(Uri.parse(url)).load('');
      Navigator.pop(context); // Close the dialog
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  title: Text(
                    'Material Campus',
                    style: TextStyle(color: Colors.white),
                  ),
                  iconTheme: IconThemeData(color: Colors.white),
                ),
                body: Container(
                  color: Colors.black,
                  child: PDFView(
                    filePath: null,
                    pdfData: data.buffer.asUint8List(),
                    fitPolicy: FitPolicy.WIDTH,
                    // Fit the PDF width to the display
                    onError: (error) {
                      print('Error opening PDF: $error');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error opening PDF!'),
                        ),
                      );
                    },
                  ),
                ),
              ),
        ),
      );
    } catch (e) {
      print('Error loading PDF: $e');
      Navigator.pop(context); // Close the dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error loading PDF!'),
        ),
      );
    }
  }
}