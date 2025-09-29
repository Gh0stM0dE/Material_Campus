import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class BcaPage extends StatelessWidget {
  final List<List<Map<String, String>>> subjects = [
    [
      {'name': 'Communication Skills', 'code': '101', 'file': 'Comunication skills.pdf'},
      {'name': 'Mathematics-1', 'code': '102'},
      {'name': 'Introduction To Computers', 'code': '103', 'file': 'Introduction To Computers.pdf'},
      {'name': 'Computer Programming and Programming Methodology', 'code': '104', 'file': 'CPPM.pdf'},
      {'name': 'Data Processing and Analysis (DPA)', 'code': '105', 'file': 'DPA.pdf'},
      {'name': 'Old Question Paper'},
    ], // Subjects for Semester 1
    [
      {'name': 'Organizational Structure & Behavior', 'code': '201-1'},
      {'name': 'Introduction to Internet & HTML', 'code': '201-2'},
      {'name': 'Computerized Financial Accounting', 'code': '202-1'},
      {'name': 'Emerging Trends and Information Technology', 'code': '202-2'},
      {'name': 'Operating System - I', 'code': '203'},
      {'name': 'Programming Skills', 'code': '204'},
      {'name': 'Concepts of Relational Database Management System', 'code': '205'},
      {'name': 'Old Question Paper'},
    ], // Subjects for Semester 2
    [
      {'name': 'Statistical Methods', 'code': '301'},
      {'name': 'Software Engineering', 'code': '302'},
      {'name': 'Database handling using Python', 'code': '303'},
      {'name': 'OOPs and Data Structures', 'code': '304'},
      {'name': 'Web Designing – 1', 'code': '304-1'},
      {'name': 'Mobile Application Development – 1', 'code': '304-2'},
      {'name': 'Syllabus', 'file': 'BCA Sem 3 & 4 (Major-Minor-MDC-SEC-VAC) Syllabus as per NEP-2020 from 2024-25 (dt 26-04-2024).pdf'},
      {'name': 'Old Question Paper'},
    ], // Subjects for Semester 3
    [
      {'name': 'Information System', 'code': '401'},
      {'name': 'Internet of Things (IoT)', 'code': '402'},
      {'name': 'Java Programming', 'code': '403'},
      {'name':'.NET Programming', 'code': '404'},
      {'name': 'Web Designing-2', 'code': '405-1'},
      {'name': 'Mobile Application Development-2', 'code': '405-2'},
      {'name': 'Syllabus', 'file': 'BCA Sem 3 & 4 (Major-Minor-MDC-SEC-VAC) Syllabus as per NEP-2020 from 2024-25 (dt 26-04-2024).pdf'},
      {'name': 'Old Question Paper'},
    ], // Subjects for Semester 4
    [
      {'name': 'Advanced Web Designing', 'code': '501-1'},
      {'name': 'Advanced Mobile computing', 'code': '502-2'},
      {'name': 'UNIX and Shell Programming', 'code': '502'},
      {'name': 'Network Technology', 'code': '503'},
      {'name': 'Web Framework and Service', 'code': '504'},
      {'name': 'ASP .NET', 'code': '505'},
      {'name': 'Syllabus', 'file': 'BCA 5&6.pdf'},
      {'name': 'Old Question Paper'},
    ], // Subjects for Semester 5
    [
      {'name': 'Computer Graphics', 'code': '601-1'},
      {'name': 'Fundamentals of Cloud Computing', 'code': '601-2'},
      {'name': 'E-Commerce and Cyber Security', 'code': '602'},
      {'name': 'Syllabus', 'file': 'BCA 5&6.pdf'},
      {'name': 'Old Question Paper'},
    ], // Subjects for Semester 6
  ];

  final List<Map<String, String>> syllabus = [
    {'name': 'Syllabus For Cyber Security & Data Protection (Honours)', 'file': 'BCA Cyber Security & Data Protection (Honours) Sem 1 & 2 Syllabus from 2024-25 (dt 29-05-2024).pdf'},
    {'name': 'Syllabus For Artificial Intelligence & Data Analytics (Honours)', 'file': 'BCA Artificial Intelligence & Data Analytics (Honours) Sem 1 & 2 Syllabus from 2024-25 (dt 29-05-2024).pdf'},
    {'name': 'Syllabus For Semiconductor, Sensors & IoT (Honors)', 'file': 'BCA Semiconductor, Sensors & IoT (Honors) Sem 1 & 2 Syllabus from 2024-25 (dt 29-05-2024).pdf'},
    {'name': 'Syllabus For Framework (Honors)', 'file': 'BCA (Honors) Framework (Cyber Security & Data Protection-Semiconductor, Sensor & IoT-Artificial Intelligence & Data Analytics) from 2024-25 (dt 29-05-2024).pdf'},
  ];

  final List<Map<String, String>> specializations = [
    {'name': 'Cyber Security', 'file': 'Cyber Security.pdf'},
    {'name': 'Data Analytics', 'file': 'Data_Analytics.pdf'},
    {'name': 'IoT', 'file': 'IoT.pdf'},
    // Add more specializations as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'BCA',
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
            children: [
              ...subjects[index].map((subject) {
                return ListTile(
                  title: Text(
                    '${subject['code'] ?? ''} - ${subject['name']}',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    if (subject['file'] != null) {
                      _openPDF(context, subject['file']!);
                    }
                  },
                );
              }).toList(),
              if (index == 0 || index == 1) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Specialization',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      DropdownButton<String>(
                        dropdownColor: Colors.black,
                        isExpanded: true,
                        hint: Text(
                          'Select Specialization',
                          style: TextStyle(color: Colors.white),
                        ),
                        iconEnabledColor: Colors.white,
                        items: specializations.map((specialization) {
                          return DropdownMenuItem<String>(
                            value: specialization['file'],
                            child: Text(
                              specialization['name']!,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            _openPDF(context, newValue);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16), // Add space between dropdowns
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Syllabus',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      DropdownButton<String>(
                        dropdownColor: Colors.black,
                        isExpanded: true,
                        hint: Text(
                          'Select Syllabus',
                          style: TextStyle(color: Colors.white),
                        ),
                        iconEnabledColor: Colors.white,
                        items: syllabus.map((syllabus) {
                          return DropdownMenuItem<String>(
                            value: syllabus['file'],
                            child: Text(
                              syllabus['name']!,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            _openPDF(context, newValue);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16), // Additional spacing
              ],
            ],
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
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          content: Text(
            "Please wait, opening PDF...",
            style: TextStyle(color: Colors.black),
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
          builder: (context) => PDFViewer(
            pdfData: data.buffer.asUint8List(),
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

class PDFViewer extends StatelessWidget {
  final Uint8List pdfData;

  const PDFViewer({Key? key, required this.pdfData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: isLandscape ? null : AppBar(
        backgroundColor: Colors.black,
        title: Text('PDF Viewer'),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.black,
        child: PDFView(
          filePath: null,
          pdfData: pdfData,
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
    );
  }
}
