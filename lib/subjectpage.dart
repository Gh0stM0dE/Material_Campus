import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubjectPage extends StatelessWidget {
  final int semester;
  final Map<String, String> subject;

  SubjectPage({required this.semester, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subject Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Semester: $semester'),
            Text('Subject Name: ${subject['name']}'),
            Text('Subject Code: ${subject['code']}'),
          ],
        ),
      ),
    );
  }
}
