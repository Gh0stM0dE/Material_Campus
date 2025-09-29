import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white, // Set the background color to white
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/logo.png', // Path to your logo image
                    height: 100.0,
                    width: 100.0,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Welcome to Material Campus!',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'At Material Campus, we are committed to providing high-quality educational materials for students pursuing degrees in BCOM, BBA, BCA, and BSC-IT. Our app offers a comprehensive collection of resources designed to support your academic journey and help you achieve your educational goals.',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Our Mission',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Our mission is to make learning accessible and convenient for students everywhere. We strive to provide well-organized, up-to-date, and relevant materials that cater to the specific needs of BCOM, BBA, BCA, and BSC-IT students. By offering these resources in a user-friendly app, we aim to enhance the learning experience and support students in their academic endeavors.',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Our Vision',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Our vision is to be the leading provider of educational resources for higher education students, recognized for our commitment to quality, accessibility, and innovation. We aspire to create a learning platform that empowers students to excel academically and succeed in their chosen fields.',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Why Choose Us?',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '• Comprehensive Collection: We offer a wide range of materials for BCOM, BBA, BCA, and BSC-IT courses.\n'
                      '• Quality Content: Our materials are curated by experts to ensure accuracy and relevance.\n'
                      '• User-Friendly Interface: Our app is designed to be intuitive and easy to navigate.\n'
                      '• Regular Updates: We continuously update our content to keep pace with the latest academic trends and requirements.',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'If you have any questions, feedback, or suggestions, please feel free to reach out to us at materialcampus11@gmail.com. We value your input and look forward to hearing from you.',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Thank you for choosing Material Campus as your educational resource. We are dedicated to helping you succeed!',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
