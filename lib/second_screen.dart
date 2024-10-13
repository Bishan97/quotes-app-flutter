import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String quoteText;
  final  String authorName;

  const SecondScreen ({super.key, required this.quoteText, required this.authorName});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Quote'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '"$quoteText"',
                style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                '- $authorName',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}