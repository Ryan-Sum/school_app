import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:school_app/data_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:school_app/widgets/app_bar.dart';

class MessageScreen extends StatefulWidget {
  final String teacher;
  final String className;

  const MessageScreen({
    Key? key,
    required this.teacher,
    required this.className,
  }) : super(key: key);
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  TextEditingController recipient = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController message = TextEditingController();

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future launchEmail(
      {required String recipient,
      required String subject,
      required String message}) async {
    final url =
        'mailto:$recipient?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';

    if (await canLaunch(url)) {
      await launch(url);
    } else {}
  }

  @override
  void initState() {
    super.initState();
    DataService(firebaseFirestore)
        .getEmailAddress(widget.teacher)
        .then((value) {
      recipient.text = value.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(title: widget.className),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.teacher),
            )),
            TextFormField(
              enabled: false,
              controller: recipient,
              style: const TextStyle(color: Colors.grey),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                prefix: Text(
                  'To: ${recipient.text}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: TextFormField(
                controller: subject,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Subject:',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: message,
              maxLines: 20,
              decoration: const InputDecoration(
                labelText: 'Email Content',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
            ),
            TextButton(
              onPressed: () => launchEmail(
                  recipient: recipient.text,
                  subject: subject.text,
                  message: message.text),
              child: const Text('Send'),
            )
          ],
        ),
      ),
    );
  }
}
