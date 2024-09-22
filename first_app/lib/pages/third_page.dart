
import 'package:first_app/components/name_card.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Third Page'),
      ),
      body: Center(
        child: Column(
          children: [
            NameCard(
              data: NameCardData(
                name: 'Winai',
                dob: 'xx / xx /xxxx',
                imageUrl: 'https://mentor2code.com/assets/img/logo-small.png',
              ),
            ),
            Text('This page intentially blank'),
          ],
        ),
      ),
    );
  }
}