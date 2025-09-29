import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  bool _isMessageSent = false;

  Future<void> _sendEmail() async {
    showDialog(
      context: context,
      barrierDismissible: false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return SendingMailDialog(); // show the dialog
      },
    );

    final smtpServer = gmail('materialcampus11@gmail.com', 'mliq fcif rpcb yazy'); // Replace with your email and password

    final message = Message()
      ..from = Address(_emailController.text, _nameController.text)
      ..recipients.add('materialcampus11@gmail.com')
      ..subject = _subjectController.text
      ..text = _messageController.text;

    try {
      final sendReport = await send(message, smtpServer);
      Navigator.of(context).pop(); // close the SendingMailDialog
      setState(() {
        _isMessageSent = true;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0), // Rounded corners
              side: BorderSide(color: Colors.black), // Black border
            ),
            backgroundColor: Colors.white, // White background
            title: Text('Success', style: TextStyle(color: Colors.black)), // Black title
            content: Text('Email sent successfully!', style: TextStyle(color: Colors.black)), // Black content text
            actions: <Widget>[
              TextButton(
                child: Text('OK', style: TextStyle(color: Colors.black)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      Navigator.of(context).pop(); // close the SendingMailDialog
      print('Message not sent. \n${e.toString()}');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0), // Rounded corners
              side: BorderSide(color: Colors.black), // Black border
            ),
            backgroundColor: Colors.white, // White background
            title: Text('Error', style: TextStyle(color: Colors.black)), // Black title
            content: Text('Failed to send email. Please try again later.', style: TextStyle(color: Colors.black)), // Black content text
            actions: <Widget>[
              TextButton(
                child: Text('OK', style: TextStyle(color: Colors.black)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/logo.png', // Ensure this image path is correct
                    height: 100.0,
                    width: 100.0,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'We would love to hear from you! If you have any questions, feedback, or suggestions, please feel free to reach out to us through any of the following methods:',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 16.0),
                ListTile(
                  leading: Icon(Icons.email, color: Colors.black),
                  title: Text(
                    'Email',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  subtitle: Text('materialcampus11@gmail.com'),
                ),
                ListTile(
                  leading: Icon(Icons.phone, color: Colors.black),
                  title: Text(
                    'Phone',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  subtitle: Text('+91 7203822222'),
                ),
                SizedBox(height: 32.0),
                Text(
                  'Or, send us a message directly:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Enter your name',
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Enter your email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _subjectController, // Added subject controller
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Subject',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Enter the subject',
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Message',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Enter your message',
                  ),
                  maxLines: 5,
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: _sendEmail,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Text(
                        "Send Message",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
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

class SendingMailDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0), // Rounded corners
        side: BorderSide(color: Colors.black), // Black border
      ),
      backgroundColor: Colors.white, // White background
      title: Text('Sending Email', style: TextStyle(color: Colors.black)), // Black title
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16.0),
          Text('Please wait while we send your message...', style: TextStyle(color: Colors.black)), // Black content text
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ContactUsPage(),
  ));
}
