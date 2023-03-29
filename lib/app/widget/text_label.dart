import 'package:flutter/material.dart';

class DebiturTextLabel extends StatelessWidget {
  final String text;

  const DebiturTextLabel({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
    );
  }
}

class DebiturTitleTextLabel extends StatelessWidget {
  final String text;

  const DebiturTitleTextLabel({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        color: Colors.grey[700],
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
      ),
      textAlign: TextAlign.left,
    );
  }
}

class DebiturSubtitleTextLabel extends StatelessWidget {
  final String text;

  const DebiturSubtitleTextLabel({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall?.merge(
            const TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
      textAlign: TextAlign.left,
    );
  }
}
