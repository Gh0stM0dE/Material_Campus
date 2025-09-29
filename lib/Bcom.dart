import 'package:flutter/material.dart';
import 'package:material_campus/subjectpage.dart'; // Import the subject page

class BComPage extends StatelessWidget {
  final List<List<Map<String, String>>> subjects = [
    [
      {'name': 'Communication Skills', 'code': '101'},
      {'name': 'Mathematics-1', 'code': '102'},
      {'name': 'Introduction To Computers', 'code': '103'},
      {'name': 'Computer Programming and Programming Methodology', 'code': '104'},
      {'name': 'Pc Software-1', 'code': '105'},
      {'name': 'Syllabus'},
      {'name': 'Old Question Paper'},
    ], // Subjects for Semester 1
    [
      {'name': 'Subject 2A', 'code': 'SUB2A-101'},
      {'name': 'Subject 2B', 'code': 'SUB2B-101'},
      {'name': 'Subject 2C', 'code': 'SUB2C-101'},
    ], // Subjects for Semester 2
    [
      {'name': 'Subject 3A', 'code': 'SUB3A-101'},
      {'name': 'Subject 3B', 'code': 'SUB3B-101'},
      {'name': 'Subject 3C', 'code': 'SUB3C-101'},
    ], // Subjects for Semester 3
    [
      {'name': 'Subject 4A', 'code': 'SUB4A-101'},
      {'name': 'Subject 4B', 'code': 'SUB4B-101'},
      {'name': 'Subject 4C', 'code': 'SUB4C-101'},
    ], // Subjects for Semester 4
    [
      {'name': 'Subject 5A', 'code': 'SUB5A-101'},
      {'name': 'Subject 5B', 'code': 'SUB5B-101'},
      {'name': 'Subject 5C', 'code': 'SUB5C-101'},
    ], // Subjects for Semester 5
    [
      {'name': 'Subject 6A', 'code': 'SUB6A-101'},
      {'name': 'Subject 6B', 'code': 'SUB6B-101'},
      {'name': 'Subject 6C', 'code': 'SUB6C-101'},
    ], // Subjects for Semester 6
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'BCOM',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white), // Set back button color to white
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          int semester = index + 1;
          return ExpansionTile(
            title: Text(
              'Semester $semester',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.black,
            children: List.generate(subjects[index].length, (subIndex) {
              Map<String, String> subject = subjects[index][subIndex];
              return ListTile(
                title: Text(
                  '${subject['code']} - ${subject['name']}',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  _openSubjectPage(context, semester, subject);
                },
              );
            }),
          );
        },
      ),
      backgroundColor: Colors.black, // Set body background color to black
    );
  }

  void _openSubjectPage(BuildContext context, int semester, Map<String, String> subject) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SubjectPage(semester: semester, subject: subject),
      ),
    );
  }
}
