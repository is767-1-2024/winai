
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
            NameCard(),
            Text('This page intentially blank'),
          ],
        ),
      ),
    );
  }
}