
import 'package:flutter/material.dart';

class NameCardData {
  const NameCardData({
    required this.name,
    required this.dob,
    required this.imageUrl,
  });

  final String name;
  final String dob;
  final String imageUrl;
}

class NameCard extends StatelessWidget{
  const NameCard({
    super.key,
    required this.data,
  });

  final NameCardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.0),
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 100.0,
              child: Image.network(data.imageUrl),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${data.name}'),
              Text('DOB: ${data.dob}'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, data.name);
                },
                child: Text('select'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
