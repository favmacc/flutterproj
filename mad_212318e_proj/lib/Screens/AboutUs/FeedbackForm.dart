import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';

class FeedbackForm extends StatefulWidget {
  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController feedbackController = TextEditingController();
  Future<void> sendEmail() async {
    final MailOptions mailOptions = MailOptions(
      subject: 'Feedback Form For Foodie Reviews',
      recipients: ['favianmak04@gmail.com'],
      body: feedbackController.text,
      isHTML: false,
    );
    await FlutterMailer.send(mailOptions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
          title: Text('Feedback Form'),
          backgroundColor: Color.fromRGBO(0, 168, 150, 1))),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 6,
                controller: feedbackController,
                decoration: InputDecoration(labelText: 'Feedback'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your feedback';
                  }
                  return null;
                },
              ),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    sendEmail();
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
