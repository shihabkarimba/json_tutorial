import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String image;
  final String name;
  final String email;

  DetailsPage(
      {required this.image,
      required this.name,
      required this.email,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Hi there \nI am $name',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(email),
          )
        ],
      ),
    );
  }
}
