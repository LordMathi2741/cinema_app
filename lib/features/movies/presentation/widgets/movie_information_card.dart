import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieInformationCard extends StatelessWidget {
  final String title;
  final String overview;
  const MovieInformationCard({super.key, required this.title, required this.overview});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
            const SizedBox(height: 20),
            Text(
                overview
            )
          ],
        ),
      ),
    );
  }
}
